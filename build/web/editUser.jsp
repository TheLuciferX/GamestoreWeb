<%-- 
    Document   : index
    Created on : 21-Apr-2020, 16:39:22
    Author     : ADMIN
--%>

<%@page import="MyClasses.MyUtils"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
        <title>Edit</title>
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
        <%if(session.getAttribute("admin") == null || !session.getAttribute("admin").equals("true")) {
            out.println("<center><h1 class='notice'>You have no permission to view this page.</h1></center>");
        } else {
            request.setCharacterEncoding("UTF-8");
            String email = request.getParameter("email");
            String fname = request.getParameter("fname");
            String lname = request.getParameter("lname");
            String bday = request.getParameter("day");
            String bmonth = request.getParameter("month");
            String byear = request.getParameter("year");
            String gender = request.getParameter("gender");
            String phonePrefix = request.getParameter("phoneprefix");
            String phoneNum = request.getParameter("phonenum");
            String action = request.getParameter("action");
            String sports = request.getParameter("sports");
            String broyale = request.getParameter("broyale");
            String roleplay = request.getParameter("roleplay");
            String adventure = request.getParameter("adventure");
            String racing = request.getParameter("racing");
            String fighting = request.getParameter("fighting");
            String strategy = request.getParameter("strategy");
            String simulator = request.getParameter("simulator");
            String admin = request.getParameter("admin") == null ? "false" : "true";
            int genre = 0;
            
            if(action!=null)
               genre += 1;
            if(sports!=null)
               genre += 2;
            if(broyale!=null)
               genre += 4;
            if(roleplay!=null)
               genre += 8;
            if(adventure!=null)
               genre += 16;
            if(racing!=null)
               genre += 32;
            if(fighting!=null)
               genre += 64;
            if(strategy!=null)
               genre += 128;
            if(simulator!=null)
               genre += 256;
            if(simulator!=null)
               genre += 256;
            
            Connection con = MyUtils.getSiteDBconnection (application, "db\\myDB.mdb");
            Statement stmt = con.createStatement();
            String sqlStr = "UPDATE users SET first_name='"+ fname +"',last_name='"+ lname +"',birthdate='"+ bday + "/" + bmonth + "/" + byear +"',gender='"+ gender +"',genre='"+ genre +"',phone_prefix='"+ phonePrefix + "',phone_number='"+ phoneNum + "', admin='" + admin + "' WHERE email='"+ email +"'";
            stmt.executeUpdate(sqlStr);
            stmt.close();
            con.close();
            out.println("<center><h1 class='notice'>Successfuly updated " + fname + " " + lname + ".</h1></center>");
        }%>
        <footer>
            <hr id="cprule">
            <center><p id="cp">Website created by Alon Joseph. All rights reserved &copy; 2020</p></center>
        </footer>
    </body>
</html>

