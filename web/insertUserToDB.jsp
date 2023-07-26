<%-- 
    Document   : insertUserToDB
    Created on : 30/01/2020, 12:52:50
    Author     : idit russo
--%>

<%@page import="java.sql.Statement"%>
<%@page import="MyClasses.MyUtils"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
        <title>Register</title>
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
            String fname = request.getParameter("fname");
            String lname = request.getParameter("lname");
            String pass = request.getParameter("pass");
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
            int genre = 0;
            
            Connection con = MyUtils.getSiteDBconnection (application, "db\\myDB.mdb");
            Statement stmt = con.createStatement();

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
            
            String sqlStr = "SELECT * FROM users WHERE email='" + email + "'";
            ResultSet rs = stmt.executeQuery(sqlStr);
            
            if(rs.next())
            {
               out.print("<center><h2 class='notice'>Email already registered.</h2></center>");
            }
            else
            {
                sqlStr = "INSERT INTO users VALUES"
                + "('" + email + "','"+  pass +"','"+ fname +"','"+ lname +
                "','"+ bday +"/"+ bmonth +"/"+ byear +"','"+ gender +"','"
                        + genre +"','"+ phonePrefix +"','"+ phoneNum +"','false')";
                 stmt.executeUpdate(sqlStr);
                 out.print("<center><h2 class='notice'>User " + fname + " " + lname + " registered successfuly. Please log in.</h2></center>");
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
