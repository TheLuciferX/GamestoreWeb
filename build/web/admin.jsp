<%-- 
    Document   : index
    Created on : 21-Apr-2020, 16:39:22
    Author     : ADMIN
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="MyClasses.MyUtils"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
        <title>Admin</title>
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
            #filter {
                width: 90%;
                background: #65D081;
                margin: 0 auto;
                margin-top: 2em;
                position: relative;
            }
            #list {
                width: 90%;
                background: #65D081;
                margin: 0 auto;
                margin-top: 2em;
                padding: 1em 0;
            }
            #filterTitle {
                text-align: center;
            }
            #listTitle {
                text-align: center;
                margin-bottom: 0.5em;
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
            #cp {
                color: white;
                margin-top: 0.5em;
            }
            #cprule {
                margin-top: 3em;
            }
            #listTable {
                width: 95%;
                border-collapse: collapse;
            }
            th {
                background-color: #4CAF50;
            }
            td {
                text-align: center;
            }
            tr {
                background-color: #fff;
                transition: all ease-in-out 300ms;
            }
            tr:nth-child(even) {
                background-color: #ddd;
            }
            td, th {
                border: 1px solid #666;
                padding: 8px;
            }
            tr:hover {
                background-color: #bbb;
            }
            .options {
                font-weight: 600;
                cursor: pointer;
            }
            .modal {
                display: none;
                position: fixed;
                z-index: 1;
                padding-top: 100px;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                overflow: auto;
                background-color: rgb(0,0,0);
                background-color: rgba(0,0,0,0.4);
            }
            .modal-content {
                position: relative;
                background-color: #fefefe;
                margin: auto;
                padding: 0;
                border: 1px solid #888;
                width: 30%;
                box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
                -webkit-animation-name: animatetop;
                -webkit-animation-duration: 0.4s;
                animation-name: animatetop;
                animation-duration: 0.4s
            }
            @-webkit-keyframes animatetop {
                from {top:-300px; opacity:0} 
                to {top:0; opacity:1}
            }

            @keyframes animatetop {
                from {top:-300px; opacity:0}
                to {top:0; opacity:1}
            }
            .close {
                color: white;
                float: right;
                font-size: 28px;
                font-weight: bold;
            }
            .close:hover,
            .close:focus {
                color: #000;
                text-decoration: none;
                cursor: pointer;
            }
            .modal-header {
                text-align: center;
                padding: 2px 16px;
                background-color: #5cb85c;
                color: white;
            }
            .modal-body {
                padding: 2px 16px;
                text-align: center;
            }
            .modal-footer {
                text-align: center;
                padding: 2px 16px;
                background-color: #5cb85c;
                color: white;
            }
            .buttonCover {
                margin: 1em 0;
            }
            .button2 {
                width: 30%;
            }
            .modalparag {
                text-align: center;
                margin-bottom: 1em;
            }
            .modal2 {
                display: none;
                position: fixed;
                z-index: 1;
                padding-top: 100px;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                overflow: auto;
                background-color: rgb(0,0,0);
                background-color: rgba(0,0,0,0.4);
            }
            .modal-content2 {
                position: relative;
                background-color: #fefefe;
                margin: auto;
                padding: 1em;
                border: 1px solid #888;
                width: 30%;
                box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
                -webkit-animation-name: animatetop;
                -webkit-animation-duration: 0.4s;
                animation-name: animatetop;
                animation-duration: 0.4s
            }
            .close2 {
                color: #aaaaaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
            }
            .close2:hover,
            .close2:focus {
                color: #000;
                text-decoration: none;
                cursor: pointer;
            }
            #add {
                position: absolute;
                bottom: 0.5em;
                right: 0.5em;
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
            out.println("<center><h1 class='notice'>You are lacking permission to view this page.</h1></center>");
        } else {%>
        
        <div id="myModal" class="modal">
            <div class="modal-content">
                <div class="modal-header">
                    <span class="close">&times;</span>
                    <h2>Modal Header</h2>
                </div>
                <div class="modal-body">
                    <div class="buttonCover">
                        <button id="btnEdit" class="button button2">Edit User</button>
                    </div>
                    <div class="buttonCover">
                        <button id="btnDelete" class="button button2">Delete User</button>
                    </div>
                </div>
                <div class="modal-footer">
                    <h3>Modal Footer</h3>
                </div>
            </div>
        </div>
        
        <div id="myModal2" class="modal2">
            <div class="modal-content2">
                <span class="close2">&times;</span>
                <p class="modalparag">Are you sure you want to delete this user?</p>
                <center><button id="btnDeleteConfirm" class="button button2">Confirm</button></center>
            </div>
         </div>
        
        <div id="filter">
            <h1 id="filterTitle">Filter</h1>
            <form name="search" method="get" onsubmit="return true" action="admin.jsp">
                <center>
                    <select name="phoneprefix">
                        <option value="0">All Phone Prefixes</option>
                        <option value="02">02</option>
                        <option value="03">03</option>
                        <option value="04">04</option>
                        <option value="08">08</option>
                        <option value="09">09</option>
                        <option value="050">050</option>
                        <option value="051">051</option>
                        <option value="052">052</option>
                        <option value="053">053</option>
                        <option value="054">054</option>
                        <option value="055">055</option>
                        <option value="056">056</option>
                        <option value="058">058</option>
                        <option value="059">059</option>
                        <option value="071">071</option>
                        <option value="072">072</option>
                        <option value="073">073</option>
                        <option value="074">074</option>
                        <option value="076">076</option>
                        <option value="077">077</option>
                        <option value="079">079</option>
                    </select>
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
                    </select>
                    <select name="year">
                        <option value="0">All Birth Years</option>
                        <option value="2019">2019</option>
                        <option value="2018">2018</option>
                        <option value="2017">2017</option>
                        <option value="2016">2016</option>
                        <option value="2015">2015</option>
                        <option value="2014">2014</option>
                        <option value="2013">2013</option>
                        <option value="2012">2012</option>
                        <option value="2011">2011</option>
                        <option value="2010">2010</option>
                        <option value="2009">2009</option>
                        <option value="2008">2008</option>
                        <option value="2007">2007</option>
                        <option value="2006">2006</option>
                        <option value="2005">2005</option>
                        <option value="2004">2004</option>
                        <option value="2003">2003</option>
                        <option value="2002">2002</option>
                        <option value="2001">2001</option>
                        <option value="2000">2000</option>
                        <option value="1999">1999</option>
                        <option value="1998">1998</option>
                        <option value="1997">1997</option>
                        <option value="1996">1996</option>
                        <option value="1995">1995</option>
                        <option value="1994">1994</option>
                        <option value="1993">1993</option>
                        <option value="1992">1992</option>
                        <option value="1991">1991</option>
                        <option value="1990">1990</option>
                        <option value="1989">1989</option>
                        <option value="1988">1988</option>
                        <option value="1987">1987</option>
                        <option value="1986">1986</option>
                        <option value="1985">1985</option>
                        <option value="1984">1984</option>
                        <option value="1983">1983</option>
                        <option value="1982">1982</option>
                        <option value="1981">1981</option>
                        <option value="1980">1980</option>
                        <option value="1979">1979</option>
                        <option value="1978">1978</option>
                        <option value="1977">1977</option>
                        <option value="1976">1976</option>
                        <option value="1975">1975</option>
                        <option value="1974">1974</option>
                        <option value="1973">1973</option>
                        <option value="1972">1972</option>
                        <option value="1971">1971</option>
                        <option value="1970">1970</option>
                        <option value="1969">1969</option>
                        <option value="1968">1968</option>
                        <option value="1967">1967</option>
                        <option value="1966">1966</option>
                        <option value="1965">1965</option>
                        <option value="1964">1964</option>
                        <option value="1963">1963</option>
                        <option value="1962">1962</option>
                        <option value="1961">1961</option>
                        <option value="1960">1960</option>
                        <option value="1959">1959</option>
                        <option value="1958">1958</option>
                        <option value="1957">1957</option>
                        <option value="1956">1956</option>
                        <option value="1955">1955</option>
                        <option value="1954">1954</option>
                        <option value="1953">1953</option>
                        <option value="1952">1952</option>
                        <option value="1951">1951</option>
                        <option value="1950">1950</option>
                        <option value="1949">1949</option>
                        <option value="1948">1948</option>
                        <option value="1947">1947</option>
                        <option value="1946">1946</option>
                        <option value="1945">1945</option>
                        <option value="1944">1944</option>
                        <option value="1943">1943</option>
                        <option value="1942">1942</option>
                        <option value="1941">1941</option>
                        <option value="1940">1940</option>
                        <option value="1939">1939</option>
                        <option value="1938">1938</option>
                        <option value="1937">1937</option>
                        <option value="1936">1936</option>
                        <option value="1935">1935</option>
                        <option value="1934">1934</option>
                        <option value="1933">1933</option>
                        <option value="1932">1932</option>
                        <option value="1931">1931</option>
                        <option value="1930">1930</option>
                        <option value="1929">1929</option>
                        <option value="1928">1928</option>
                        <option value="1927">1927</option>
                        <option value="1926">1926</option>
                        <option value="1925">1925</option>
                        <option value="1924">1924</option>
                        <option value="1923">1923</option>
                        <option value="1922">1922</option>
                        <option value="1921">1921</option>
                        <option value="1920">1920</option>
                        <option value="1919">1919</option>
                        <option value="1918">1918</option>
                        <option value="1917">1917</option>
                        <option value="1916">1916</option>
                        <option value="1915">1915</option>
                        <option value="1914">1914</option>
                        <option value="1913">1913</option>
                        <option value="1912">1912</option>
                        <option value="1911">1911</option>
                        <option value="1910">1910</option>
                        <option value="1909">1909</option>
                        <option value="1908">1908</option>
                        <option value="1907">1907</option>
                        <option value="1906">1906</option>
                        <option value="1905">1905</option>
                    </select>
                    <select name="gender">
                        <option value="0">All Genders</option>
                        <option value="male">Males</option>
                        <option value="female">Females</option>
                    </select>
                    <select name="admin">
                        <option value="0">All Users</option>
                        <option value="true">Admins</option>
                        <option value="false">Not Admins</option>
                    </select>
                </center>
                <div id="buttons">
                    <input class="button" type="submit" value="Search">
                </div>
            </form>
            <a id='add' href='register.jsp'>Add new user</a>
        </div>
        <div id="list">
            <h1 id="listTitle">List of Users</h1>
            <center>
                <table id="listTable">
                    <tr>
                        <th style="width: 20%">Email</th>
                        <th style="width: 20%">Name</th>
                        <th style="width: 10%">Date of Birth</th>
                        <th style="width: 10%">Phone Number</th>
                        <th style="width: 5%">Gender</th>
                        <th style="width: 25%">Favourite Genres</th>
                        <th style="width: 7%">Admin</th>
                        <th style="width: 3%"></th>
                    </tr>
        
        
            <%
            request.setCharacterEncoding("UTF-8");
            String phoneprefix = request.getParameter("phoneprefix");
            String genre = request.getParameter("genre");
            String year = request.getParameter("year");
            String admin = request.getParameter("admin");
            String gender = request.getParameter("gender");
            
            if(phoneprefix == null) phoneprefix = "0";
            if(genre == null) genre = "0";
            if(year == null) year = "0";
            if(admin == null) admin = "0";
            if(gender == null) gender = "0";
            
            Connection con = MyUtils.getSiteDBconnection(application, "db\\myDB.mdb");
            Statement stmt = con.createStatement();
            String sql = "SELECT * FROM users";
            if(!phoneprefix.equals("0")) {
                sql += " WHERE phone_prefix='" + phoneprefix + "'";
            }
            if(!admin.equals("0")) {
                if(sql.contains("WHERE"))
                    sql += " AND admin='" + admin + "'";
                else
                    sql += " WHERE admin='" + admin + "'";
            }
            if(!gender.equals("0")) {
                if(sql.contains("WHERE"))
                    sql += " AND gender='" + gender + "'";
                else
                    sql += " WHERE gender='" + gender + "'";
            }
            ResultSet rs = stmt.executeQuery(sql);
            while(rs.next())
            {
                String genres = "";
                ArrayList<String> genresList = MyUtils.getGenres(Integer.valueOf(rs.getString("genre")));
                String birthYear = rs.getString("birthdate").split("/")[2];
                if(genre.equals("0") || genresList.contains(genre)) {
                    if(year.equals("0") || year.equals(birthYear)) {
                        for(String g : genresList) {
                            genres += g + ", ";
                        }
                        genres = genres.substring(0, genres.length() - 2);
                        out.println("<tr>");
                        out.println("<td>" + rs.getString("email") + "</td>");
                        out.println("<td>" + rs.getString("first_name") + " " + rs.getString("last_name") + "</td>");
                        out.println("<td>" + rs.getString("birthdate") + "</td>");
                        out.println("<td>" + rs.getString("phone_prefix") + "-" + rs.getString("phone_number") + "</td>");
                        out.println("<td>" + rs.getString("gender") + "</td>");
                        out.println("<td>" + genres + "</td>");
                        out.println("<td>" + rs.getString("admin") + "</td>");
                        out.println("<td class='options' onclick='openOptions(\"" + rs.getString("first_name") + " " + rs.getString("last_name") + "\", \"" + rs.getString("email") +  "\")'>...</td>");
                        out.println("</tr>");
                    }
                }
            }
        }%>
                </table>
            </center>
        </div>
        <footer>
            <hr id="cprule">
            <center><p id="cp">Website created by Alon Joseph. All rights reserved &copy; 2020</p></center>
        </footer>
                
        <script>
            const modal = document.getElementById("myModal");
            const span = document.getElementsByClassName("close")[0];
            
            const modal2 = document.getElementById("myModal2");
            const span2 = document.getElementsByClassName("close2")[0];
            
            const header = document.getElementsByClassName("modal-header")[0].children[1];
            const footer = document.getElementsByClassName("modal-footer")[0].children[0];
            
            const edit = document.getElementById("btnEdit");
            const del = document.getElementById("btnDelete");
            
            const delConfirm = document.getElementById("btnDeleteConfirm");
            
            function openOptions(name, email) {
                header.innerHTML = name;
                footer.innerHTML = email;
                modal.style.display = "block";
            }
            span.onclick = function() {
                modal.style.display = "none";
            }
            span2.onclick = function() {
                modal2.style.display = "none";
            }
            window.onclick = function(event) {
                if (event.target === modal) {
                    modal.style.display = "none";
                }
                if (event.target === modal2) {
                    modal2.style.display = "none";
                }
            }
            
            edit.onclick = function() {
                const form = document.createElement("form");
                const email = document.createElement("input"); 
                form.method = "GET";
                form.action = "edit.jsp";   
                email.value=footer.innerHTML;
                email.name="email";
                form.appendChild(email);
                document.body.appendChild(form);
                form.submit();
            }
            del.onclick = function() {
                modal2.style.display = "block";
                modal.style.display = "none";
            }
            delConfirm.onclick = function() {
                const form = document.createElement("form");
                const email = document.createElement("input"); 
                form.method = "GET";
                form.action = "delete.jsp";   
                email.value=footer.innerHTML;
                email.name="email";
                form.appendChild(email);
                document.body.appendChild(form);
                form.submit();
            }
        </script>
    </body>
</html>

