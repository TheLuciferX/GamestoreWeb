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
        <title>Home</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=9;IE=10;IE=Edge,chrome=1"/>
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
            #cp {
                font-weight: 600;
                color: white;
                margin-top: 0.5em;
            }
            #cprule {
                margin-top: 3em;
            }
            #slideshow {
                width: 100%;
                height: 100vh;
                position: absolute;
                opacity: 0.6;
                background-position: center center;
                background-repeat: no-repeat;
                
/*                -webkit-backface-visibility: hidden;
                -moz-backface-visibility: hidden;
                -ms-backface-visibility: hidden;
                -o-backface-visibility: hidden;
                backface-visibility: hidden;*/
                
                -webkit-background-size: cover;
                -moz-background-size: cover;
                -ms-background-size: cover;
                -o-background-size: cover;
                background-size: cover;
                
                -webkit-animation: slideBg 16s linear infinite 0s;
                -moz-animation: slideBg 16s linear infinite 0s;
                -ms-animation: slideBg 16s linear infinite 0s;
                -o-animation: slideBg 16s linear infinite 0s;
                animation: slideBg 16s linear infinite 0s;
                
                -webkit-animation-timing-function: ease-in-out;
                -moz-animation-timing-function: ease-in-out;
                -ms-animation-timing-function: ease-in-out;
                -o-animation-timing-function: ease-in-out;
                animation-timing-function: ease-in-out;
                
                background-image: url('images/slideshow/1.jpg');
                
            }
            @-webkit-keyframes slideBg {
                0% {
                    background-image: url('images/slideshow/1.jpg');
                }
                25% {
                    background-image: url('images/slideshow/2.jpg');
                }
                50% {
                    background-image: url('images/slideshow/3.jpg');
                }
                75% {
                    background-image: url('images/slideshow/4.jpg');
                }
            }
            @-moz-keyframes slideBg {
                0% {
                    background-image: url('images/slideshow/1.jpg');
                }
                25% {
                    background-image: url('images/slideshow/2.jpg');
                }
                50% {
                    background-image: url('images/slideshow/3.jpg');
                }
                75% {
                    background-image: url('images/slideshow/4.jpg');
                }
            }
            @-ms-keyframes slideBg {
                0% {
                    background-image: url('images/slideshow/1.jpg');
                }
                25% {
                    background-image: url('images/slideshow/2.jpg');
                }
                50% {
                    background-image: url('images/slideshow/3.jpg');
                }
                75% {
                    background-image: url('images/slideshow/4.jpg');
                }
            }
            @-o-keyframes slideBg {
                0% {
                    background-image: url('images/slideshow/1.jpg');
                }
                25% {
                    background-image: url('images/slideshow/2.jpg');
                }
                50% {
                    background-image: url('images/slideshow/3.jpg');
                }
                75% {
                    background-image: url('images/slideshow/4.jpg');
                }
            }
            @keyframes slideBg {
                0% {
                    background-image: url('images/slideshow/1.jpg');
                }
                25% {
                    background-image: url('images/slideshow/2.jpg');
                }
                50% {
                    background-image: url('images/slideshow/3.jpg');
                }
                75% {
                    background-image: url('images/slideshow/4.jpg');
                }
            }
            #content {
                opacity: 1;
                width: 100%;
                height: 100vh;
                position: absolute;
            }
            #welcome {
                color: white;
                text-align: center;
                margin: 1em 0;
            }
            #vid {
                width: 800px;
                height: 500px;
            }
            @media only screen and (max-width: 1000px){
                #vid {
                  width: 600px;
                  height: 400px;
                }
            }
            @media only screen and (max-width: 700px){
                #vid {
                  width: 400px;
                  height: 300px;
                }
            }
        </style>
    </head>
    <body>
        <div id='slideshow'></div>
        <div id='content'>
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
                if(session.getAttribute("email") != null) {
                    out.println("<h1 id='welcome'>Welcome " + session.getAttribute("fname") + " " + session.getAttribute("lname") + "!</h1>");
                } else {
                    out.println("<h1 id='welcome'>Welcome Guest!</h1>");
                }
            %>
            <center>
                <iframe id='vid' width="800" height="500" src="https://www.youtube.com/embed/x2tZNMTX8Tg" allowfullscreen></iframe>
            </center>
            <footer>
                <hr id="cprule">
                <marquee><p id="cp">Website created by Alon Joseph. All rights reserved &copy; 2020</p></marquee>
            </footer>
        </div>
    </body>
</html>

