<%-- 
    Document   : home-search
    Created on : Dec 31, 2023, 10:30:36 AM
    Author     : TGDD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="enity.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page language="java" contentType="text/html" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Search</title>
        <link rel="stylesheet" href="./css/pages/home-search.css" />
        <link rel="stylesheet" href="./css/main.css" />
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
              integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
            href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,400;0,600;1,200&display=swap"
            rel="stylesheet" />
    </head>
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
        <div class="container">
            <div class="mid">
                <h1 style="margin: 1rem 0; font-size: 2.5rem; color: var(--color-primary)">Kết quả tìm kiếm cho: ${query}</h1>
                <div class="itemsContainer">
                    <div class="title">
                        <h3>Khóa Học</h3>
                    </div>
                    <div class="items">
                        <c:choose>
                            <c:when test="${not empty cList}">
                                <c:forEach var="eCourse" items="${cList}">
                                    <div class="item">
                                        <div class="course-img">
                                            <img src=${eCourse.imageUrl} alt="" />
                                        </div>
                                        <div class="course-detail">
                                            <span>${eCourse.title}</span>
                                            <h3
                                                style="font-size: 20px; font-weight: normal; margin-bottom: 10px">
                                                ${eCourse.price} vnd</h3>
                                            <a href="courseinfoctl?id=${eCourse.courseID}"
                                               class="btn btn-link">Xem chi tiết</a>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <p>Không tìm thấy khóa học nào phù hợp với từ khóa ${query}. Vui lòng tìm kiếm từ khóa khác!</p>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
                <div class="itemsContainer">
                    <div class="title">
                        <h3>Blog</h3>
                    </div>
                    <div class="items">
                        <c:choose>
                            <c:when test="${not empty cList}">
                                <c:forEach var="blog" items="${bList}">
                                    <div class="item">
                                        <div class="detail">
                                            <span>${blog.title}</span>
                                            <a href="blog?id=${blog.blogID}"
                                               class="btn btn-link">Xem chi tiết</a>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <p>Không tìm thấy blog nào phù hợp với từ khóa ${query}. Vui lòng tìm kiếm từ khóa khác!</p>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
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
                                <a href="#"><i
                                        class="fa-brands fa-square-instagram"></i></a>
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
    </body>
</html>
