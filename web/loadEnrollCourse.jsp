<%-- Document : listCourse Created on : Nov 15, 2023, 10:36:38 AM Author : Admin --%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="enity.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
              integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet"
              href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
              integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />

        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
              integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet"
              href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
              integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />

        <link rel="stylesheet" href="./css/main.css" />

        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
              integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>

    <style>
        #container {

            padding-top: 100px;
            width: 1200px;
            margin: auto;
        }

        #header {
            display: flex;
            align-items: center;
            flex-direction: row;
            gap: 10px;
            justify-content: flex-end;
        }

        #btn {
            background-color: blue;
            text-decoration: none;
            color: white;
            border: none;
            padding: 8px 6px;
            border-radius: 4px;
        }

        #btn:hover {
            background-color: #3366ff;
            cursor: pointer;
        }

        #title {
            margin-bottom: 10px
        }

        #list-courses {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            grid-gap: 10px;
        }

        #course {
            cursor: pointer;
            box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px;
            border-radius: 10px;
            text-decoration: none;

        }

        #course-info p,
        h3 {
            margin: 0;

        }

        #course-info {
            height: 250px;
            display: flex;
            flex-direction: column;
            justify-content: space-around;
        }

        #course-info h3 {
            color: black;
        }


        #course-info p {
            color: gray;
        }

        #course-info img {
            width: 200px;
            height: 100px;
            border-radius: 10px;
        }

        #img {
            margin-bottom: 10px;
            display: flex;
            justify-content: center;
        }



        #course-info {
            padding: 10px;
            text-decoration: none;
        }

        #desc-price {
            margin: 4px 0;
            display: flex;
            justify-content: space-between;
            align-items: flex-end;
        }

        #price {
            font-size: 12px;
        }

        input {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border-radius: 10px;
            border: 1px solid gray;
        }

        .price-img {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            grid-gap: 30px;
        }

        .btn-price {
            background-color: greenyellow;
            text-align: center;
            padding: 6px 0;
            border-radius: 8px;
        }

        .nav {
            padding: 8px 0;
            width: 1400px;
            margin: auto;
        }

        .card-display-component {
            background-color: #e7f8ee;
            border-radius: var(--border-radius-default);
            padding: 20px 32px;
            height: 100%;
        }

        .card-display-component-img {
            /*            display: flex;
justify-content: center;
align-items: center;*/
            /*height: 150px;*/
        }

        .card-display-component-title {
            margin-top: 28px;
            text-align: center;
        }

        .input-container {
            position: relative;
            width: 100%;
        }

        .btn {
            width: 100%;
            font-size: 13px;
        }

        .btn-course {
            height: 100%;
        }

        .course-images {
            padding-top: 24px;
            position: relative;
        }

        .course-images a img {
            width: 100%;
            border-radius: 15px;
        }

        img {
            max-width: 100%;
        }


        .course-content {
            padding-top: 25px;
        }

        .courses-author {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .auth {
            display: flex;
            align-items: center;
        }

        .auth-name {
            flex: 1;
            padding-left: 12px;
        }

        .auth-name span {
            font-size: 13px;
            color: #52565b;
            font-family: "Montserrat", sans-serif;
            font-weight: 400;
        }

        .auth-name .name::before {
            content: "|| Admin";
            position: relative;
            color: #309255;
            font-family: "Montserrat", sans-serif;
            font-size: 14px;
            font-weight: 400;
        }

        /*        h4{
font-size: calc(1.275rem + 0.3vw);
}*/

        h4 {
            margin: 4px 0;
        }

        h4 a {
            font-size: 14px;
            font-weight: 500;
            color: #212832;
            display: inline-block;
            line-height: 1.4;
        }

        .title {
            display: flex;
            margin-bottom: 10px;
        }

        .container {
            padding: 20px 0;
        }

        .section-title h2 {
            font-size: 35px;
            font-weight: 500;
            margin: 0;
            line-height: 1.4;
        }

        .section-title h2 span {
            color: #309255;
        }


        .swiper-container-pointer-events {
            touch-action: pan-y;
        }

        .swiper-container {
            margin-left: auto;
            margin-right: auto;
            position: relative;
            overflow: hidden;
            list-style: none;
            padding: 0;
            z-index: 1;
        }

        ul {
            transition-duration: 0ms;
            transform: translate3d(0px, 0px, 0px);
            padding: 0;
            list-style: none;
            margin: 0;
        }

        .nav {
            display: flex;
            flex-wrap: nowrap;
            padding-left: 0;
            margin-bottom: 0;
            list-style: none;
        }

        .swiper-wrapper {
            position: relative;
            width: 100%;
            height: 100%;
            z-index: 1;
            display: flex;
            transition-property: transform;
            box-sizing: content-box;
        }

        li {
            width: 160px;
            margin-right: 30px;
        }

        .swiper-slide {
            flex-shrink: 0;
            width: 100%;
            height: 100%;
            position: relative;
            transition-property: transform;
        }

        .tag a {
            width: 80px;
            font-size: 13px;
            height: 35px;
            line-height: 35px;
            background-color: #e7f8ee;
            color: #309255;
            display: inline-block;
            text-align: center;
            border-radius: 5px;
            padding: 0 10px;
        }

        .course-meta {
            display: flex;

            justify-content: space-between;
            padding-top: 10px;
        }

        .course-meta span {
            font-size: 14px;
            font-weight: 400;
            color: #52565b;
            margin-right: 20px;
            display: inline-block;
            line-height: 1;
        }

        .course-meta span i {
            color: #309255;
            margin-right: 5px;
            font-size: 20px;
            display: inline-block;
            line-height: 1;
        }

        .courses-price-review {
            padding: 10px 10px;
            background-color: #eefbf3;
            border-radius: 10px;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 20px 0;
        }

        .banner {
            background: #eefbf3;
        }

        .main-title {
            color:
                #1d2733;
            font-family:
                Montserrat;
            font-size:
                40px;
            font-weight:
                500;
            grid-area:
                auto;
            line-height:
                52px;
            margin:
                25px 0px 0px;
        }

        .sub-title {
            font-weight: 500;
            margin-bottom: 0;
            color: #309255;
            font-size: 16px;
        }

        li {
            width: fit-content;
            margin: 0;
        }

        .main-title span {
            color: #309255;

        }



        .shape-author img {
            border-radius: 100%;
            width: 150px;
            float: right;
        }

        .box-content {
            width: 140px;
            height: 140px;
            text-align: center;
            border: 1px solid rgba(48, 146, 85, 0.2);
            border-radius: 50%;
            margin: 0 auto;
            padding: 10px;
        }

        .box-wrapper {
            background-color: #309255;
            display: flex;
            justify-content: center;
            align-items: center;
            border-radius: 50%;
            width: 100%;
            height: 100%;
        }

        .box-wrapper i {
            font-size: 70px;
            color: #fff;
            display: block;
            line-height: 1;
        }

        .right {
            display: flex;
        }
    </style>

    <body>
        <header>
            <div class="grid wide header">
                <a href="/elearning/home">
                    <img src="./assets/logo.png" alt="Logo" />
                </a>
                <nav>
                    <a href="/elearning/home">Trang chủ</a>
                    <a href="/elearning/loadallcourse">Khóa học</a>
                    <a href="/elearning/listblog">Blog</a>
                    <a href="/elearning/contact.html">Liên hệ</a>
                </nav>
                <div class="login-nav">
                    <a href="/elearning/user">
                        <img class="avatar" src="./assets/icon/user.png" alt="image" />
                    </a>
                </div>
                <i class="menu-btn fa-solid fa-bars" onclick="openOverlay('header-mobile')"></i>
            </div>
        </header>

        <div class="banner">
            <div class="grid container wide">
                <div class="row">
                    <div style="margin: auto" class="col l-6 c-12">
                        <!--<div class="card-display-component">-->
                        <div class="card-display-component-img">
                            <ul class="breadcrumb">
                                <li><a href="/">Home</a></li>
                                <li>
                                    <a class="breadcrumb-active" href="/">Courses</a>
                                </li>
                            </ul>
                            <h4 class="main-title">
                                My
                                <span>Courses</span>
                            </h4>
                        </div>

                        <!--</div>-->
                    </div>
                    <div class=" right col l-6 c-12 ">

                        <div class="box-content">
                            <div class="box-wrapper">
                                <i class="fa-solid fa-ribbon"></i>
                            </div>
                        </div>

                        <div class="shape-author">
                            <img
                                src="https://htmldemo.net/edule/eduLe/assets/images/author/author-11.jpg" />
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="grid container wide">

            <div class="card-display-component">
                <div class="card-display-component-img">
                    <div class="row">
                        <div class="col l-12 c-12">
                            <div class="input-container">
                                <input class="input" placeholder="Search here" type="text" />
                                <button class="btn input-ic btn-icon">
                                    <i class="fa-solid fa-magnifying-glass"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col l-2-4 m-4 c-6">
                            <button class="btn btn-primary">All courses</button>
                        </div>
                        <div class="col l-2-4 m-4 c-6">
                            <button class="btn btn-outline-primary">Collections</button>

                        </div>
                        <div class="col l-2-4 m-4 c-6">
                            <button class="btn btn-outline-primary">Wishlist</button>

                        </div>
                        <div class="col l-2-4 m-4 c-6">
                            <button class="btn btn-outline-primary">Archived</button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <c:forEach var="p" items="${cList}">
                    <div class="col l-4 m-6 c-12">
                        <button onclick="redirectToCourse('${p.course.courseID}')"
                                class="btn btn-course btn-outline-secondary">
                            <div class="single-courses">
                                <div class="course-images">
                                    <a href="#">
                                        <img src=${p.course.imageUrl} alt="alt" />
                                    </a>
                                    <div class="courses-option dropdown"></div>
                                </div>
                                <div class="course-content">
                                    <div class="courses-author">
                                        <div class="auth">
                                            <div class="auth-thumb">
                                                <img class="avatar"
                                                     src="https://placehold.co/100x100"
                                                     alt="image" />
                                            </div>
                                            <div class="auth-name">
                                                <span>${p.course.teacherName}</span>
                                                <span class="name"></span>
                                            </div>
                                        </div>
                                    </div>
                                    <h4 class="title">
                                        <a>${p.course.descriptionCourse}</a>
                                    </h4>

                                </div>
                            </div>
                        </button>

                    </div>

                </c:forEach>
            </div>

        </div>

        <footer>
            <div class="grid widget wide">
                <div class="row">
                    <div class="col l-3 m-6 c-12">
                        <a href="#"><img src="././assets/logo.png" alt="Logo" /></a>

                        <div class="widget-address">
                            <h4>Km 10, Trần Phú</h4>
                            <p>Hà Đông, Hà Nội</p>
                        </div>

                        <ul class="widget-info">
                            <li>
                                <p>
                                    <i class="fa-solid fa-envelope"></i>
                                    <a href="mailto:ptit@gmail.com">ptit@gmail.com</a>
                                </p>
                            </li>
                            <li>
                                <p>
                                    <i class="fa-solid fa-phone"></i>
                                    <a href="tel:9702621413">(970) 262-1413</a>
                                </p>
                            </li>
                        </ul>

                        <ul class="widget-social">
                            <li>
                                <a href="#"><i class="fa-brands fa-facebook-f"></i></a>
                            </li>
                            <li>
                                <a href="#"><i class="fa-brands fa-twitter"></i></a>
                            </li>
                            <li>
                                <a href="#"><i class="fa-brands fa-skype"></i></a>
                            </li>
                            <li>
                                <a href="#"><i class="fa-brands fa-square-instagram"></i></a>
                            </li>
                        </ul>
                    </div>
                    <div class="col l-3 m-6 c-12">
                        <h4 class="footer-widget-title">Loại khóa học</h4>
                        <ul class="widget-link">
                            <li><a href="#">Văn bản sáng tạo</a></li>
                            <li><a href="#">Phim & Video</a></li>
                            <li><a href="#">Thiết kế đồ họa</a></li>
                            <li><a href="#">Thiết kế UI/UX</a></li>
                            <li><a href="#">Phân tích kinh doanh</a></li>
                            <li><a href="#">Tiếp thị</a></li>
                        </ul>
                    </div>
                    <div class="col l-3 m-6 c-12">
                        <h4 class="footer-widget-title">Truy cập nhanh</h4>
                        <ul class="widget-link">
                            <li><a href="#">Chính sách bảo mật</a></li>
                            <li><a href="#">Thảo luân</a></li>
                            <li><a href="#">Điều khoản - điều kiện</a></li>
                            <li><a href="#">Hỗ trợ khách hàng</a></li>
                            <li><a href="#">Câu hỏi thường gặp</a></li>
                        </ul>
                    </div>
                    <div class="col l-3 m-6 c-12">
                        <h4 class="footer-widget-title">Đăng ký</h4>

                        <div>
                            <p>Đăng ký để được tư vấn miễn phí!</p>

                            <div class="widget-form">
                                <form action="#">
                                    <input class="input" placeholder="Điền email vào đây" />
                                    <button class="btn btn-primary">Đăng ký ngay</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="footer-copyright">
                <div class="grid wide">
                    <div class="row">
                        <div class="copyright-link">
                            <a href="#">Điều khoản dịch vụ</a>
                            <a href="#">Chính sách</a>
                            <a href="#">Sơ đồ trang</a>
                            <a href="#">Bảo mật</a>
                        </div>
                        <div class="copyright-text">
                            © 2023 <span> Edule </span> Tạo bởi
                            <a href="#">Nhóm 4 - 9</a>
                        </div>
                    </div>
                </div>
            </div>
        </footer>


        <!--        <div class="nav">
<a href="loadallcourse">Home</a>     
<a href="loadCourse">Course</a>            
<a href="loadenrollcourse">Enroll Course</a>


</div>
<div id="container">



<div>
<div id="list-courses">

        <c:forEach var="p" items="${cList}">
            <a href="/elearning/courseinfoctl?id=${p.course.courseID}" id="course">
                <div id="course-info">
                    <div id="img">
                        <img src=${p.course.imageUrl} alt="alt"/>
                    </div>
                    <div>
                            <p id="price">${p.course.teacherName}</p>
                        <div id="desc-price">
                            <h3 >${p.course.title}</h3>
                        </div>
                        <div id="desc-price">
                            <p id="desc">${p.course.descriptionCourse}</p>
                            
                        </div>
                        <div id="desc-price">
                            <p id="desc">
                                <i class="fa-regular fa-clock"></i>
            ${p.course.duration}</p>
        <p id="price">10 Lectures</p>    
    </div>
        
        <div class="btn-price">
            <p class="price">$${p.course.price}</p>
        </div>
</div>
</div>
</a>
        </c:forEach>


    </div>
</div>
</div>-->
    </body>
    <script>
        function redirectToCourse(courseID) {
            // Thực hiện chuyển hướng khi button được nhấp
            window.location.href = "/elearning/courseinfoctl?id=" + courseID;
        }
    </script>

</html>