<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Trang đăng nhập</title>
        <link rel="stylesheet" href="./css/main.css" />
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
            integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
            />
    </head>
    <body>
        <header>
            <div class="grid wide header">
                <a href="/elearning/home">
                    <img src="./assets/logo.png" alt="Logo" />
                </a>
                <nav>
                    <a class="nav-active" href="/elearning/home">Trang chủ</a>
                    <a href="/elearning/loadenrollcourse">Khóa học</a>
                    <a href="/elearning/listblog">Blog</a>
                    <a href="/elearning/contact.html">Liên hệ</a>
                </nav>
                <div class="login-nav">
                    <a href="/elearning/login">
                        <button class="btn btn-secondary">Đăng nhập</button>
                    </a>
                    <a href="/elearning/register"> Đăng ký </a>
                </div>
                <i
                    class="menu-btn fa-solid fa-bars"
                    onclick="openOverlay('header-mobile')"
                    ></i>
            </div>
        </header>
    <bottom>
        <div class="grid wide">
            <div class="register-login-wrapper" style="margin: 70px">
                <div
                    class="row align-items-center"
                    style="display: flex; align-items: center; justify-content: center"
                    >
                    <div class="col l-6">
                        <div class="register-login-images">
                            <div class="shape-1">
                                <img src="./assets/shape/shape-26.png" alt="" />
                            </div>
                            <img
                                src="./assets/register-login.png"
                                alt=""
                                style="width: 100%"
                                />
                        </div>
                    </div>
                    <div class="col l-6">
                        <div class="register-login-form">
                            <h1 class="title" style="padding: 12px">Đăng nhập</h1>
                            <form class="col" action="login" method="post">
                                <input
                                    type="text"
                                    name="username"
                                    id=""
                                    placeholder="Tài khoản"
                                    class="input input-fullwidth single-form"
                                     required="required"
                                    />
                                <input
                                    type="password"
                                    name="password"
                                    id=""
                                    placeholder="Mật khẩu"
                                    class="input input-fullwidth single-form"
                                    required="required"
                                    />
                                <input
                                    type="submit"
                                    name=""
                                    id=""
                                    value="Đăng nhập"
                                    class="btn btn-primary single-form"
                                    style="border: 0px; width: 100%"
                                    />
                            </form>
                            <form class="col" action="register" method="get">
                                <input
                                    type="submit"
                                    name=""
                                    id=""
                                    value="Đăng ký"
                                    class="btn btn-secondary"
                                    style="border: 0px; width: 100%; margin-top: 10px"
                                    />
                            </form>
                            <div class="forget-pass">
                                <a href="/elearning/forgetpassword" style="color: blue; margin-right: 15px"
                                   >Quên tài khoản hoặc mật khẩu</a
                                >
                            </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </bottom>

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
    <div class="overlay" id="dialog">
        <div class="modal">
            <i class="close-icon fa-solid fa-xmark"></i>
            <h3 class="modal-title">
                Lorem ipsum dolor, sit amet consectetur adipisicing elit. Iusto, sunt
                a excepturi vel, eaque est, dicta natus tempora unde esse id corporis
                maxime. Temporibus architecto repudiandae esse nulla, id accusamus?
            </h3>
            <div class="modal-content">
                Lorem ipsum dolor sit amet consectetur adipisicing elit. Fuga ullam
                vitae quisquam repudiandae obcaecati
            </div>
            <div class="modal-action">
                <button class="btn btn-outline-primary">Button 1</button>
                <button class="btn btn-primary">Button 2</button>
            </div>
        </div>
    </div>
    <div class="toast" id="toast-success">
        <i class="sucess-icon fa-solid fa-circle-check"></i>
        <div class="toast-message">
            <span class="toast-title text-success">Thành công!</span> Tài khoản đã được tạo
        </div>
        <i class="close-icon close-icon fa-solid fa-xmark"></i>
    </div>
    <div class="toast" id="toast-error">
        <i class="error-icon fa-solid fa-circle-exclamation"></i>
        <div class="toast-message">
            <span class="toast-title text-error">Lỗi!</span> Tài khoản hoặc mật khẩu không chính xác
        </div>
        <i class="close-icon fa-solid fa-xmark"></i>
    </div>
    <div class="toast" id="toast-warning">
        <i class="warning-icon fa-solid fa-triangle-exclamation"></i>
        <div class="toast-message">
            <span class="toast-title text-warning">Cảnh báo!</span> Dữ liệu của bạn
            đã bị thay đổi bởi người dùng khác.
        </div>
        <i class="close-icon fa-solid fa-xmark"></i>
    </div>
    <div class="toast" id="toast-info">
        <i class="info-icon fa-solid fa-circle-info"></i>
        <div class="toast-message">
            <span class="toast-title text-info">Thông tin!</span> Bạn nên đọc kỹ nội
            dung trước khi gửi phê duyệt.
        </div>
        <i class="close-icon fa-solid fa-xmark"></i>
    </div>
    <script src="./js/toastAndModel.js"></script>
    <c:if test="${not empty requestScope.successMessage}">
        <script>
          
             openToast("toast-success");
        </script>
    </c:if>
        
    <c:if test="${not empty requestScope.errorMessage}">
        <script>
                        openToast("toast-error");
        </script>
    </c:if>    
    
        
</body>
</html>
