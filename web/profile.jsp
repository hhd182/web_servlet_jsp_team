<%-- Document : profile Created on : Nov 4, 2023, 9:49:41 AM Author : TGDD --%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
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
        <title>User's Profile</title>
        <link rel="stylesheet" href="./css/profile.css" />
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
        <% if(session.getAttribute("id")==null){ response.sendRedirect("login.jsp"); } %>
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
        <div class="mid">
            <div class="container">
                <aside>
                    <div class="top">
                        <h1>Học Viên</h1>
                    </div>
                    <div class="sidebar">
                        <div class="s-info s choose" id="a-info">
                            <a href="#"> Thông Tin Học Viên </a>
                        </div>
                        <div class="s-courses s" id="a-courses">
                            <a href="#"> Khóa Học Của Bạn </a>
                        </div>
                        <div class="s-security s" id="a-security">
                            <a href="#"> Bảo Mật </a>
                        </div>
                        <div class="s" id="openDeposit">
                            <a href="user-deposit"> Nạp tiền </a>
                        </div>
                        <div class="s-logout s">
                            <a href="logout"> Đăng Xuất </a>
                        </div>
                    </div>
                </aside>
                <main>
                    <div class="info active">
                        <%--<c:set var="=user" value="${requestScope.user}" />--%>
                        <form action="user-update" method="POST" class="main">
                            <div class="title">
                                <h3>Thông Tin</h3>
                            </div>
                            <label for="name">Họ tên:</label>
                            <input type="text" id="name" name="name" value="${user.name}" />

                            <label for="dob">Ngày sinh:</label>
                            <input type="text" id="dob" name="dob"
                                   value="${user.dateOfBirth}" />


                            <label for="email">Email:</label>
                            <input type="email" id="email" name="email"
                                   value="${user.email}" />

                            <label for="pNum">SĐT:</label>
                            <input type="text" id="pNum" name="pNum"
                                   value="${user.phoneNumber}" />

                            <label for="money">Số dư khả dụng:</label>
                            <input type="text" id="money" readonly="true" name="money"
                                   value="${user.money}" />
                            <div class="btn-container">
                                <input type="submit" id="updateBtn" class="btn btn-primary"
                                       value="Cập nhật" onclick="openToast('toast-success')" />
                                <input type="reset" id="resetBtn"
                                       class="btn btn-outline-primary"
                                       onclick="openToast('toast-success')" value="Reset" />
                            </div>
                        </form>
                    </div>
                    <div class="courses main">
                        <div class="title">
                            <h3>Khóa Học</h3>
                        </div>
                        <div class="course-cards">
                            <c:forEach var="eCourse" items="${ecList}">
                                <div class="course-card">
                                    <div class="course-img">
                                        <img src=${eCourse.imageUrl} alt="" />
                                    </div>
                                    <div class="course-detail">
                                        <span>${eCourse.title}</span>
                                        <h3
                                            style="font-size: 20px; font-weight: normal; margin-bottom: 10px">
                                            ${eCourse.price} vnd</h3>
                                        <a href="courseinfoctl?id=${eCourse.courseID}"
                                           class="detail">Xem chi tiết</a>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="security">
                        <form action="user-change-password" method="post" class="main"
                              onsubmit="return validateChangePasswordForm()">
                            <div class="title">
                                <h3>Đổi Mật Khẩu</h3>
                            </div>
                            <label for="password">Nhập mật khẩu của bạn</label>
                            <input type="password" id="password" name="password" />
                            <label for="password">Nhập mật khẩu mới</label>
                            <input type="password" id="nPassword" name="new-password" />
                            <label for="password">Xác nhận mật khẩu mới</label>
                            <input type="password" id="rnPassword" name="re-new-password" />
                            <div class="btn-container">
                                <input type="submit" id="changeBtn" class="btn btn-primary"
                                       value="Đổi mật khẩu"
                                       onclick="openToast('toast-success')" />
                                <input type="reset" id="rsBtn"
                                       class="btn btn-outline-primary"
                                       onclick="openToast('toast-success')" value="Reset" />
                            </div>
                        </form>
                    </div>
                </main>
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
        <div class="overlay" id="dialog">
            <div class="modal">
                <i class="close-icon fa-solid fa-xmark"></i>
                <h3 class="modal-title">
                    Xác Nhận
                </h3>
                <div class="modal-content">
                    Bạn có xác nhận tiếp tục?
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
                <span class="toast-title text-success">Thành công!</span>
            </div>
            <i class="close-icon close-icon fa-solid fa-xmark"></i>
        </div>
        <div class="toast" id="toast-error">
            <i class="error-icon fa-solid fa-circle-exclamation"></i>
            <div class="toast-message">
                <span class="toast-title text-error">Đã xảy ra lỗi!</span> Vui lòng kiểm tra
                lại.
            </div>
            <i class="close-icon fa-solid fa-xmark"></i>
        </div>
        <div class="toast" id="toast-warning">
            <i class="warning-icon fa-solid fa-triangle-exclamation"></i>
            <div class="toast-message">
                <span class="toast-title text-warning">Cảnh báo!</span>
            </div>
            <i class="close-icon fa-solid fa-xmark"></i>
        </div>
        <div class="toast" id="toast-info">
            <i class="info-icon fa-solid fa-circle-info"></i>
            <div class="toast-message">
                <span class="toast-title text-info">Thông tin!</span>
            </div>
            <i class="close-icon fa-solid fa-xmark"></i>
        </div>
        <script src="./js/toastAndModel.js"></script>
        <script>
                                           const divElement = document.getElementById('openDeposit');
                                           const linkElement = divElement.querySelector('a');

                                           const aInfo = document.getElementById("a-info");
                                           const aCourses = document.getElementById("a-courses");
                                           const aSecurity = document.getElementById("a-security");

                                           const infoContainer = document.querySelector(".info");
                                           const coursesContainer = document.querySelector(".courses");
                                           const securityContainer = document.querySelector(".security");

                                           const containerArr = [];

                                           containerArr.push(infoContainer);
                                           containerArr.push(coursesContainer);
                                           containerArr.push(securityContainer);

                                           const btnArr = [];

                                           btnArr.push(aInfo);
                                           btnArr.push(aCourses);
                                           btnArr.push(aSecurity);

                                           btnArr.forEach((btn) => {
                                               btn.addEventListener("click", () => {
                                                   removeActive();
                                                   btn.classList.add("choose");
                                                   if (btn == aInfo) {
                                                       if (!infoContainer.classList.contains("active"))
                                                           infoContainer.classList.add("active");
                                                   } else if (btn === aCourses) {
                                                       if (!coursesContainer.classList.contains("active"))
                                                           coursesContainer.classList.add("active");
                                                   } else if (btn === aSecurity) {
                                                       if (!securityContainer.classList.contains("active"))
                                                           securityContainer.classList.add("active");
                                                   }
                                               });
                                           });

                                           divElement.addEventListener('click', function () {
                                               linkElement.click();
                                           });

                                           function removeActive() {
                                               btnArr.forEach((btn) => {
                                                   btn.classList.remove("choose");
                                               });
                                               containerArr.forEach((container) => {
                                                   container.classList.remove("active");
                                               });
                                           }

                                           function validateChangePasswordForm() {
                                               var password = document.getElementById("password").value;
                                               var newPassword = document.getElementById("nPassword").value;
                                               var confirmNewPassword = document.getElementById("rnPassword").value;


                                               if (password === "" || newPassword === "" || confirmNewPassword === "") {
                                                   alert("Please fill in all fields.");
                                                   return false;
                                               }


                                               if (newPassword !== confirmNewPassword) {
                                                   alert("New password and confirm new password do not match.");
                                                   return false;
                                               }

                                               return true;
                                           }
        </script>
    </body>

</html>