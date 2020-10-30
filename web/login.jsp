<%-- 
   Document   : login
   Created on : Jun 25, 2020, 4:41:26 PM
   Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <form action="MainController" method="post">
            User name<input type="text" name="userId" required/></br>
            Password<input type="password" name="password" required/></br>
            <input type="submit" name="btnAction" value="Login"/>        
            <input type="reset" value="Reset"/></br>
            <a href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8084/FinalProjectPRJ321/googlecallback&response_type=code
               &client_id=321765933526-j5blsda3p6483mjffa9djo9peqh2j16p.apps.googleusercontent.com&approval_prompt=force">Login With Google</a>  
        </form>
        <a href="register.jsp">Create an account</a>
    </body>
</html>
