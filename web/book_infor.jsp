<%-- 
    Document   : book_infor
    Created on : Jul 1, 2020, 3:56:27 PM
    Author     : dell
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book Information Page</title>
    </head>
    <body>
        <a href="view_cart.jsp">View Cart</a>
        <a href="SearchController?txtSearch=${param.txtSearch}">Search</a>
        <c:if test="${requestScope.BOOK_DTO != null}">
            <c:set var="bookDTO" value="${requestScope.BOOK_DTO}"/>
            <table border="1">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Author</th>
                        <th>Publisher</th>
                        <th>Export Year</th>
                        <th>Available</th>
                        <th>Quantity</th>
                    </tr>
                </thead>
                <tbody>
                <form action="MainController" method="post">
                    <tr>
                        <td>${bookDTO.bookId}</td>
                    <input type="hidden" name="bookId" value="${bookDTO.bookId}"/>
                    <td>${bookDTO.bookName}</td>
                    <input type="hidden" name="bookName" value="${bookDTO.bookName}"/>
                    <td>${bookDTO.author}</td>
                    <input type="hidden" name="author" value="$bookDTO.author}"/>
                    <td>${bookDTO.publisher}</td>
                    <input type="hidden" name="publisher" value="${bookDTO.publisher}"/>
                    <td>${bookDTO.yearOfExport}</td>
                    <input type="hidden" name="exportYear" value="${bookDTO.yearOfExport}"/>
                    <td>${bookDTO.availableBook}</td>
                    <input type="hidden" name="available" value="${bookDTO.availableBook}"/>
                    <td><input type="text" name="quantityInCart" value="${requestScope.NUM_IN_CARD}"/></td>
                    <input type="hidden" name="txtSearch" value="${param.txtSearch}"/>
                    <c:if test="${requestScope.AVAILABLE > 0}">
                        <c:set var="isDisabled" value=""/>
                    </c:if>
                    <c:if test="${requestScope.AVAILABLE == 0}">
                        <c:set var="isDisabled" value="disabled"/>
                    </c:if>
                    <td>
                        <input type="submit" name="btnAction" value="Add to cart" ${isDisabled}/>
                    </td>
                    <td>
                        <input type="submit" name="btnAction" value="Borrow" ${isDisabled}/>
                    </td>
                    </tr>
                </form>
            </tbody>
        </table>
    </c:if>
    <p>${requestScope.MESSAGE_CART}</p>
    <p>${requestScope.BORROW_MESSAGE}</p>
</body>
</html>
