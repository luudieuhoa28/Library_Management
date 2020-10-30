/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author dell
 */
public class MainController extends HttpServlet {

    public final static String LOGIN = "LoginController";
    public final static String ERROR = "error_page.jsp";
    public final static String REGISTER = "RegisterController";
    public final static String LOGOUT = "LogoutController";
    public final static String SEARCH = "SearchController";
    public final static String UPDATE_BOOK_PAGE = "UpdateBookPageController";
    public final static String UPDATE_BOOK = "UpdateBookController";
    public final static String DELETE_BOOK = "DeleteBookController";
    public final static String ADD_BOOK = "AddBookController";
    public final static String SHOW_BOOK_INFO = "ShowBookInfoController";
    public final static String ADD_TO_CARD = "AddToCardController";
    public final static String BORROW_BOOK = "BorrowBookController";
    public final static String UPDATE_CART = "UpdateCartController";
    public final static String DELETE_BOOK_CART = "DeteleBookCartController";
    public final static String SHOW_BORROWED_BOOK = "ShowListBorrowedBookController";
    public final static String RETURN_BOOK = "ReturnBookController";
    public final static String CHANGE_PASSWORD = "ChangePasswordController";
    public final static String GET_LIST_USER = "GetListUserController";
    public final static String DISABLE_USER = "DisableUserController";
    public final static String UPDATE_PROFILE = "UpDateProfileController";
    public final static String VIEW_PROFILE = "ViewProfileController";
    public final static String ENABLE_USER = "EnableUserController";
    public final static String VIEW_CART = "ViewCartController";

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
        String url = ERROR;
        try {
            String action = request.getParameter("btnAction");
            switch (action) {
                case "Login":
                    url = LOGIN;
                    break;
                case "Create account":
                    url = REGISTER;
                    break;
                case "Search":
                    url = SEARCH;
                    break;
                case "Logout":
                    url = LOGOUT;
                    break;
                case "Update Page":
                    url = UPDATE_BOOK_PAGE;
                    break;
                case "Update Book":
                    url = UPDATE_BOOK;
                    break;
                case "Delete Book":
                    url = DELETE_BOOK;
                    break;
                case "Add Book":
                    url = ADD_BOOK;
                    break;
                case "ShowBookInfo":
                    url = SHOW_BOOK_INFO;
                    break;
                case "Add to cart":
                    url = ADD_TO_CARD;
                    break;
                case "Borrow":
                    url = BORROW_BOOK;
                    break;
                case "Update Cart":
                    url = UPDATE_CART;
                    break;
                case "Delete":
                    url = DELETE_BOOK_CART;
                    break;
                case "ListBorrowedBook":
                    url = SHOW_BORROWED_BOOK;
                    break;
                case "Return Books":
                    url = RETURN_BOOK;
                    break;
                case "Change password":
                    url = CHANGE_PASSWORD;
                    break;
                case "GetListUser":
                    url = GET_LIST_USER;
                    break;
                case "Disable User":
                    url = DISABLE_USER;
                    break;
                case "Update profile":
                    url = UPDATE_PROFILE;
                    break;
                case "ViewProfile":
                    url = VIEW_PROFILE;
                    break;
                case "Enable User":
                    url = ENABLE_USER;
                    break;
                case "ViewCart":
                    url = VIEW_CART;
                    break;
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
