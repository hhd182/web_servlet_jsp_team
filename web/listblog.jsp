<%-- Document : listblog Created on : Nov 15, 2023, 11:08:34 AM Author : duong --%>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="enity.*" %>


<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List blog</title>
        <link rel="stylesheet" href="./css/main.css" />
        <link rel="stylesheet" href="./css/pages/listblog.css" />
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
              integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
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
                    <a class="nav-active" href="/elearning/listblog">Blog</a>
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

        <div class="page-banner">
            <img class="shape-1" src="./assets/blog/shape-1.png" alt="Shape">
            <img class="shape-2" src="./assets/blog/shape-2.png" alt="Shape">
            <div class="container-banner">
                <div class="page-banner-content">
                    <ul class="breadcrumb">
                        <li><a href="/elearning/loadallcourse">Elearning</a></li>
                        <li class="nav-active">Blog</li>
                    </ul>
                    <h2 class="title">Our <span>Blog</span></h2>
                </div>
            </div>

            <div class="box-badge">
                <div class="badge-wrapper">
                    <img class="badge" src="./assets/blog/badge.png" alt="Badge">
                </div>
                <img class="shape-6" src="./assets/blog/shape-6.png" alt="Shape">

            </div>
            <img class="shape-3" src="./assets/blog/shape-3.png" alt="Shape">
            <img class="shape-4" src="./assets/blog/shape-4.png" alt="Shape">
            <img class="shape-5" src="./assets/blog/shape-5.png" alt="Shape">
        </div>

        <div class="container">
            <div class="grid wide">
                <div class="row">
                    <c:forEach var="p" items="${listBlog}">
                        <div class="col l-4 c-6">
                            <div class="single-blog">
                                <div class="blog-image">
                                    <a href="/elearning/blog?id=${p.getBlogID()}">
                                        <img src="${p.urlImg}" alt="Picture blog">
                                    </a>
                                </div>
                                <div class="blog-conten">
                                    <h3 class="title" style="font-size: 20px;"> ${p.getTitle()}</h3>
                                    <div class="blog-meta">
                                        <span>
                                            <img src="./assets/icon/date.png" alt="Icon date" />
                                            <p>${p.getCreatedDate()}</p>
                                        </span>
                                        <span>
                                            <img src="./assets/icon/view.png" alt="Icon date" />
                                            <p>${p.getTotalView()}</p>
                                        </span>
                                    </div>
                                    <button class="btn btn-secondary"
                                            onclick="redirectToBlog(`${p.getBlogID()}`)">
                                        Xem thêm
                                    </button>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div class="page-pagination">
                <ul class="pagination">
                    <li><a href="#"> <img src="./assets/icon/left-arrow.png" alt="Left arrow" />
                        </a></li>
                    <li><a class="active" href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#"><img src="./assets/icon/right-arrow.png" alt="Left arrow" />
                        </a></li>
                </ul>
            </div>

        </div>
    </div>


    <footer>
        <div class="grid widget wide">
            <div class="row">
                <div class="col l-3 m-6 c-12">
                    <a href="#"><img src="./assets/logo.png" alt="Logo" /></a>

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
                        <a href="#">Nhóm 4 - Lập trình web cơ bản</a>
                    </div>
                </div>
            </div>
        </div>
    </footer>

    <script src="./js/toastAndModel.js"></script>
    <script src="./js/blog.js"></script>
</body>

</html>