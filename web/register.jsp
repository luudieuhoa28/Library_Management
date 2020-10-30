<%-- 
    Document   : register
    Created on : Jun 27, 2020, 3:51:39 PM
    Author     : dell
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
    </head>
    <body>
        <c:set var="errorRegister" value="${requestScope.ERROR_ACCOUNT}"/>
        <form action="MainController" method="POST">
            User name: <input type="text" name="userId" value="${requestScope.USER_ID_VALUE}" maxlength="50" required/></br>
            ${errorRegister.userIdError} </br>
            Full name: <input type="text" name="name" value="${requestScope.NAME_VALUE}" maxlength="50" required/></br>
            ${errorRegister.nameError} </br>
            Gender: <select name="cbxGender">
                <c:set var="strFemale" value="female"/>
                <c:if test="${requestScope.GENDER_VALUE.contains(strFemale)}">
                    <c:set var="isFemale" value="selected"/>
                </c:if>
                <c:if test="${!requestScope.GENDER_VALUE.contains(strFemale)}">
                    <c:set var="isFemale" value=""/>
                </c:if>
                <option value="male">Male</option>
                <option value="female" ${isFemale}>Female</option>
            </select><br/>
            Phone: <input type="text" name="phone" value="${requestScope.PHONE_VALUE}" maxlength="10"/></br>
            ${errorRegister.phoneError} </br>
            Address: <input type="text" name="address" value="${requestScope.ADDRESS_VALUE}" maxlength="200"/></br>
            Password: <input type="password" name="password" value="${requestScope.PASSWORD_VALUE}" maxlength="50" required/></br>
            Password again: <input type="password" name="rePassword" value="${requestScope.RE_PASSWORD_VALUE}" maxlength="50" required/></br>
            ${errorRegister.passwordError}</br>
            <input type="submit" name="btnAction" value="Create account"/>
        </form>
    </body>
</html>
