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
            .admin {
                margin: 1em 0;
            }
        </style>
        <script>
            function checkFName() {
                const letters = /^[A-Za-z]+$/;
                const fname = document.edituser.fname.value;
                return fname.length >= 2 && fname.match(letters);
            }
            function checkLName() {
                const letters = /^[A-Za-z]+$/;
                const lname = document.edituser.lname.value;
                return lname.length >= 2 && lname.match(letters);
            }
            function checkPhone() {
                const phone = document.edituser.phonenum.value;
                return phone.length === 7 && !isNaN(phone);
            }
            function checkGenres() {
                let counter = 0;
                if(document.edituser.action.checked) counter++;
                if(document.edituser.sports.checked) counter++;
                if(document.edituser.broyale.checked) counter++;
                if(document.edituser.roleplay.checked) counter++;
                if(document.edituser.adventure.checked) counter++;
                if(document.edituser.racing.checked) counter++;
                if(document.edituser.fighting.checked) counter++;
                if(document.edituser.strategy.checked) counter++;
                if(document.edituser.simulator.checked) counter++;
                return counter >= 2;
            }
            function checkForm() {
                if(!checkFName()) {
                    window.alert("First name must only include English characters and must be at least 2 letters long.");
                    document.edituser.fname.focus();
                    document.edituser.fname.select();
                    return false;
                }
                if(!checkLName()) {
                    window.alert("Last name must only include English characters and must be at least 2 letters long.");
                    document.edituser.lname.focus();
                    document.edituser.lname.select();
                    return false;
                }
                if(!checkPhone()) {
                    window.alert("Phone number must be 7 digits long");
                    document.edituser.phonenum.focus();
                    document.edituser.phonenum.select();
                    return false;
                }
                if(!checkGenres()) {
                    window.alert("Please select at least 2 favourite genres.");
                    return false;
                }
                window.alert("Everything filled in properly.");
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
        <%if(session.getAttribute("admin") == null || !session.getAttribute("admin").equals("true")) { 
            out.println("<center><h1 class='notice'>No permission to view this page..</h1></center>");
        } else { 
            request.setCharacterEncoding("UTF-8");
            String email = request.getParameter("email");
            if(email == null) email = " ";
            Connection con = MyUtils.getSiteDBconnection(application, "db\\myDB.mdb");
            Statement stmt = con.createStatement();
            String sql = "SELECT * FROM users WHERE email='" + email + "'";;
            ResultSet rs = stmt.executeQuery(sql);
            if(!rs.next()) {
                out.println("<center><h1 class='notice'>User not found.</h1></center>");
            } else {%>
                <div id="formDiv">
                    <%out.println("<h1 id='formTitle'>Editing " + rs.getString("first_name") + " " + rs.getString("last_name") + "</h1>");%>
                    <form name="edituser" method="get" onsubmit="return checkForm()" action="editUser.jsp">
                        <table id="form">
                            <tr>
                                <td>Email:</td>
                                <%out.println("<td><input type='email' name='email' value='" + rs.getString("email") + "' readonly></td>");%>
                            </tr>
                            <tr>
                                <td>First Name:</td>
                                <%out.println("<td><input type='text' name='fname' value='" + rs.getString("first_name") + "'></td>");%>
                            </tr>
                            <tr>
                                <td>Last Name:</td>
                                <%out.println("<td><input type='text' name='lname' value='" + rs.getString("last_name") + "'></td>");%>
                            </tr>
                            <tr>
                                <td>Date of Birth:</td>
                                <td>
                                    <select name="day">
                                        <%out.println("<option value='" + rs.getString("birthdate").split("/")[0] + "'>" + rs.getString("birthdate").split("/")[0] + "</option>");%>
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                        <option value="6">6</option>
                                        <option value="7">7</option>
                                        <option value="8">8</option>
                                        <option value="9">9</option>
                                        <option value="10">10</option>
                                        <option value="11">11</option>
                                        <option value="12">12</option>
                                        <option value="13">13</option>
                                        <option value="14">14</option>
                                        <option value="15">15</option>
                                        <option value="16">16</option>
                                        <option value="17">17</option>
                                        <option value="18">18</option>
                                        <option value="19">19</option>
                                        <option value="20">20</option>
                                        <option value="21">21</option>
                                        <option value="22">22</option>
                                        <option value="23">23</option>
                                        <option value="24">24</option>
                                        <option value="25">25</option>
                                        <option value="26">26</option>
                                        <option value="27">27</option>
                                        <option value="28">28</option>
                                        <option value="29">29</option>
                                        <option value="30">30</option>
                                        <option value="31">31</option>
                                    </select>
                                    <select name="month">
                                        <%
                                            String month = "";
                                            int monthI = Integer.valueOf(rs.getString("birthdate").split("/")[1]);
                                            if(monthI == 1) month = "January";
                                            else if(monthI == 2) month = "February";
                                            else if(monthI == 3) month = "March";
                                            else if(monthI == 4) month = "April";
                                            else if(monthI == 5) month = "May";
                                            else if(monthI == 6) month = "June";
                                            else if(monthI == 7) month = "July";
                                            else if(monthI == 8) month = "August";
                                            else if(monthI == 9) month = "September";
                                            else if(monthI == 10) month = "October";
                                            else if(monthI == 11) month = "November";
                                            else if(monthI == 12) month = "December";
                                            out.println("<option value=" + monthI + ">" + month + "</option>");
                                        %>
                                        <option value="1">January</option>
                                        <option value="2">February</option>
                                        <option value="3">March</option>
                                        <option value="4">April</option>
                                        <option value="5">May</option>
                                        <option value="6">June</option>
                                        <option value="7">July</option>
                                        <option value="8">August</option>
                                        <option value="9">September</option>
                                        <option value="10">October</option>
                                        <option value="11">November</option>
                                        <option value="12">December</option>
                                    </select>
                                    <select name="year">
                                        <%out.println("<option value='" + rs.getString("birthdate").split("/")[2] + "'>" + rs.getString("birthdate").split("/")[2] + "</option>");%>
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
                                </td>
                            </tr>
                            <tr>
                                <td>Gender:</td>
                                <td>
                                    <%
                                        if(rs.getString("gender").equals("male")) {
                                            out.println("<input type='radio' name='gender' value='male' checked>Male");
                                            out.println("<input type='radio' name='gender' value='female'>Female");
                                        } else {
                                            out.println("<input type='radio' name='gender' value='male'>Male");
                                            out.println("<input type='radio' name='gender' value='female' checked>Female");
                                        }
                                    %>
                                </td>
                            </tr>
                            <tr>
                                <td>Phone Number:</td>
                                <td>
                                    <select name="phoneprefix">
                                        <%out.println("<option value='" + rs.getString("phone_prefix") + "'>" + rs.getString("phone_prefix") + "</option>");%>
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
                                    <%out.println("<input type='text' size='7' maxlength='7' name='phonenum' value='" + rs.getString("phone_number") + "'>");%>
                                </td>
                            </tr>
                            <tr>
                                <td>Favourite Genre:</td>
                                <td>
                                    <table>
                                        <%
                                            ArrayList<String> genreList = MyUtils.getGenres(Integer.valueOf(rs.getString("genre")));
                                        %>
                                        <tr>
                                            <%
                                                if(genreList.contains("action"))
                                                    out.println("<td><input type='checkbox' name='action' checked>Action</td>");
                                                else
                                                    out.println("<td><input type='checkbox' name='action'>Action</td>");
                                                if(genreList.contains("sports"))
                                                    out.println("<td><input type='checkbox' name='sports' checked>Sports</td>");
                                                else
                                                    out.println("<td><input type='checkbox' name='sports'>Sports</td>");
                                                if(genreList.contains("broyale"))
                                                    out.println("<td><input type='checkbox' name='broyale' checked>Battle Royale</td>");
                                                else
                                                    out.println("<td><input type='checkbox' name='broyale'>Battle Royale</td>");
                                            %>
                                        </tr>
                                        <tr>
                                            <%
                                                if(genreList.contains("roleplay"))
                                                    out.println("<td><input type='checkbox' name='roleplay' checked>Role Playing</td>");
                                                else
                                                    out.println("<td><input type='checkbox' name='roleplay'>Role Playing</td>");
                                                if(genreList.contains("adventure"))
                                                    out.println("<td><input type='checkbox' name='adventure' checked>Adventure</td>");
                                                else
                                                    out.println("<td><input type='checkbox' name='adventure'>Adventure</td>");
                                                if(genreList.contains("racing"))
                                                    out.println("<td><input type='checkbox' name='racing' checked>Racing</td>");
                                                else
                                                    out.println("<td><input type='checkbox' name='racing'>Racing</td>");
                                            %>
                                        </tr>
                                        <tr>
                                            <%
                                                if(genreList.contains("fighting"))
                                                    out.println("<td><input type='checkbox' name='fighting' checked>Fighting</td>");
                                                else
                                                    out.println("<td><input type='checkbox' name='fighting'>Fighting</td>");
                                                if(genreList.contains("strategy"))
                                                    out.println("<td><input type='checkbox' name='strategy' checked>Strategy</td>");
                                                else
                                                    out.println("<td><input type='checkbox' name='strategy'>Strategy</td>");
                                                if(genreList.contains("simulator"))
                                                    out.println("<td><input type='checkbox' name='simulator' checked>Simulator</td>");
                                                else
                                                    out.println("<td><input type='checkbox' name='simulator'>Simulator</td>");
                                            %>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <center>
                            <%
                                if(rs.getString("admin").equals("true"))
                                    out.println("<input class='admin' type='checkbox' name='admin' checked>Admin");
                                else
                                    out.println("<input class='admin' type='checkbox' name='admin'>Admin");
                            %>
                        </center>
                        <div id="buttons">
                            <input class="button" type="submit" value="Save">
                        </div>
                    </form>
                </div>
            <%}
        }%>
        <footer>
            <hr id="cprule">
            <center><p id="cp">Website created by Alon Joseph. All rights reserved &copy; 2020</p></center>
        </footer>
    </body>
</html>

