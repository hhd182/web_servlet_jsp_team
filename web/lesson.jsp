<%-- Document : lesson Created on : Dec 25, 2023, 2:14:50 PM Author : My Asus --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <title>Bài học</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="./css/main.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
              integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="./css/pages/lesson.css" />
    </head>

    <body>
        <header>
            <div class="grid wide header">
                <a href="/elearning/home">
                    <img src="./assets/logo.png" alt="Logo" />
                </a>
                <nav>
                    <a href="/elearning/home">Trang chủ</a>
                    <a class="nav-active" href="/elearning/loadallcourse">Khóa học</a>
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
        <div id="header-mobile" class="overlay">
            <div class="header-mobile">
                <div class="login-nav avatar-container">
                    <img class="avatar" src="https://placehold.co/100x100" alt="image" />
                    <div>
                        <div>
                            Trần Doãn Đô
                        </div>
                        <a href="/">Xem trang cá nhân</a>
                    </div>
                </div>
                <!-- <div class="login-nav">
          <a href="/">
            <button class="btn btn-fullwidth btn-primary">Đăng nhập</button>
          </a>
          <a href="/">
            <button class="btn btn-fullwidth btn-outline-primary">
              Đăng ký
            </button>
          </a>
        </div> -->
                <nav>
                    <a class="nav-active" href="/">Trang chủ</a>
                    <a href="/">Khóa học</a>
                    <a href="/">Blog</a>
                    <a href="/">Liên hệ</a>
                </nav>
            </div>
        </div>
        <div class="row no-gutters">
            <div class="col m-8 c-12">
                <video controls width="100%">
                    <source src="./assets/videos/${lesson.getVideoURL()}">
                    Your browser does not support the video tag.
                </video>
                <div class="video-content">
                    <h1 class="video-title">
                        ${lesson.getName()}
                    </h1>
                    <p>
                        ${lesson.getDesctiption()}
                    </p>
                </div>
            </div>
            <div class="col m-4 c-12">
                <div class="courses-video-playlist">
                    <h3 class="playlist-title">
                        Tổng số: <span>${ListLessonPart.size()} chương học
                    </h3>

                    <!-- Video Playlist Start  -->
                    <div class="video-playlist">
                        <div class="accordion" id="videoPlaylist">
                            <c:forEach var="lessonPart" items="${ListLessonPart}" varStatus="loop">
                                <div class="accordion-item">
                                    <button class="collapsed" type="button">
                                        ${lessonPart.getTitle()}
                                    </button>
                                    <div class="accordion-collapse collapse">
                                        <nav class="vids">
                                            <c:forEach var="lesson" items="${lessonPart.getListLesson()}"
                                                       varStatus="loop">
                                                <a class="link"
                                                   href="/elearning/lesson?LessonID=${lesson.getLessonID()}&CourseID=${CourseID}">
                                                    ${lesson.getName()}
                                                </a>
                                            </c:forEach>
                                        </nav>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <!-- Video Playlist End  -->

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
    </body>
    <script src="./js/lesson/lesson.js"></script>

</html>