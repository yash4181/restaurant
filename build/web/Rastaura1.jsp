<!DOCTYPE html>

<%@page import="model.AddProduct"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="dao.AddProductDAO"%>
<%@page import="impl.AddProductDAOImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    AddProductDAO udao = new AddProductDAOImpl();

    request.setAttribute("addproduct", udao.getAddProduct());
%>


<html>

    <head>

        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

        <script src="https://www.w3schools.com/lib/w3.js"></script>
        
        <style>
            body {
                position: relative;
                overflow-x: hidden;
            }
            body,
            html { height: 100%;}
            .nav .open > a, 
            .nav .open > a:hover, 
            .nav .open > a:focus {background-color: transparent;}

            /*-------------------------------*/
            /*           Wrappers            */
            /*-------------------------------*/

            #wrapper {
                padding-left: 0;
                -webkit-transition: all 0.5s ease;
                -moz-transition: all 0.5s ease;
                -o-transition: all 0.5s ease;
                transition: all 0.5s ease;
            }

            #wrapper.toggled {
                padding-left: 220px;
            }

            #sidebar-wrapper {
                z-index: 1000;
                left: 220px;
                width: 0;
                height: 100%;
                margin-left: -220px;
                overflow-y: auto;
                overflow-x: hidden;
                background: #1a1a1a;
                -webkit-transition: all 0.5s ease;
                -moz-transition: all 0.5s ease;
                -o-transition: all 0.5s ease;
                transition: all 0.5s ease;
            }

            #sidebar-wrapper::-webkit-scrollbar {
                display: none;
            }

            #wrapper.toggled #sidebar-wrapper {
                width: 220px;
            }

            #page-content-wrapper {
                width: 100%;
                padding-top: 70px;
            }

            #wrapper.toggled #page-content-wrapper {
                position: absolute;
                margin-right: -220px;
            }

            /*-------------------------------*/
            /*     Sidebar nav styles        */
            /*-------------------------------*/

            .sidebar-nav {
                position: absolute;
                top: 0;
                width: 220px;
                margin: 0;
                padding: 0;
                list-style: none;
            }

            .sidebar-nav li {
                position: relative; 
                line-height: 20px;
                display: inline-block;
                width: 100%;
            }

            .sidebar-nav li:before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                z-index: -1;
                height: 100%;
                width: 3px;
                background-color: #1c1c1c;
                -webkit-transition: width .2s ease-in;
                -moz-transition:  width .2s ease-in;
                -ms-transition:  width .2s ease-in;
                transition: width .2s ease-in;

            }
            .sidebar-nav li:first-child a {
                color: #fff;
                background-color: #1a1a1a;
            }
            .sidebar-nav li:nth-child(2):before {
                background-color: #ec1b5a;   
            }
            .sidebar-nav li:nth-child(3):before {
                background-color: #79aefe;   
            }
            .sidebar-nav li:nth-child(4):before {
                background-color: #314190;   
            }
            .sidebar-nav li:nth-child(5):before {
                background-color: #279636;   
            }
            .sidebar-nav li:nth-child(6):before {
                background-color: #7d5d81;   
            }
            .sidebar-nav li:nth-child(7):before {
                background-color: #ead24c;   
            }
            .sidebar-nav li:nth-child(8):before {
                background-color: #2d2366;   
            }
            .sidebar-nav li:nth-child(9):before {
                background-color: #35acdf;   
            }
            .sidebar-nav li:hover:before,
            .sidebar-nav li.open:hover:before {
                width: 100%;
                -webkit-transition: width .2s ease-in;
                -moz-transition:  width .2s ease-in;
                -ms-transition:  width .2s ease-in;
                transition: width .2s ease-in;

            }

            .sidebar-nav li a {
                display: block;
                color: #ddd;
                text-decoration: none;
                padding: 10px 15px 10px 30px;    
            }

            .sidebar-nav li a:hover,
            .sidebar-nav li a:active,
            .sidebar-nav li a:focus,
            .sidebar-nav li.open a:hover,
            .sidebar-nav li.open a:active,
            .sidebar-nav li.open a:focus{
                color: #fff;
                text-decoration: none;
                background-color: transparent;
            }

            .sidebar-nav > .sidebar-brand {
                height: 65px;
                font-size: 20px;
                line-height: 44px;
            }
            .sidebar-nav .dropdown-menu {
                position: relative;
                width: 100%;
                padding: 0;
                margin: 0;
                border-radius: 0;
                border: none;
                background-color: #222;
                box-shadow: none;
            }

            /*-------------------------------*/
            /*       Hamburger-Cross         */
            /*-------------------------------*/

            .hamburger {
                position: fixed;
                top: 20px;  
                z-index: 999;
                display: block;
                width: 32px;
                height: 32px;
                margin-left: 15px;
                background: transparent;
                border: none;
            }
            .hamburger:hover,
            .hamburger:focus,
            .hamburger:active {
                outline: none;
            }
            .hamburger.is-closed:before {
                content: '';
                display: block;
                width: 100px;
                font-size: 14px;
                color: #fff;
                line-height: 32px;
                text-align: center;
                opacity: 0;
                -webkit-transform: translate3d(0,0,0);
                -webkit-transition: all .35s ease-in-out;
            }
            .hamburger.is-closed:hover:before {
                opacity: 1;
                display: block;
                -webkit-transform: translate3d(-100px,0,0);
                -webkit-transition: all .35s ease-in-out;
            }

            .hamburger.is-closed .hamb-top,
            .hamburger.is-closed .hamb-middle,
            .hamburger.is-closed .hamb-bottom,
            .hamburger.is-open .hamb-top,
            .hamburger.is-open .hamb-middle,
            .hamburger.is-open .hamb-bottom {
                position: absolute;
                left: 0;
                height: 4px;
                width: 100%;
            }
            .hamburger.is-closed .hamb-top,
            .hamburger.is-closed .hamb-middle,
            .hamburger.is-closed .hamb-bottom {
                background-color: #1a1a1a;
            }
            .hamburger.is-closed .hamb-top { 
                top: 5px; 
                -webkit-transition: all .35s ease-in-out;
            }
            .hamburger.is-closed .hamb-middle {
                top: 50%;
                margin-top: -2px;
            }
            .hamburger.is-closed .hamb-bottom {
                bottom: 5px;  
                -webkit-transition: all .35s ease-in-out;
            }

            .hamburger.is-closed:hover .hamb-top {
                top: 0;
                -webkit-transition: all .35s ease-in-out;
            }
            .hamburger.is-closed:hover .hamb-bottom {
                bottom: 0;
                -webkit-transition: all .35s ease-in-out;
            }
            .hamburger.is-open .hamb-top,
            .hamburger.is-open .hamb-middle,
            .hamburger.is-open .hamb-bottom {
                background-color: #1a1a1a;
            }
            .hamburger.is-open .hamb-top,
            .hamburger.is-open .hamb-bottom {
                top: 50%;
                margin-top: -2px;  
            }
            .hamburger.is-open .hamb-top { 
                -webkit-transform: rotate(45deg);
                -webkit-transition: -webkit-transform .2s cubic-bezier(.73,1,.28,.08);
            }
            .hamburger.is-open .hamb-middle { display: none; }
            .hamburger.is-open .hamb-bottom {
                -webkit-transform: rotate(-45deg);
                -webkit-transition: -webkit-transform .2s cubic-bezier(.73,1,.28,.08);
            }
            .hamburger.is-open:before {
                content: '';
                display: block;
                width: 100px;
                font-size: 14px;
                color: #fff;
                line-height: 32px;
                text-align: center;
                opacity: 0;
                -webkit-transform: translate3d(0,0,0);
                -webkit-transition: all .35s ease-in-out;
            }
            .hamburger.is-open:hover:before {
                opacity: 1;
                display: block;
                -webkit-transform: translate3d(-100px,0,0);
                -webkit-transition: all .35s ease-in-out;
            }

            /*-------------------------------*/
            /*            Overlay            */
            /*-------------------------------*/

            .overlay {
                position: fixed;
                display: none;
                width: 100%;
                height: 100%;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background-color: rgba(250,250,250,.8);
                z-index: 1;
            }
        </style>

        <script>

            $(document).ready(function () {
                var trigger = $('.hamburger'),
                        overlay = $('.overlay'),
                        isClosed = false;

                trigger.click(function () {
                    hamburger_cross();
                });

                function hamburger_cross() {

                    if (isClosed == true) {
                        overlay.hide();
                        trigger.removeClass('is-open');
                        trigger.addClass('is-closed');
                        isClosed = false;
                    } else {
                        overlay.show();
                        trigger.removeClass('is-closed');
                        trigger.addClass('is-open');
                        isClosed = true;
                    }
                }

                $('[data-toggle="offcanvas"]').click(function () {
                    $('#wrapper').toggleClass('toggled');
                });
            });

        </script>

    </head>

    <body>

        <!------ Include the above in your HEAD tag ---------->

        <div id="wrapper">
            <div class="overlay"></div>

            <!-- Sidebar -->
            <nav class="navbar navbar-inverse navbar-fixed-top" id="sidebar-wrapper" role="navigation">
                <ul class="nav sidebar-nav">
                    <li class="sidebar-brand">
                        <a href="#">
                            Brand
                        </a>
                    </li>
                    <li>
                        <a href="#">Home</a>
                    </li>
                    <li>
                        <a href="#">About</a>
                    </li>
                    <li>
                        <a href="#">Events</a>
                    </li>
                    <li>
                        <a href="#">Team</a>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Works <span class="caret"></span></a>
                        <ul class="dropdown-menu" role="menu">
                            <li class="dropdown-header">Dropdown heading</li>
                            <li><a href="#">Action</a></li>
                            <li><a href="#">Another action</a></li>
                            <li><a href="#">Something else here</a></li>
                            <li><a href="#">Separated link</a></li>
                            <li><a href="#">One more separated link</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">Services</a>
                    </li>
                    <li>
                        <a href="#">Contact</a>
                    </li>
                    <li>
                        <a href="https://twitter.com/maridlcrmn">Follow me</a>
                    </li>
                </ul>
            </nav>
            <!-- /#sidebar-wrapper -->

            <!-- Page Content -->
            <div id="page-content-wrapper">
                <button type="button" class="hamburger is-closed" style="z-index: 100000;" data-toggle="offcanvas">
                    <span class="hamb-top"></span>
                    <span class="hamb-middle"></span>
                    <span class="hamb-bottom"></span>
                </button>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 col-lg-offset-2">

                            <div id="body" data-spy="scroll" data-target=".header">

                                <div class="container">


                                    <!--Test -->
                                    <div id="test" w3-include-html="inc/menu-template.html"></div>
                                    <!--/Test -->



                                    <script type="text/javascript">
                                        $(document).ready(function () {
                                            w3.includeHTML(init);
                                        });

                                        function init() {
                                            $('#test').BootSideMenu({
                                                side: "right",
                                                pushBody: true,
                                                width: '400px'
                                            });
                                        }
                                    </script>

                                    <!--========== HEADER ==========-->
                                    <header class="header navbar-fixed-top">
                                        <!-- Navbar -->
                                        <nav class="navbar" role="navigation">
                                            <div class="container">
                                                <!-- Brand and toggle get grouped for better mobile display -->
                                                <div class="menu-container js_nav-item">
                                                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".nav-collapse">
                                                        <span class="sr-only">Toggle navigation</span>
                                                        <span class="toggle-icon"></span>
                                                    </button>

                                                    <!-- Logo -->
                                                    <div class="logo">
                                                        <a class="logo-wrap" href="#body">
                                                            <img class="logo-img logo-img-main" src="images/logo-footer1.png" alt="Asentus Logo">
                                                            <img class="logo-img logo-img-active" src="images/logo-footer.png" alt="Asentus Logo">
                                                        </a>
                                                    </div>
                                                    <!-- End Logo -->
                                                </div>

                                                <!-- Collect the nav links, forms, and other content for toggling -->
                                                <div class="collapse navbar-collapse nav-collapse">
                                                    <div class="menu-container">
                                                        <ul class="nav navbar-nav navbar-nav-right">
                                                            <li class="js_nav-item nav-item"><a class="nav-item-child nav-item-hover" href="#body">Home</a></li>
                                                            <li class="js_nav-item nav-item"><a class="nav-item-child nav-item-hover" href="#about">About</a></li>
                                                            <li class="js_nav-item nav-item"><a class="nav-item-child nav-item-hover" href="#offer">Offer</a></li>
                                                            <li class="js_nav-item nav-item"><a class="nav-item-child nav-item-hover" href="#menu">Menu</a></li>								
                                                            <li class="js_nav-item nav-item"><a class="nav-item-child nav-item-hover" href="#contact">Contact</a></li>
                                                            <li class="js_nav-item nav-item"><a class="nav-item-child nav-item-hover" href="#product">Product</a></li>
                                                            <li class="js_nav-item nav-item"><a class="nav-item-child nav-item-hover" href="Login.jsp">Log in</a></li>
                                                            <li class="js_nav-item nav-item"><a class="nav-item-child nav-item-hover" href="signup.jsp">Sign up</a></li>



                                                        </ul>
                                                    </div>
                                                </div>
                                                <!-- End Navbar Collapse -->
                                            </div>
                                        </nav>
                                        <!-- Navbar -->
                                    </header>
                                    <!--========== END HEADER ==========-->

                                    <!--========== SLIDER ==========-->
                                    <div class="promo-block parallax-window" data-parallax="scroll" data-image-src="images/pxq.jpeg">
                                        <div class="container">
                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <div class="promo-block-divider">
                                                        <h1 class="promo-block-title"  style="font-family: Bell MT"><i>Welcome To</i></h1>
                                                        <h1 class="promo-block-title" style="color: #615130; font-family: Bell MT"><i>restaurA</i> </h1>
                                                        <p class="promo-block-text">Come and eat well with our delicious & healthy foods.</p>
                                                    </div>

                                                </div>
                                            </div>
                                            <!--// end row -->
                                        </div>
                                    </div>
                                    <!--========== SLIDER ==========-->

                                    <!-- about section -->
                                    <div id="about" class="about-cls"><!-- about-->

                                        <div class="container"><!-- container -->


                                            <div class="row"><!-- row -->
                                                <div class="col-sm-6">
                                                    <div class="text-center abt-title">
                                                        <h1><i>About</i></h1>
                                                        <p><i>"Restaura is a food ordering and delivery company based out of New Delhi, India.
                                                                restaura was inspired by the thought of providing a complete food ordering and delivery 
                                                                solution from the best neighbourhood restaurants to the urban foodie. 
                                                                A single window for ordering from a wide range of restaurants, we have our own 
                                                                exclusive fleet of delivery personnel to pickup orders from restaurants and deliver it to customers"</i></p>
                                                        <a href="#"><button type="button" class="btn btn-default btn-lg active">Read More</button></a>
                                                    </div>
                                                </div>


                                                <div class="col-sm-3 abt-img1" style="margin-top: 10px;">
                                                    <div class="img1">
                                                        <img  src="new img/abt-2.jpg" class="img-responsive" alt="">
                                                    </div>
                                                </div>

                                                <div class="col-sm-3 abt-img2" style="margin-top: 258px;">
                                                    <div class="img2">
                                                        <img  src="new img/abt-1.jpg" class="img-responsive" alt="">
                                                    </div>
                                                </div>


                                            </div><!-- end row-->
                                        </div><!-- end container -->
                                    </div><!-- end about-->


                                    <!--- end about section --->



                                    <!-- Offer section --->

                                    <div id="offer">
                                        <div class="promo-block1 parallax-offer" data-parallax="scroll" data-image-src="new img/bgb.jpg">
                                            <div class="container-fluid">

                                                <!--- title-->
                                                <div class="row" style="margin-top: 100px;">
                                                    <div class="col-sm-12 title-col">
                                                        <h1> <i>Special Offers</i></h1>
                                                    </div>
                                                </div> <!-- end title-->

                                                <!--- carousel -->

                                                <div id="myCarousel" class="carousel slide my-carousel" data-ride="carousel">
                                                    <!-- Indicators -->
                                                    <ol class="carousel-indicators">
                                                        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                                                        <li data-target="#myCarousel" data-slide-to="1"></li>
                                                        <li data-target="#myCarousel" data-slide-to="2"></li>
                                                    </ol>

                                                    <!-- Wrapper for slides -->
                                                    <div class="carousel-inner my-carin">

                                                        <div class="item active"><!-- active class-->
                                                            <div class="row align-self-center"><!-- 1st row-->
                                                                <div class="col-sm-3">
                                                                    <div class="card" style="width: 26.5rem;">
                                                                        <div class="inner1">
                                                                            <a href="#"><img class="card-img-top" src="new img/sp1.jpg" alt="Card image cap"></a>
                                                                        </div>
                                                                        <div class="card-body text-center">
                                                                            <a href="#"><p class="card-text">Italian Pizza Speciality</p></a>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="col-sm-3">
                                                                    <div class="card" style="width: 26.5rem;">
                                                                        <div class="inner1">
                                                                            <a href="#"><img class="card-img-top" src="new img/sp2.jpg" alt="Card image cap"></a>
                                                                        </div>
                                                                        <div class="card-body text-center">
                                                                            <a href="#"><p class="card-text">Italian Pizza Speciality</p></a>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="col-sm-3">
                                                                    <div class="card" style="width: 26.5rem;">
                                                                        <div class="inner1">
                                                                            <a href="#"><img class="card-img-top" src="new img/sp3.jpg" alt="Card image cap"></a>
                                                                        </div>
                                                                        <div class="card-body text-center">
                                                                            <a href="#"><p class="card-text">Italian Pizza Speciality</p></a>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="col-sm-3">
                                                                    <div class="card" style="width: 26.5rem;">
                                                                        <div class="inner1">
                                                                            <a href="#"><img class="card-img-top" src="new img/sp4.jpg" alt="Card image cap"></a>
                                                                        </div>
                                                                        <div class="card-body text-center">
                                                                            <a href="#"><p class="card-text">Italian Pizza Speciality</p></a>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                            </div><!-- end of row-->
                                                        </div><!-- end of active-->
                                                        <!--------------------------------------------------------------------------------->								

                                                        <div class="item"><!-- item class 1 -->
                                                            <div class="row align-self-center"><!-- 1st row-->
                                                                <div class="col-sm-3">
                                                                    <div class="card" style="width: 26.5rem;">
                                                                        <div class="inner1">
                                                                            <a href="#"><img class="card-img-top" src="new img/sp5.jpg" alt="Card image cap"></a>
                                                                        </div>
                                                                        <div class="card-body text-center">
                                                                            <a href="#"><p class="card-text">Italian Pizza Speciality</p></a>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="col-sm-3">
                                                                    <div class="card" style="width: 26.5rem;">
                                                                        <div class="inner1">
                                                                            <a href="#"><img class="card-img-top" src="new img/sp3.jpg" alt="Card image cap"></a>
                                                                        </div>
                                                                        <div class="card-body text-center">
                                                                            <a href="#"><p class="card-text">Italian Pizza Speciality</p></a>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="col-sm-3">
                                                                    <div class="card" style="width: 26.5rem;">
                                                                        <div class="inner1">
                                                                            <a href="#"><img class="card-img-top" src="new img/sp1.jpg" alt="Card image cap"></a>
                                                                        </div>
                                                                        <div class="card-body text-center">
                                                                            <a href="#"><p class="card-text">Italian Pizza Speciality</p></a>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="col-sm-3">
                                                                    <div class="card" style="width: 26.5rem;">
                                                                        <div class="inner1">
                                                                            <a href="#"><img class="card-img-top" src="new img/sp4.jpg" alt="Card image cap"></a>
                                                                        </div>
                                                                        <div class="card-body text-center">
                                                                            <a href="#"><p class="card-text">Italian Pizza Speciality</p></a>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                            </div><!-- end of row-->

                                                        </div><!-- end of item 1-->
                                                        <!--------------------------------------------------------------------------------->								

                                                        <div class="item"><!-- item class 2 -->
                                                            <div class="row align-self-center"><!-- 2nd row-->
                                                                <div class="col-sm-3">
                                                                    <div class="card" style="width: 26.5rem;">
                                                                        <div class="inner1">
                                                                            <a href="#"><img class="card-img-top" src="new img/sp5.jpg" alt="Card image cap"></a>
                                                                        </div>
                                                                        <div class="card-body text-center">
                                                                            <a href="#"><p class="card-text">Italian Pizza Speciality</p></a>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="col-sm-3">
                                                                    <div class="card" style="width: 26.5rem;">
                                                                        <div class="inner1">
                                                                            <a href="#"><img class="card-img-top" src="new img/sp2.jpg" alt="Card image cap"></a>
                                                                        </div>
                                                                        <div class="card-body text-center">
                                                                            <a href="#"><p class="card-text">Italian Pizza Speciality</p></a>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="col-sm-3">
                                                                    <div class="card" style="width: 26.5rem;">
                                                                        <div class="inner1">
                                                                            <a href="#"><img class="card-img-top" src="new img/sp3.jpg" alt="Card image cap"></a>
                                                                        </div>
                                                                        <div class="card-body text-center">
                                                                            <a href="#"><p class="card-text">Italian Pizza Speciality</p></a>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="col-sm-3">
                                                                    <div class="card" style="width: 26.5rem;">
                                                                        <div class="inner1">
                                                                            <a href="#"><img class="card-img-top" src="new img/sp4.jpg" alt="Card image cap"></a>
                                                                        </div>
                                                                        <div class="card-body text-center">
                                                                            <a href="#"><p class="card-text">Italian Pizza Speciality</p></a>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                            </div><!-- end of 2nd row-->


                                                        </div><!-- end of item 2-->	




                                                    </div><!-- end of wrapper-->											
                                                </div><!-- end carousel-->
                                            </div><!-- end container-->
                                        </div><!--end parallax-->
                                    </div> <!--end id-->


                                    <!--- end offer section--->


                                    <!--- extra page1--->

                                    <div class="container-fluid extra-fluid" style="height: 500px; background-color: white;">
                                        <div class="container">
                                            <div class="row">

                                                <div class="col-sm-4" style="height: 400px; ">
                                                    <div class="extra_col">
                                                        <a href="#"><img src="images/about-icon2.png" class="img-responsive" alt=""></a>
                                                        <h3 class="title"><a href="#">Delicious food</a></h3>
                                                    </div>
                                                </div>



                                                <div class="col-sm-4" style="height:400px;">
                                                    <div class="extra_col">
                                                        <a href="#"><img src="images/about-icon4.png" class="img-responsive" alt=""></a>
                                                        <h3 class="title"><a href="#">Professional Service</a></h3>
                                                    </div>
                                                </div>


                                                <div class="col-sm-4" style="height:400px;">
                                                    <div class="extra_col">
                                                        <a href="#"><img src="images/about-icon6.png" class="img-responsive" alt=""></a>
                                                        <h3 class="title"><a href="#">Excelient Menu</a></h3>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>





                                    <!--- end extra page1-->




                                    <!---- menu section--->

                                    <div id="menu" class="menu-back"><!-- menu-->
                                        <div class="promo-block1 parallax-menu" data-parallax="scroll" data-image-src="new img/menu-bg.jpg"><!-- menu parallax-->
                                            <div class="menu-inner"><!--menu inner-->

                                                <div class="container menu-container"><!-- container-->
                                                    <div class="row" style="margin-top: 50px;"><!--row-->
                                                        <div class="col-sm-12">
                                                            <div class="menu-text text-center">
                                                                <h2 class="heading-title"><i>Offered Menu</i></h2>
                                                                <h4 class="heading-subtitle">Some Trendy And Popular Courses Offered</h4>
                                                            </div>
                                                        </div>
                                                    </div><!--end row-->							
                                                </div><!-- end container-->

                                                <div class="container tab-container" style="margin-top: 50px;"><!--tab container--> 
                                                    <ul class="nav nav-tabs my-tabs" role="tablist">
                                                        <li role="presentation" class="active"><a href="#special" aria-controls="special" role="tab" data-toggle="tab">Speacial</a></li>
                                                        <li role="presentation"><a href="#breakfast" aria-controls="breakfast" role="tab" data-toggle="tab">Breakfast</a></li>
                                                        <li role="presentation"><a href="#lunch" aria-controls="lunch" role="tab" data-toggle="tab">Lunch</a></li>
                                                        <li role="presentation"><a href="#dinner" aria-controls="dinner" role="tab" data-toggle="tab">Dinner</a></li>
                                                    </ul>
                                                </div>
                                                <!-- Tab panes -->
                                                <div class="container-fluid"><!--conatiner-fluid-->

                                                    <span class="menu-span"><a href="#">PIZZA</a></span>
                                                    <span class="menu-span1"><a href="#">TANDOORI</a></span>
                                                    <span class="menu-span2"><a href="#">SOUP</a></span>
                                                    <span class="menu-span3"><a href="#">BURGER</a></span>
                                                    <span class="menu-span4"><a href="#">SUBWAY</a></span>
                                                    <span class="menu-span5"><a href="#">KABAB</a></span>
                                                    <span class="menu-span6"><a href="#">PIZZA</a></span>


                                                    <div class="tab-content"><!-- tabs content-->
                                                        <div role="tabpanel" class="tab-pane fade in active" id="special"><!-- tab pane1-->

                                                            <div class="row" style="margin-top: 50px;"><!-- menu row1-->



                                                                <div class="col-sm-4"><!-- menu col1-->
                                                                    <div class="menu-images">
                                                                        <div class="img-inner">

                                                                            <a href="#">

                                                                                <img src="new img/menu1.jpg" class="img-responsive" alt=""/>

                                                                            </a>

                                                                        </div>
                                                                    </div>

                                                                    <div class="menu-images">
                                                                        <div class="img-inner">
                                                                            <a href="#"><img src="new img/menu4.jpg" class="img-responsive" alt=""/></a>
                                                                        </div>
                                                                    </div>
                                                                </div><!-- end menu col1-->

                                                                <div class="col-sm-4"><!-- menu col2-->
                                                                    <div class="menu-images">
                                                                        <div class="img-inner">
                                                                            <a href="#"><img src="new img/menu2.jpg" class="img-responsive" alt=""/></a>
                                                                        </div>
                                                                    </div>

                                                                    <div class="menu-images">
                                                                        <div class="img-inner">
                                                                            <a href="#"><img src="new img/menu5.jpg" class="img-responsive" alt=""/></a>
                                                                        </div>
                                                                    </div>

                                                                    <div class="menu-images">
                                                                        <div class="img-inner">
                                                                            <a href="#"><img src="new img/menu6.jpg" class="img-responsive" alt=""/></a>
                                                                        </div>
                                                                    </div>

                                                                </div><!-- end menu col2-->

                                                                <div class="col-sm-4"><!-- menu col3-->
                                                                    <div class="menu-images">
                                                                        <div class="img-inner">
                                                                            <a href="#"><img src="new img/menu3.jpg" class="img-responsive" alt=""/></a>
                                                                        </div>
                                                                    </div>

                                                                    <div class="menu-images">
                                                                        <div class="img-inner">
                                                                            <a href="#"><img src="new img/menu7.jpg" class="img-responsive" alt=""/></a>
                                                                        </div>
                                                                    </div>

                                                                </div><!-- end menu col3-->		

                                                            </div><!-- end menu row1-->
                                                        </div><!-- end tab pane1-->

                                                        <div role="tabpanel" class="tab-pane fade in" id="breakfast"><!-- tab pane1-->
                                                            <div class="row" style="margin-top: 50px;"><!-- menu row3-->
                                                                <div class="col-sm-4"><!-- menu col1-->
                                                                    <div class="menu-images">
                                                                        <div class="img-inner">
                                                                            <a href="#"><img src="new img/menu1.jpg" class="img-responsive" alt=""/></a>
                                                                        </div>
                                                                    </div>

                                                                    <div class="menu-images">
                                                                        <div class="img-inner">
                                                                            <a href="#"><img src="new img/menu4.jpg" class="img-responsive" alt=""/></a>
                                                                        </div>
                                                                    </div>
                                                                </div><!-- end menu col1-->

                                                                <div class="col-sm-4"><!-- menu col2-->
                                                                    <div class="menu-images">
                                                                        <div class="img-inner">
                                                                            <a href="#"><img src="new img/menu2.jpg" class="img-responsive" alt=""/></a>
                                                                        </div>
                                                                    </div>

                                                                    <div class="menu-images">
                                                                        <div class="img-inner">
                                                                            <a href="#"><img src="new img/menu5.jpg" class="img-responsive" alt=""/></a>
                                                                        </div>
                                                                    </div>

                                                                    <div class="menu-images">
                                                                        <div class="img-inner">
                                                                            <a href="#"><img src="new img/menu6.jpg" class="img-responsive" alt=""/></a>
                                                                        </div>
                                                                    </div>

                                                                </div><!-- end menu col2-->

                                                                <div class="col-sm-4"><!-- menu col3-->
                                                                    <div class="menu-images">
                                                                        <div class="img-inner">
                                                                            <a href="#"><img src="new img/menu3.jpg" class="img-responsive" alt=""/></a>
                                                                        </div>
                                                                    </div>

                                                                    <div class="menu-images">
                                                                        <div class="img-inner">
                                                                            <a href="#"><img src="new img/menu7.jpg" class="img-responsive" alt=""/></a>
                                                                        </div>
                                                                    </div>

                                                                </div><!-- end menu col3-->		

                                                            </div><!-- menu row2-->
                                                        </div><!-- end tab pane1-->

                                                        <div role="tabpanel" class="tab-pane fade in" id="lunch"><!-- tab pane1-->
                                                            <div class="row" style="margin-top: 50px;"><!-- menu row2-->
                                                                <div class="col-sm-4"><!-- menu col1-->
                                                                    <div class="menu-images">
                                                                        <div class="img-inner">
                                                                            <a href="#"><img src="new img/menu1.jpg" class="img-responsive" alt=""/></a>
                                                                        </div>
                                                                    </div>

                                                                    <div class="menu-images">
                                                                        <div class="img-inner">
                                                                            <a href="#"><img src="new img/menu4.jpg" class="img-responsive" alt=""/></a>
                                                                        </div>
                                                                    </div>
                                                                </div><!-- end menu col1-->

                                                                <div class="col-sm-4"><!-- menu col2-->
                                                                    <div class="menu-images">
                                                                        <div class="img-inner">
                                                                            <a href="#"><img src="new img/menu2.jpg" class="img-responsive" alt=""/></a>
                                                                        </div>
                                                                    </div>

                                                                    <div class="menu-images">
                                                                        <div class="img-inner">
                                                                            <a href="#"><img src="new img/menu5.jpg" class="img-responsive" alt=""/></a>
                                                                        </div>
                                                                    </div>

                                                                    <div class="menu-images">
                                                                        <div class="img-inner">
                                                                            <a href="#"><img src="new img/menu6.jpg" class="img-responsive" alt=""/></a>
                                                                        </div>
                                                                    </div>

                                                                </div><!-- end menu col2-->

                                                                <div class="col-sm-4"><!-- menu col3-->
                                                                    <div class="menu-images">
                                                                        <div class="img-inner">
                                                                            <a href="#"><img src="new img/menu3.jpg" class="img-responsive" alt=""/></a>
                                                                        </div>
                                                                    </div>

                                                                    <div class="menu-images">
                                                                        <div class="img-inner">
                                                                            <a href="#"><img src="new img/menu7.jpg" class="img-responsive" alt=""/></a>
                                                                        </div>
                                                                    </div>

                                                                </div><!-- end menu col3-->		

                                                            </div><!-- menu row3--->
                                                        </div><!-- end tab pane1-->

                                                        <div role="tabpanel" class="tab-pane fade in" id="dinner"><!-- tab pane1-->
                                                            <div class="row" style="margin-top: 50px;"><!-- menu row4-->
                                                                <div class="col-sm-4"><!-- menu col1-->
                                                                    <div class="menu-images">
                                                                        <div class="img-inner">
                                                                            <a href="#"><img src="new img/menu1.jpg" class="img-responsive" alt=""/></a>
                                                                        </div>
                                                                    </div>

                                                                    <div class="menu-images">
                                                                        <div class="img-inner">
                                                                            <a href="#"><img src="new img/menu4.jpg" class="img-responsive" alt=""/></a>
                                                                        </div>
                                                                    </div>
                                                                </div><!-- end menu col1-->

                                                                <div class="col-sm-4"><!-- menu col2-->
                                                                    <div class="menu-images">
                                                                        <div class="img-inner">
                                                                            <a href="#"><img src="new img/menu2.jpg" class="img-responsive" alt=""/></a>
                                                                        </div>
                                                                    </div>

                                                                    <div class="menu-images">
                                                                        <div class="img-inner">
                                                                            <a href="#"><img src="new img/menu5.jpg" class="img-responsive" alt=""/></a>
                                                                        </div>
                                                                    </div>

                                                                    <div class="menu-images">
                                                                        <div class="img-inner">
                                                                            <a href="#"><img src="new img/menu6.jpg" class="img-responsive" alt=""/></a>
                                                                        </div>
                                                                    </div>

                                                                </div><!-- end menu col2-->

                                                                <div class="col-sm-4"><!-- menu col3-->
                                                                    <div class="menu-images">
                                                                        <div class="img-inner">
                                                                            <a href="#"><img src="new img/menu3.jpg" class="img-responsive" alt=""/></a>
                                                                        </div>
                                                                    </div>

                                                                    <div class="menu-images">
                                                                        <div class="img-inner">
                                                                            <a href="#"><img src="new img/menu7.jpg" class="img-responsive" alt=""/></a>
                                                                        </div>
                                                                    </div>

                                                                </div><!-- end menu col3-->		

                                                            </div><!-- menu row4-->
                                                        </div><!-- end tab pane1-->

                                                    </div><!-- end tabs content-->

                                                </div><!--end tab container-fluid-->




                                            </div><!--menu inner-->	
                                        </div><!-- end parallax-->
                                    </div><!--end menu-->	


                                    <div id="product" class="product-back" style="border: 1px solid black;">

                                        <div class="container-fluid" >
                                            <div class="row">


                                                <c:forEach items="${addproduct}" var="x" end="8">
                                                    <div class="col-sm-3 ">
                                                        <img  style="width:280px; height: 150px;" class="thumbnail" src="${x.getImagePath()}" alt="">
                                                        <h3>${x.getName()}</h3>
                                                        <a href="ViewSingleProduct.jsp?id=${x.getId()}" class="btn btn-primary">View Product</a>
                                                        <hr>
                                                    </div>


                                                </c:forEach>
                                            </div>


                                        </div>

                                    </div>	








                                    <!---- end menu section--->

                                    <!--- contact section--->

                                    <div id="contact" class="cls-contact"><!-- contact-->
                                        <div class="container"><!-- container-->
                                            <div class="row"><!-- row-->
                                                <div class="col-sm-12">
                                                    <div class="text-center con-title">
                                                        <h1><i> Get In Touch</i><h1>
                                                                </div>
                                                                </div>							
                                                                </div><!-- end row-->

                                                                <div class="row"><!-- 2nd row-->
                                                                    <div class="col-sm-6" style="top: 100px;">
                                                                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3424.008670823246!2d77.22044450984862!3d28.568529273277953!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xb9205fdecb25f898!2sNIIT+Delhi+South+Extension+Centre!5e0!3m2!1sen!2sin!4v1535818159501"
                                                                                width="100%" height="350" frameborder="0" style="border:0" allowfullscreen></iframe>
                                                                    </div>

                                                                    <div class="col-sm-6 con-col">
                                                                        <div class="abt-con">
                                                                            <h2> Contact Us</h2>
                                                                            <form class="">
                                                                                <div class="input-field">
                                                                                    <input type="text" name="" required="">
                                                                                    <label>Name</label>

                                                                                </div>

                                                                                <div class="input-field">
                                                                                    <input type="email" name="" required="">
                                                                                    <label>Email</label>

                                                                                </div>

                                                                                <div class="input-field">
                                                                                    <input type="tel" name="" required="">
                                                                                    <label>Mobile</label>

                                                                                </div>

                                                                                <div class="input-field">
                                                                                    <textarea rows="5" required=""></textarea>
                                                                                    <label>Message</label>
                                                                                </div>

                                                                                <input type="submit" name="" value="Send Message" class="btn con-btn">

                                                                            </form>

                                                                        </div>	


                                                                    </div>

                                                                </div><!-- end 2nd row-->


                                                                </div><!-- end container-->				
                                                                </div><!-- end contact-->




                                                                <!--- end of contact section--->


                                                                <!--========== FOOTER ==========-->
                                                                <div class="footer"><!--- footer-->
                                                                    <div class="container"><!-- container-->
                                                                        <div class="row fot-row"><!--- 1st footer row-->

                                                                            <div class="col-sm-3">
                                                                                <img class="img-responsive" src="images/logo-footer.png" alt="">
                                                                                <div class="text detail-text">
                                                                                    <a href="#"><i class="fas fa-map-marker-alt"><h4><i>South Ex Part-II, D-7 New Delhi</i></h4></i></a><br>
                                                                                    <a href="#"><i class="fas fa-phone"><h4><i style="font-size: 22px;">91+ 8851624647</i></h4></i></a><br>
                                                                                    <a href="#"><i class="fas fa-envelope"><h4><i style="font-size: 22px;">yashgniit283@gmail.com</i></h4></i></a>
                                                                                </div>
                                                                            </div>

                                                                            <div class="col-sm-3">
                                                                                <div class="text-center fot-text">
                                                                                    <h4> OPENING TIME </h4>
                                                                                    <h5>Monday - Friday</h5>
                                                                                    <h6> 10:00Am - 11:00Pm</h6>

                                                                                    <h5>Saturday - Sunday</h5>
                                                                                    <h6> 10:00Am - 12:00Pm</h6>

                                                                                </div>
                                                                            </div>

                                                                            <div class="col-sm-2">
                                                                                <div class="text-center fot-text2">
                                                                                    <h4> USEFULL LINKS </h4>
                                                                                    <a href="#"><h5> Speacial Items </h5></a>
                                                                                    <a href="#"><h5> Fresh Breakfast </h5></a>
                                                                                    <a href="#"><h5> Lunch Menu </h5></a>
                                                                                    <a href="#"><h5> Dinner Items </h5></a>
                                                                                    <a href="#"><h5> Fresh Food Zone </h5></a>
                                                                                    <a href="#"><h5> We Offerd Food </h5></a>
                                                                                </div>
                                                                            </div>

                                                                            <div class="col-sm-2">
                                                                                <div class="fot-img" style="margin-top: 25px;">
                                                                                    <img src="new img/sp6.jpg" class="img-responsive" alt="">
                                                                                </div>
                                                                            </div>

                                                                            <div class="col-sm-2" style="margin-top: 150px;">
                                                                                <div class="fot-img2">
                                                                                    <img src="new img/abt-1.jpg" class="img-responsive" alt="">
                                                                                </div>
                                                                            </div>


                                                                        </div><!--- end 1st footer row-->

                                                                        <div class="row fot-row2"><!-- 2nd footer row-->
                                                                            <div class="col-sm-7">
                                                                                <div class="text fot-text3">
                                                                                    <h5><i>© 2018 Restaura is powered by Yashraj.The property of their owners.</i></h5>
                                                                                </div>
                                                                            </div>


                                                                            <div class="col-sm-5 pull-right">
                                                                                <a href="#" data-toggle="tooltip" data-placement="bottom" title="google+" class="social-icon"><i class="fab fa-google-plus-g fa-2x"></i></a>
                                                                                <a href="#" data-toggle="tooltip" data-placement="bottom" title="twitter" class="social-icon"><i class="fab fa-twitter fa-2x"></i></a>
                                                                                <a href="#" data-toggle="tooltip" data-placement="bottom" title="instagram" class="social-icon"><i class="fab fa-instagram fa-2x"></i></a>
                                                                                <a href="#" data-toggle="tooltip" data-placement="bottom" title="facebook" class="social-icon"><i class="fab fa-facebook-f fa-2x"></i></a>
                                                                            </div>

                                                                        </div><!-- end 2nd footer row-->




                                                                    </div><!-- end container-->
                                                                </div><!--- end footer-->

                                                                <!--========== END FOOTER ==========-->

                                                                <!-- Back To Top -->
                                                                <a href="javascript:void(0);" class="js-back-to-top back-to-top">Top</a>

                                                                <!-- JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
                                                                <!-- CORE PLUGINS -->



                                                                <script src="vendor/jquery.min.js" type="text/javascript"></script>

                                                                <script src="vendor/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>

                                                                <!-- PAGE LEVEL PLUGINS -->

                                                                <script src="vendor/jquery.back-to-top.js" type="text/javascript"></script>
                                                                <script src="vendor/jquery.smooth-scroll.js" type="text/javascript"></script>

                                                                <script src="vendor/jquery.parallax.min.js" type="text/javascript"></script>

                                                                <!-- PAGE LEVEL SCRIPTS -->
                                                                <script src="js/layout.js" type="text/javascript"></script>


                                                                </div>

                                                                </div>
                                                                </div>
                                                                </div>
                                                                </div>
                                                                <!-- /#page-content-wrapper -->

                                                                </div>
                                                                <!-- /#wrapper -->

                                                                </body>

                                                                </html>


