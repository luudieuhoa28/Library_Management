/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import daos.BookDAO;
import daos.OrderDAO;
import dtos.BookDTO;
import dtos.CartDTO;
import dtos.OrderDTO;
import dtos.OrderDetailDTO;
import dtos.UserDTO;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author dell
 */
public class BorrowBookController extends HttpServlet {

    public final static String BORROW_BOOK_CART_VIEW = "view_cart.jsp";
    public final static String BORROW_BOOK_CART_INFO = "ShowBookInforController";
    public final static String BORROW_BOOK_CART_SEARCH = "SearchController";
    public final static String BORROW_BOOK_CART_ERROR = "error_page.jsp";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = BORROW_BOOK_CART_ERROR;
        try {
            HttpSession session = request.getSession();
            UserDTO userDTO = (UserDTO) session.getAttribute("USER_DTO");
            String userId = userDTO.getUserId();
            //get current date
            DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
            Date currentDate = new Date();
            String borrowDate = dateFormat.format(currentDate);
            //get return date (1 month later)
            Calendar c = Calendar.getInstance();
            c.setTime(currentDate);
            c.add(Calendar.MONTH, 1);
            Date currentDatePlusOne = c.getTime();
            String returnDate = dateFormat.format(currentDatePlusOne);

            OrderDTO orderDTO = new OrderDTO(userId, borrowDate, returnDate);
            int quantity = 1;
            //this action get from book_infor
            if (request.getParameter("bookId") != null) {
                //get bookId to check if this book is availble or not
                String bookId = request.getParameter("bookId");
                BookDTO bookDTO = BookDAO.getBook(bookId);
                if (bookDTO != null) {
                    //this is from book_infor
                    if (request.getParameter("quantityInCart") != null) {
                        try {
                            //this is the number of user input from book_infor.jsp
                            quantity = Integer.parseInt(request.getParameter("quantityInCart"));
                            int available = bookDTO.getAvailableBook();
                            //check this number is valid or not
                            if (quantity <= available && quantity > 0) {
                                OrderDetailDTO orderDetailDTO = new OrderDetailDTO(bookId, quantity);
                                boolean result = OrderDAO.addOrder(orderDTO, orderDetailDTO);
                                if (result) {
                                    request.setAttribute("BORROW_MESSAGE", "Borrow successfully!!!");
                                } else {
                                    request.setAttribute("BORROW_MESSAGE", "Something wrong hereee!!!");
                                }
                            } else {
                                request.setAttribute("BORROW_MESSAGE", "The number of this book is invalid!!!");
                            }
                        } catch (Exception e) {
                            request.setAttribute("BORROW_MESSAGE", "Please enter quantity!!!");
                        }
                        url = BORROW_BOOK_CART_INFO;
                    }
                } else {
                    url = BORROW_BOOK_CART_SEARCH;
                    request.setAttribute("BORROW_MESSAGE", "The book is not available!!!");
                }
                //this action get from view_cart.jsp
            } else {
                CartDTO cartDTO = (CartDTO) session.getAttribute("CART");
                if (cartDTO != null) {
                    Set setKey = cartDTO.getCart().keySet();
                    Iterator it = setKey.iterator();
                    List<OrderDetailDTO> listDetail = new ArrayList<>();
                    boolean check = true;
                    //get listDetail form CART
                    while (it.hasNext()) {
                        String bookId = (String) it.next();
                        //check all book is existed in db anymore or not
                        BookDTO bookDTO = BookDAO.getBook(bookId);
                        if (bookDTO != null) {
                            BookDTO bookDTOInCart = cartDTO.getCart().get(bookId);
                            int avaiBook = bookDTO.getAvailableBook();
                            int numInCart = bookDTOInCart.getNumInCart();
                            if (numInCart > avaiBook) {
                                check = false;
                                break;
                            } else {
                                OrderDetailDTO orderDetailDTO = new OrderDetailDTO(bookDTO.getBookId(), bookDTOInCart.getNumInCart());
                                listDetail.add(orderDetailDTO);
                            }
                        } else {
                            request.setAttribute("BORROW_MESSAGE", "Some books do not exist anymore!!!");
                            check = false;
                            break;
                        }
                    }
                    if (check) {
                        //insert order and orderdetail into db
                        boolean result = OrderDAO.addOrderCart(orderDTO, listDetail);
                        if (result) {
                            request.setAttribute("BORROW_MESSAGE", "Borrow successfully!!!");
                            session.setAttribute("CART", null);
                        } else {
                            request.setAttribute("BORROW_MESSAGE", "Something wrong hereee!!!");
                        }
                    } else {
                        request.setAttribute("BORROW_MESSAGE", "Check your cart again!!!");
                    }
                    url = BORROW_BOOK_CART_VIEW;
                }
            }
        } catch (Exception e) {
            log(e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
