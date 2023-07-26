<%-- 
    Document   : index
    Created on : 21-Apr-2020, 16:39:22
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
        <title>Login</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            * {
                margin: 0;
                padding: 0;
            }
            body {
                background: #222222;
                font-family: 'Work Sans', sans-serif;
            }
            header {
                background: #65D081;
            }
            header::after {
                content: '';
                display: table;
                clear: both;
            }
            nav {
                float: right;
                cursor: default;
            }
            #navbar {
                width: 90%;
                margin: 0 auto;
            }
            #logo {
                float: left;
                width: fit-content;
                padding: 10px 0;
            }
            #navItems {
                margin: 0;
                padding: 0;
                list-style: none;
            }
            .navItem {
                display: inline-block;
                margin-left: 70px;
                padding-top: 23px;
                position: relative;
                cursor: default;
                font-weight: 600;
            }
            .navItem a {
                color: #444;
                text-decoration: none;
                text-transform: uppercase;
                font-size: 14px;
            }
            .navItem a:hover {
                color: #000;
            }
            .navItem a::before {
                content: '';
                display: block;
                height: 5px;
                width: 0%;
                background-color: #444;
                position: absolute;
                top: 0;
                transition: all ease-in-out 250ms;
            }
            .navItem a:hover::before {
                width: 100%;
            }
            #formDiv {
                width: 30%;
                margin: 0 auto;
                margin-top: 5em;
                background: #65D081;
            }
            #formTitle {
                text-align: center;
            }
            #form {
                margin-top: 3em;
                width: 100%;
                font-weight: 600;
            }
            #buttons {
                width: 100%;
                text-align: center;
                padding: 0.5em;
            }
            .button {
                background-color: #09AD94;
                border-radius: 8px;
                border: 2px solid #027866;
                color: white;
                padding: 8px 16px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                cursor: pointer;
                transition: all ease-in-out 300ms;
            }
            .button:hover {
                background-color: #007592;
                border: 2px solid #004252;
            }
            input[type=text], input[type=password], input[type=email], select {
                padding: 6px 10px;
                border: 1px solid #ccc;
                border-radius: 16px;
            }
            input[type=text]:focus, input[type=password]:focus, input[type=email]:focus, select:focus {
                outline: none;
                border: 2px solid #0098D0;
                box-shadow: inset 0 0 5px #00AAE9;
            }
            .notice {
                color: white;
                margin-top: 2em;
            }
            #cp {
                color: white;
                margin-top: 0.5em;
            }
            #cprule {
                margin-top: 3em;
            }
        </style>
        <script>
            function checkEmail() {
                const email = document.login.email.value;
                return email.length > 0;
            }
            function checkPass() {
                const pass = document.login.pass.value;
                return pass.length > 0;
            }
            function checkForm() {
                if(!checkEmail()) {
                    window.alert("Please enter an Email address.");
                    document.login.email.focus();
                    document.login.email.select();
                    return false;
                }
                if(!checkPass()) {
                    window.alert("Please enter a password.");
                    document.login.pass.focus();
                    document.login.pass.select();
                    return false;
                }
                return true;
            }
        </script>
    </head>
    <body>
        <header>
            <div id="navbar">
                <h1 id="logo">GameStore</h1>
                <nav>
                    <ul id="navItems">
                        <li class="navItem"><a href="index.jsp">Home</a></li>
                        <li class="navItem"><a href="about.jsp">About</a></li>
                        <li class="navItem"><a href="gallery.jsp">Gallery</a></li>
                        <%
                            if(session.getAttribute("email") != null) {
                                out.println("<li class='navItem'><a href='store.jsp'>Store</a></li>");
                                if(session.getAttribute("admin").equals("true"))
                                    out.println("<li class='navItem'><a href='admin.jsp'>Admin</a></li>");
                                out.println("<li class='navItem'><a href='logout.jsp'>Logout</a></li>");
                            } else {
                                out.println("<li class='navItem'><a href='register.jsp'>Register</a></li>");
                                out.println("<li class='navItem'><a href='login.jsp'>Login</a></li>");
                            }
                        %>
                    </ul>
                </nav>
            </div>
        </header>
        <%if(session.getAttribute("email") != null) { 
            out.println("<center><h1 class='notice'>You are already logged in.</h1></center>");
        } else { %>
            <div id="formDiv">
                <h1 id="formTitle">Login Form</h1>
                <form name="login" method="get" onsubmit="return checkForm()" action="checkUser.jsp">
                    <table id="form">
                        <tr>
                            <td>Email:</td>
                            <td><input type="email" name="email"></td>
                        </tr>
                        <tr>
                            <td>Password:</td>
                            <td><input type="password" name="pass"></td>
                        </tr>
                    </table>
                    <div id="buttons">
                        <input class="button" type="submit" value="Login">
                        <input class="button" type="reset" value="Clear">
                    </div>
                </form>
            </div>
        <%}%>
        <footer>
            <hr id="cprule">
            <center><p id="cp">Website created by Alon Joseph. All rights reserved &copy; 2020</p></center>
        </footer>
    </body>
</html>

