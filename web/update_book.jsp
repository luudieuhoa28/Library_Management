<%-- 
    Document   : update_book
    Created on : Jun 28, 2020, 4:51:31 PM
    Author     : dell
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update book Page</title>
    </head>
    <body>
        <a href="SearchController?txtSearch=${param.txtSearch}">Search</a>  
        <c:set var="bookError" value="${requestScope.BOOK_ERROR}"/>
        <c:set var="bookDTO" value="${requestScope.BOOK_DTO}"/>
        <form action="MainController" method="POST">
            Book ID: <input type="text" readonly value="${bookDTO.bookId}" name="bookId"/><br/>
            <br/>
            Name: <input type="text" value="${bookDTO.bookName}" name="bookName" maxlength="50" required/><br/>
            ${bookError.bookNameError}<br/>
            Author: <input type="text" value="${bookDTO.author}" name="bookAuthor" maxlength="50"/><br/>
            <br/>
            Publisher: <input type="text" value="${bookDTO.publisher}" name="bookPublisher" maxlength="50"/><br/>
            <br/>
            Export year: <input type="text" value="${bookDTO.yearOfExport}" name="yearOfExport" maxlength="10"/><br/>
            ${bookError.bookYearExError}<br/>
            Total<input type="number" value="${bookDTO.totalBook}" name="bookTotal" required/><br/>
            ${bookError.bookTotalError}<br/>
            Available: <input type="number" readonly value="${bookDTO.availableBook}" name="bookAvailable"/><br/>
            <br/>
            <input type="hidden" name="txtSearch" value="${param.txtSearch}">
            <input type="submit" name="btnAction" value="Update Book"/>
        </form>
        ${requestScope.UPDATE_BOOK_SUCCESS}


    </body>
</html>
