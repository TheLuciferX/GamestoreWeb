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
        <title>Register</title>
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
                const email = document.register.email.value;
                return email.length > 0;
            }
            function checkFName() {
                const letters = /^[A-Za-z]+$/;
                const fname = document.register.fname.value;
                return fname.length >= 2 && fname.match(letters);
            }
            function checkLName() {
                const letters = /^[A-Za-z]+$/;
                const lname = document.register.lname.value;
                return lname.length >= 2 && lname.match(letters);
            }
            function checkPass() {
                const pass = document.register.pass.value;
                const letters = /^[a-zA-Z0-9]+$/;
                let num = false;
                let low = false;
                let high = false;
                if(pass.length < 6 || pass > 16 || !pass.match(letters)) return false;
                for(let i = 0; i < pass.length; i++) {
                    if(pass.charAt(i) >= "a" && pass.charAt(i) <= "z") low = true;
                    if(pass.charAt(i) >= "A" && pass.charAt(i) <= "Z") high = true;
                    if(pass.charAt(i) >= "0" && pass.charAt(i) <= "9") num = true;
                }
                return low && high && num;
            }
            function checkDay() {
                const day = document.register.day.selectedIndex;
                return day !== 0;
            }
            function checkMonth() {
                const month = document.register.month.selectedIndex;
                return month !== 0;
            }
            function checkYear() {
                const year = document.register.year.selectedIndex;
                return year !== 0;
            }
            function checkGender() {
                const gender = document.register.gender;
                return gender[0].checked || gender[1].checked;
            }
            function checkPrefix() {
                const prefix = document.register.phoneprefix.selectedIndex;
                return prefix !== 0;
            }
            function checkPhone() {
                const phone = document.register.phonenum.value;
                return phone.length === 7 && !isNaN(phone);
            }
            function checkGenres() {
                let counter = 0;
                if(document.register.action.checked) counter++;
                if(document.register.sports.checked) counter++;
                if(document.register.broyale.checked) counter++;
                if(document.register.roleplay.checked) counter++;
                if(document.register.adventure.checked) counter++;
                if(document.register.racing.checked) counter++;
                if(document.register.fighting.checked) counter++;
                if(document.register.strategy.checked) counter++;
                if(document.register.simulator.checked) counter++;
                return counter >= 2;
            }
            function checkForm() {
                if(!checkEmail()) {
                    window.alert("Enter a valid email address.");
                    document.register.email.focus();
                    document.register.email.select();
                    return false;
                }
                if(!checkFName()) {
                    window.alert("First name must only include English characters and must be at least 2 letters long.");
                    document.register.fname.focus();
                    document.register.fname.select();
                    return false;
                }
                if(!checkLName()) {
                    window.alert("Last name must only include English characters and must be at least 2 letters long.");
                    document.register.lname.focus();
                    document.register.lname.select();
                    return false;
                }
                if(!checkPass()) {
                    window.alert("Password must be 6-16 character long, must only include English letters and numbers, and must include at least: 1 lowercase letter, 1 highercase letter, and 1 number.");
                    document.register.pass.focus();
                    document.register.pass.select();
                    return false;
                }
                if(document.register.pass.value !== document.register.rpass.value) {
                    window.alert("Passwords do not match.");
                    document.register.rpass.focus();
                    document.register.rpass.select();
                    return false;
                }
                if(!checkDay()) {
                    window.alert("Please select your bith day.");
                    return false;
                }
                if(!checkMonth()) {
                    window.alert("Please select your bith month.");
                    return false;
                }
                if(!checkYear()) {
                    window.alert("Please select your bith year.");
                    return false;
                }
                if(!checkGender()) {
                    window.alert("Please select your gender.");
                    return false;
                }
                if(!checkPrefix()) {
                    window.alert("Please select a correct phone prefix.");
                    return false;
                }
                if(!checkPhone()) {
                    window.alert("Phone number must be 7 digits long");
                    document.register.phonenum.focus();
                    document.register.phonenum.select();
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
        <%if(session.getAttribute("email") != null && !session.getAttribute("admin").equals("true")) { 
            out.println("<center><h1 class='notice'>You already own an account.</h1></center>");
        } else { %>
            <div id="formDiv">
                <h1 id="formTitle">Registration Form</h1>
                <form name="register" method="get" onsubmit="return checkForm()" action="insertUserToDB.jsp">
                    <table id="form">
                        <tr>
                            <td>Email:</td>
                            <td><input type="email" name="email"></td>
                        </tr>
                        <tr>
                            <td>First Name:</td>
                            <td><input type="text" name="fname"></td>
                        </tr>
                        <tr>
                            <td>Last Name:</td>
                            <td><input type="text" name="lname"></td>
                        </tr>
                        <tr>
                            <td>Password:</td>
                            <td><input type="password" name="pass"></td>
                        </tr>
                        <tr>
                            <td>Repeat Password:</td>
                            <td><input type="password" name="rpass"></td>
                        </tr>
                        <tr>
                            <td>Date of Birth:</td>
                            <td>
                                <select name="day">
                                    <option value="0">Day</option>
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
                                    <option value="0">Month</option>
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
                                    <option value="0">Year</option>
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
                                <input type="radio" name="gender" value="male">Male
                                <input type="radio" name="gender" value="female">Female
                            </td>
                        </tr>
                        <tr>
                            <td>Phone Number:</td>
                            <td>
                                <select name="phoneprefix">
                                    <option value="0">Prefix</option>
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
                                <input type="text" size="7" maxlength="7" name="phonenum">
                            </td>
                        </tr>
                        <tr>
                            <td>Favourite Genre:</td>
                            <td>
                                <table>
                                    <tr>
                                        <td><input type="checkbox" name="action">Action</td>
                                        <td><input type="checkbox" name="sports">Sports</td>
                                        <td><input type="checkbox" name="broyale">Battle Royale</td>
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox" name="roleplay">Role Playing</td>
                                        <td><input type="checkbox" name="adventure">Adventure</td>
                                        <td><input type="checkbox" name="racing">Racing</td>
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox" name="fighting">Fighting</td>
                                        <td><input type="checkbox" name="strategy">Strategy</td>
                                        <td><input type="checkbox" name="simulator">Simulator</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    <div id="buttons">
                        <input class="button" type="submit" value="Register">
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

