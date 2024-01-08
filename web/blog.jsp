<%-- Document : blog Created on : Nov 16, 2023, 5:34:02 AM Author : duong --%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="enity.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Blog</title>

        <link rel="stylesheet" href="./css/main.css" />
        <link rel="stylesheet" href="./css/pages/blog.css" />
        <script src="https://kit.fontawesome.com/1e40a0bb55.js" crossorigin="anonymous"></script>
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
              integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>

    <body>
        <div class="main-wrapper">
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

            <div class="containerer">
                <div class="grid wide">
                    <div class="row">
                        <div class="col l-4 c-4">
                            <div class="sidebar">
                                <div class="input-container sidebar-widget">
                                    <input class="input" placeholder="Tìm kiếm" type="text">
                                    <button class="btn input-ic btn-icon">
                                        <i class="fa-solid fa-magnifying-glass"></i>
                                    </button>
                                </div>

                                <div class="sidebar-widget">
                                    <h4 class="widget-title">Bài đăng gần đây</h4>
                                    <div class="widget-post">
                                        <ul class="post-items">
                                            <c:set var="count" value="0" />
                                            <c:forEach var="p" items="${listBlog}">
                                                <c:if test="${count lt 3}">
                                                    <li>
                                                        <div class="single-post">
                                                            <div class="post-content">
                                                                <h5 class="title">
                                                                    <a class="title-blog"
                                                                       href="/elearning/blog?id=${p.getBlogID()}">${p.getTitle()}</a>
                                                                </h5>
                                                                <span>
                                                                    <img src="./assets/icon/date.png"
                                                                         alt="Icon date" />
                                                                    <p>${p.getCreatedDate()}</p>
                                                                </span>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <!-- Tăng biến đếm sau mỗi lần lặp -->
                                                    <c:set var="count" value="${count + 1}" />
                                                </c:if>
                                            </c:forEach>

                                        </ul>
                                    </div>
                                </div>

                                <div class="sidebar-widget">
                                    <h4 class="widget-title">Chủ đề phổ biến</h4>
                                    <div class="widget-tags">
                                        <ul class="tags-list">
                                            <li><a href="#">Design</a></li>
                                            <li><a href="#">Education</a></li>
                                            <li><a href="#">Education</a></li>
                                            <li><a href="#">Design</a></li>
                                            <li><a href="#">Design</a></li>
                                            <li><a href="#">Education</a></li>
                                            <li><a href="#">Education</a></li>
                                            <li><a href="#">Design</a></li>
                                        </ul>
                                    </div>
                                </div>

                                <div class="sidebar-widget">
                                    <h4 class="widget-title">Chia sẻ Blog</h4>

                                    <ul class="social">
                                        <li><a href="#"><i class="fa-brands fa-facebook"></i></a>
                                        </li>
                                        <li><a href="#"><i class="fa-brands fa-linkedin"></i></a>
                                        </li>
                                        <li><a href="#"><i class="fa-brands fa-twitter"></i></a>
                                        </li>
                                        <li><a href="#"><i class="fa-solid fa-envelope"></i></a>
                                        </li>
                                        <li><a href="#"><i class="fa-brands fa-instagram"></i></a>
                                        </li>
                                    </ul>
                                </div>

                            </div>
                        </div>
                        <div class="col l-8">
                            <div class="blog-details">
                                <div class="blog-details-meta">
                                    <div class="blog-meta">
                                        <span>
                                            <img src="./assets/icon/date.png" alt="Icon date" />
                                            <p>${b.getCreatedDate()}</p>
                                        </span>
                                        <span>
                                            <img src="./assets/icon/view.png" alt="Icon date" />
                                            <p>${b.getTotalView()}</p>
                                        </span>
                                    </div>

                                    <div class="blog-type">
                                        <button class="btn btn-secondary btn-secondary-meta">
                                            Khoa học
                                        </button>
                                    </div>

                                </div>

                                <h2 class="title">
                                    ${b.getTitle()}
                                </h2>

                                <div class="blog-details-description">
                                    <p>${b.getContent()}</p>
                                </div>

                                <div class="blog-details-label">
                                    <h4 class="label">Chủ đề:</h4>
                                    <ul class="tag-list">
                                        <li><a href="#">Design</a></li>
                                        <li><a href="#">Education</a></li>
                                        <li><a href="#">Education</a></li>
                                        <li><a href="#">Design</a></li>
                                    </ul>
                                </div>

                                <div class="blog-details-label">
                                    <h4 class="label">Chia sẻ:</h4>
                                    <ul class="social">
                                        <li><a href="#"><i class="fa-brands fa-facebook"></i></a>
                                        </li>
                                        <li><a href="#"><i class="fa-brands fa-linkedin"></i></a>
                                        </li>
                                        <li><a href="#"><i class="fa-brands fa-twitter"></i></a>
                                        </li>
                                        <li><a href="#"><i class="fa-solid fa-envelope"></i></a>
                                        </li>
                                        <li><a href="#"><i class="fa-brands fa-instagram"></i></a>
                                        </li>
                                    </ul>
                                </div>

                            </div>

                            <div class="blog-details-comment">

                                <c:if test="${not empty idUser}">
                                    <div class="comment-form">
                                        <h3 class="title">Bình luận tại đây</h3>
                                        <div class="form-wrapper">
                                            <form action="/elearning/blogaddcomment" method="post">
                                                <input name="elseID" hidden="true"
                                                       value="${b.getBlogID()}" />
                                                <div class="row">
                                                    <div class="col form-comment">
                                                        <div class="single-form">
                                                            <!--<input name="description" placeholder="Nhap binh luan cua ban" type="text"/>-->
                                                            <textarea name="description" rows="4"
                                                                      cols="50"
                                                                      placeholder="Nhập bình luận của bạn"></textarea>
                                                        </div>

                                                        <div class="col form-comment">
                                                            <div class="single-form text-center">
                                                                <button class="btn btn-primary"
                                                                        type="submit">Bình luận</button>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </c:if>
                                <div class="comment-wrapper">
                                    <h3 class="title"> Các bình luận </h3>
                                    <ul class="comment-item">
                                        <c:forEach var="m" items="${cmtList}">
                                            <li>
                                                <div class="single-comment">
                                                    <div class="comment-author">
                                                        <div class="name">
                                                            <h4>${m.user.getName()}</h4>
                                                        </div>
                                                        <div class="meta">
                                                            <span class="email">
                                                                ${m.user.getEmail()}
                                                            </span>
                                                            <span class="time">
                                                                <p>${m.getCreatedDate()}</p>
                                                            </span>
                                                        </div>
                                                    </div>
                                                    <div class="description">
                                                        ${m.getDescription()}
                                                    </div>
                                                </div>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>

                        </div>
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
    </body>

</html>