<%-- 
    Document   : index
    Created on : 21-Apr-2020, 16:39:22
    Author     : ADMIN
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="MyClasses.MyUtils"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        request.setCharacterEncoding("UTF-8");
        String id = request.getParameter("id");
        if(id == null) id = "0";
        Connection con = MyUtils.getSiteDBconnection(application, "db\\myDB.mdb");
        Statement stmt = con.createStatement();
        String sql = "SELECT * FROM shop WHERE id=" + id;
        ResultSet rs = stmt.executeQuery(sql);
        boolean found = rs.next();
    %>
    <head>
        <link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
        <%
            if(found)
                out.println("<title>" + rs.getString("name") + "</title>");
            else
                out.println("<title>Error</title>");
        %>
        <title>Home</title>
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
            #container {
                width: 80%;
                background: #CFCFCF;
                margin: 0 auto;
                margin-top: 2em;
            }
            #overview {
                width: 70%;
                float: left;
            }
            #imagediv {
                width: 30%;
                float: left;
            }
            #title {
                margin: 0.4em 0;
                text-align: center;
            }
            .image {
                width: 70%;
                float: right;
            }
            #descbox {
                margin: 1em 0;
                width: 70%;
            }
            #desc {
                font-size: 20px;
            }
            #under {
                width: 30%;
                float: right;
            }
            #container::after {
                content: "";
                display: table;
                clear: both;
            }
            .warn {
                margin-left: 1em;
                font-weight: 600;
                color: red;
            }
            .bold {
                margin-left: 1em;
                font-weight: 600;
            }
            .price {
                font-weight: 600;
                color: green;
            }
            #price {
                font-size: 20px;
                width: 70%;
                float: right;
            }
            #buy {
                font-size: 20px;
                width: 70%;
                float: right;
                margin: 1em 0;
            }
            .button {
                background-color: #65D081;
                border-radius: 8px;
                border: 2px solid #50A767;
                color: white;
                padding: 8px 16px;
                text-align: center;
                text-decoration: none;
                cursor: pointer;
                transition: all ease-in-out 300ms;
                font-size: 20px;
            }
            .button:hover {
                background-color: #197D33;
                border: 2px solid #317A44;
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
        <%
            if(session.getAttribute("email") == null) {
                out.println("<center><h1 class='notice'>You must be logged in to view this page.</h1></center>");
            } else if(!found) {
                out.println("<center><h1 class='notice'>The game was not found.</h1></center>");
            } else if(Integer.valueOf((String)session.getAttribute("age")) < rs.getInt("age")) {
                out.println("<center><h1 class='notice'>You are not old enough to view this game.</h1></center>");
            } else {
        %>
        <div id='container'>
            <div id='overview'>
                <%out.println("<h1 id='title'>" + rs.getString("name") + "</h1>");%>
                <center>
                    <div id='descbox'>
                        <%out.println("<p id='desc'>" + rs.getString("description") + "</p>");%>
                    </div>
                </center>
                <%out.println("<p><span class='warn'>Platform: </span>" + rs.getString("platform") + "</p>");%>
                <%out.println("<p><span class='warn'>Age Restriction: </span>PG-" + rs.getString("age") + "</p>");%>
                <br><br>
                <%
                    String genres = "";
                    ArrayList<String> genresList = MyUtils.getGenres(Integer.valueOf(rs.getString("genre")));
                    for(String g : genresList) {
                        String str = "";
                        if(g.equals("broyale")) str = "Battle Royale";
                        else if(g.equals("fps")) str = "FPS";
                        else str = g.substring(0, 1).toUpperCase() + g.substring(1);
                        genres += str + ", ";
                    }
                    genres = genres.substring(0, genres.length() - 2);
                    out.println("<p><span class='bold'>Genres: </span>" + genres + "</p>");
                %>
            </div>
            <div id='imagediv'>
                <%out.println("<img class='image' width='600' height='400' src='" + rs.getString("image") + "'>");%>
            </div>
            <div id='under'>
                <div id='price'>
                    <%out.println("<p><span class='price'>Price: </span>₪" + rs.getString("price") + "</p>");%>
                </div>
                <div id='buy'>
                    <center>
                        <%out.println("<button class='button' onclick='window.open(\"" + rs.getString("link") + "\", \"_blank\")'>Buy Now!</button>");%>
                    </center>
                </div>
            </div>
        </div>
        <%}%>
        <footer>
            <hr id="cprule">
            <center><p id="cp">Website created by Alon Joseph. All rights reserved &copy; 2020</p></center>
        </footer>
    </body>
</html>

