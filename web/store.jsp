<%-- 
    Document   : index
    Created on : 21-Apr-2020, 16:39:22
    Author     : ADMIN
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="MyClasses.MyUtils"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
        <title>Store</title>
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
            #search {
                width: 90%;
                margin: 0 auto;
                margin-top: 2em;
                background-color: #C3C3C3;
                padding: 0;
            }
            #searchDiv {
                vertical-align: bottom;
                float: left;
                width: 30%;
                margin: 0;
                display: inline-block;
            }
            #filterDiv {
                vertical-align: bottom;
                float: left;
                width: 70%;
                margin: 0;
                display: inline-block;
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
                margin-top: 0.3em;
                margin-bottom: 1em;
            }
            .button:hover {
                background-color: #007592;
                border: 2px solid #004252;
            }
            input[type=text], select {
                margin-top: 1em;
                padding: 6px 10px;
                border: 1px solid #ccc;
                border-radius: 16px;
            }
            input[type=text]:focus, select:focus {
                outline: none;
                border: 2px solid #0098D0;
                box-shadow: inset 0 0 5px #00AAE9;
            }
            #items {
                width: 90%;
                margin: 0 auto;
                margin-top: 2em;
                background-color: #C3C3C3;
                padding: 0;
            }
            .fourth {
                width: 25%;
                float: left;
            }
            @media only screen and (max-width: 1000px) {
                .fourth {
                    width: 50%;
                }
            }
            @media only screen and (max-width: 600px) {
                .fourth {
                    width: 100%;
                }
            }
            .card {
                position: relative;
                width: 65%;
                margin: 1em auto;
                border: 2px solid #888;
                background-color: white;
                padding-bottom: 3em;
            }
            .card:hover {
                border: 2px solid #444;
            }
            .card img {
                border-bottom: 2px solid #888;
                max-width: 100%;
                max-height: 350px;
            }
            .button2 {
                background-color: #65D081;
                border-radius: 8px;
                border: 2px solid #50A767;
                color: white;
                padding: 8px 16px;
                text-align: center;
                text-decoration: none;
                cursor: pointer;
                transition: all ease-in-out 300ms;
                position: absolute;
                right: 10px;
                bottom: 10px;
            }
            .button2:hover {
                background-color: #197D33;
                border: 2px solid #317A44;
            }
            #card::after, #items::after, #search::after {
                content: "";
                display: table;
                clear: both;
            }
            
            .fourty {
                width: 40%;
            }
            .sixty {
                width: 60%;
            }
            #grid {
                width: 100%;
            }
        </style>
        <script>
            function viewItem(id) {
                const form = document.createElement("form");
                const id2 = document.createElement("input"); 
                form.method = "GET";
                form.action = "game.jsp";   
                id2.value=id;
                id2.name="id";
                form.appendChild(id2);
                document.body.appendChild(form);
                form.submit();
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
        <%if(session.getAttribute("email") == null) {
            out.println("<center><h1 class='notice'>You must be logged in to view this page.</h1></center>");
        } else {%>
            <div id='search'>
                <div id='searchDiv'>
                    <form name="search" method="get" onsubmit="return true" action="store.jsp">
                        <center>
                            <input type='text' name='text' placeholder='search'>
                            <br>
                            <input class='button' type='submit' value="Search">
                        </center>
                    </form>
                </div>
                <div id='filterDiv'>
                    <form name="filter" method="get" onsubmit="return true" action="store.jsp">
                        <center>
                            <select name="genre">
                                <option value="0">All Genres</option>
                                <option value="action">Action</option>
                                <option value="sports">Sports</option>
                                <option value="broyale">Battle Royale</option>
                                <option value="roleplay">Role Playing</option>
                                <option value="adventure">Adventure</option>
                                <option value="racing">Racing</option>
                                <option value="fighting">Fighting</option>
                                <option value="strategy">Strategy</option>
                                <option value="simulator">Simulator</option>
                                <option value="fps">FPS</option>
                                <option value="platform">Platform</option>
                            </select>
                            <select name="age">
                                <option value="0">All Ages</option>
                                <option value="3">PG-3</option>
                                <option value="6">PG-6</option>
                                <option value="10">PG-10</option>
                                <option value="13">PG-13</option>
                                <option value="17">PG-17</option>
                                <option value="18">PG-18</option>
                            </select>
                            <select name="platform">
                                <option value="0">All Platforms</option>
                                <option value="PC">PC</option>
                                <option value="PS 4">PS 4</option>
                                <option value="Xbox One">Xbox One</option>
                                <option value="Nintendo Switch">Nintendo Switch</option>
                            </select>
                            <select name="price">
                                <option value="0">All Prices</option>
                                <option value="1-100">₪1-₪100</option>
                                <option value="1-200">₪1-₪200</option>
                                <option value="100-200">₪100-₪200</option>
                                <option value="100-300">₪100-₪300</option>
                                <option value="200-300">₪200-₪300</option>
                            </select>
                            <br>
                            <input class='button' type='submit' value="Filter">
                        </center>
                    </form>
                </div>
            </div>
            <div id='items'>
                <%
                    request.setCharacterEncoding("UTF-8");
                    String text = request.getParameter("text");
                    String genre = request.getParameter("genre");
                    String age = request.getParameter("age");
                    String platform = request.getParameter("platform");
                    String price = request.getParameter("price");

                    if(text == null) text = "";
                    if(genre == null) genre = "0";
                    if(age == null) age = "0";
                    if(platform == null) platform = "0";
                    if(price == null) price = "0";
            
                    Connection con = MyUtils.getSiteDBconnection(application, "db\\myDB.mdb");
                    Statement stmt = con.createStatement();
                    String sql = "SELECT * FROM shop";
                    
                    if(!age.equals("0"))
                        sql += " WHERE age=" + age;
                    if(!platform.equals("0")) {
                        if(sql.contains("WHERE"))
                            sql += " AND platform='" + platform + "'";
                        else
                            sql += " WHERE platform='" + platform + "'";
                    }
                    if(!price.equals("0")) {
                        int firstVal = Integer.valueOf(price.split("-")[0]);
                        int secondVal = Integer.valueOf(price.split("-")[1]);
                        if(sql.contains("WHERE"))
                            sql += " AND price BETWEEN " + firstVal + " AND " + secondVal;
                        else
                            sql += " WHERE price BETWEEN " + firstVal + " AND " + secondVal;
                    }
                    
                    ResultSet rs = stmt.executeQuery(sql);
                    while(rs.next()) {
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
                        if(!genre.equals("0") && !genresList.contains(genre))
                            continue;
                        if(!text.equals("")) {
                            boolean found = false;
                            String[] keys = text.split(" ");
                            for(String s : keys) {
                                if(rs.getString("name").toLowerCase().contains(s.toLowerCase()))
                                    found = true;
                            }
                            if(!found) 
                                continue;
                        }
                %>
                <div class='fourth'>
                    <div class='card'>
                        <%out.println("<img src='" + rs.getString("image") + "' width='600' height='400'>");%>
                        <table id='grid'>
                            <tr>
                                <td class='fourty'><h4>Name:</h4></td>
                                <%out.println("<td class='sixty'>" + rs.getString("name") + "</td>");%>
                            </tr>
                            <tr>
                                <td class='fourty'><h4>Platform:</h4></td>
                                <%out.println("<td class='sixty'>" + rs.getString("platform") + "</td>");%>
                            </tr>
                            <tr>
                                <td class='fourty'><h4>Restriction:</h4></td>
                                <%out.println("<td class='sixty'>PG-" + rs.getString("age") + "</td>");%>
                            </tr>
                            <tr>
                                <td class='fourty'><h4>Price:</h4></td>
                                <%out.println("<td class='sixty'>₪" + rs.getString("price") + "</td>");%>
                            </tr>
                            <tr>
                                <td class='fourty'><h4>Genres:</h4></td>
                                <%out.println("<td class='sixty'>" + genres + "</td>");%>
                            </tr>
                        </table>
                        <%out.println("<button class='button2' onclick='viewItem(\"" + rs.getString("id") + "\")'>View Item</button>");%>
                    </div>
                </div>
                <%
                    }
                %>
            </div>
        <%}%>
        <footer>
            <hr id="cprule">
            <center><p id="cp">Website created by Alon Joseph. All rights reserved &copy; 2020</p></center>
        </footer>
    </body>
</html>

