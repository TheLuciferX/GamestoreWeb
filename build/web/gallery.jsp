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
        <title>Gallery</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
                color: white;
                margin-top: 0.5em;
            }
            #cprule {
                margin-top: 3em;
            }
            #imageGal {
                margin: 0 auto;
                margin-top: 2em;
                background-color: #65D081;
                width: 70%;
            }
            #title {
                text-align: center;
            }
            .third {
                float: left;
                width: 33%;
            }
            @media only screen and (max-width: 864px) {
                .third {
                    width: 100%;
                }
            }
            .card {
                width: 80%;
                margin: 1em auto;
                border: 2px solid #888;
                background: white;
                cursor: pointer;
            }
            .card:hover {
                border: 2px solid #444;
            }
            .card img {
                border-bottom: 2px solid #888;
                max-width: 100%;
                max-height: 200px;
            }
            .description {
                text-align: center;
                margin: 0.3em;
            }
            #imageGal::after {
                content: "";
                display: table;
                clear: both;
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
                background-color: rgba(0,0,0,0.9);
            }
            .modal-content {
                margin: auto;
                display: block;
                width: 80%;
                max-width: 700px;
            }
            #caption {
                margin: auto;
                display: block;
                width: 80%;
                max-width: 700px;
                text-align: center;
                color: #ccc;
                padding: 10px 0;
                height: 150px;
            }
            .modal-content, #caption {  
                -webkit-animation-name: zoom;
                -webkit-animation-duration: 0.6s;
                animation-name: zoom;
                animation-duration: 0.6s;
            }
            @-webkit-keyframes zoom {
                from {-webkit-transform:scale(0)} 
                to {-webkit-transform:scale(1)}
            }
            @keyframes zoom {
                from {transform:scale(0)} 
                to {transform:scale(1)}
            }
            .close {
                position: absolute;
                top: 15px;
                right: 35px;
                color: #f1f1f1;
                font-size: 40px;
                font-weight: bold;
                transition: 0.3s;
            }
            .close:hover,
            .close:focus {
                color: #bbb;
                text-decoration: none;
                cursor: pointer;
            }
            @media only screen and (max-width: 700px){
                .modal-content {
                  width: 100%;
                }
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
        <div id="myModal" class="modal">
            <span class="close">&times;</span>
            <img class="modal-content" id="img01">
            <div id="caption"></div>
        </div>
        <div id="imageGal">
            <h1 id="title">Image Gallery</h1>
            <div class="third">
                <div class="card">
                    <img src="images/gtav.jpg" width="600" height="400">
                    <h2 class="description">Grand Theft Auto V</h2>
                </div>
            </div>
            <div class="third">
                <div class="card">
                    <img src="images/bf3.jpg" width="600" height="400">
                    <h2 class="description">Battlefield 3</h2>
                </div>
            </div>
            <div class="third">
                <div class="card">
                    <img src="images/mc.png" width="600" height="400">
                    <h2 class="description">Minecraft</h2>
                </div>
            </div>
            <div class="third">
                <div class="card">
                    <img src="images/rdr2.jpg" width="600" height="400">
                    <h2 class="description">Red Dead Redemption 2</h2>
                </div>
            </div>
            <div class="third">
                <div class="card">
                    <img src="images/codww2.jpg" width="600" height="400">
                    <h2 class="description">Call of Duty WWII</h2>
                </div>
            </div>
            <div class="third">
                <div class="card">
                    <img src="images/pubg.jpg" width="600" height="400">
                    <h2 class="description">Player Unknown's Battleground</h2>
                </div>
            </div>
            <div class="third">
                <div class="card">
                    <img src="images/wd.png" width="600" height="400">
                    <h2 class="description">Watch Dogs</h2>
                </div>
            </div>
            <div class="third">
                <div class="card">
                    <img src="images/FIFA20.jpg" width="600" height="400">
                    <h2 class="description">Fifa 2020</h2>
                </div>
            </div>
            <div class="third">
                <div class="card">
                    <img src="images/raymanl.jpg" width="600" height="400">
                    <h2 class="description">Rayman Legends</h2>
                </div>
            </div>
            <div class="third">
                <div class="card">
                    <img src="images/ssbu.png" width="600" height="400">
                    <h2 class="description">Super Smash Bros Ultimate</h2>
                </div>
            </div>
            <div class="third">
                <div class="card">
                    <img src="images/lbp4.jpg" width="600" height="400">
                    <h2 class="description">Little Big Planet 4</h2>
                </div>
            </div>
            <div class="third">
                <div class="card">
                    <img src="images/mk8.jpg" width="600" height="400">
                    <h2 class="description">Mario Kart 8</h2>
                </div>
            </div>
        </div>
        <div class="clearfix"></div>
        <footer>
            <hr id="cprule">
            <center><p id="cp">Website created by Alon Joseph. All rights reserved &copy; 2020</p></center>
        </footer>
        <script>
            const modal = document.getElementById("myModal");
            
            const cards = document.getElementsByClassName("card");
            
            const modalImg = document.getElementById("img01");
            const captionText = document.getElementById("caption");
            const span = document.getElementsByClassName("close")[0];
            
            for(let i = 0; i < cards.length; i++) {
                cards[i].onclick = ()=> {
                   modal.style.display = "block";
                   modalImg.src = cards[i].childNodes[1].src;
                   captionText.innerHTML = cards[i].childNodes[3].innerHTML;
               };
            }
            
            span.onclick = function() { 
              modal.style.display = "none";
            };
        </script>
    </body>
</html>

