<%-- 
    Document   : checkUser
    Created on : 23-Apr-2020, 22:37:43
    Author     : ADMIN
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="MyClasses.MyUtils"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
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
                        <li class='navItem'><a href='register.jsp'>Register</a></li>
                        <li class='navItem'><a href='login.jsp'>Login</a></li>
                    </ul>
                </nav>
            </div>
        </header>
        <%
            request.setCharacterEncoding("UTF-8");
            String email = request.getParameter("email");
            String pass = request.getParameter("pass");
            
            Connection con = MyUtils.getSiteDBconnection(application, "db\\myDB.mdb");
            Statement stmt = con.createStatement();

            String sql = "SELECT * FROM users WHERE email='" + email + "' And password='" + pass + "'";
            ResultSet rs = stmt.executeQuery(sql);
            if(rs.next())
            {
                Date date1=new SimpleDateFormat("dd/MM/yyyy").parse(rs.getString("birthdate"));  
                Date date2=new Date();
                long diffInMilliSec = date2.getTime() - date1.getTime();
                long years = (diffInMilliSec / (1000l * 60 * 60 * 24 * 365));
                
                session.setAttribute("email", rs.getString("email"));
                session.setAttribute("fname", rs.getString("first_name"));
                session.setAttribute("lname", rs.getString("last_name"));
                session.setAttribute("admin", rs.getString("admin"));
                session.setAttribute("age", "" + years);
                response.sendRedirect("index.jsp");
            }
            else
            {
                out.println("<center><h1 class='notice'>Wrong email or password.</h1></center>");
            }

            stmt.close();
            con.close();
        %>
        <footer>
            <hr id="cprule">
            <center><p id="cp">Website created by Alon Joseph. All rights reserved &copy; 2020</p></center>
        </footer>
    </body>
</html>
