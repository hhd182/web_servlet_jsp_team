<%-- 
    Document   : LessonDetail
    Created on : Nov 18, 2023, 9:30:16 AM
    Author     : My Asus
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thêm/Sửa bài học</title>
        <link rel="stylesheet" href="../css/main.css" />
        <link
            href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined"
            rel="stylesheet"
            />

        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
            integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
            />
        <style>
            .form {
                margin: 40px 0px;
            }
            .form-input + .form-input {
                margin-top: 16px;
            }
        </style>
    </head>
    <body>
        <div class="grid-container">
            <!-- Header -->
            <header class="admin-header" style="padding: 30px">
                <div class="menu-icon" onclick="openSidebar()">
                    <span class="material-icons-outlined">menu</span>
                </div>
                <div class="header-left">
                    <span class="material-icons-outlined">search</span>
                </div>
                <div class="header-right">
                    <span class="material-icons-outlined">notifications</span>
                    <span class="material-icons-outlined">email</span>
                    <span class="material-icons-outlined">account_circle</span>
                </div>
            </header>
            <!-- End Header -->

            <!-- Sidebar -->
            <aside id="sidebar">
                <div class="sidebar-title">
                    <div class="sidebar-brand">
                        <img src="../assets/logo-icon.png" alt="" />
                    </div>
                    <span class="material-icons-outlined" onclick="closeSidebar()"
                          >close</span
                    >
                </div>

                <ul class="sidebar-list">
                    <li class="sidebar-list-item" style="background-color: whitesmoke">
                        <a href="#" target="_blank">
                            <span class="material-icons-outlined">groups</span><span style="color: black">Học viên</span>
                        </a>
                    </li>   
                    <li class="sidebar-list-item">
                        <a href="/elearning/admin/course/">
                            <span class="material-icons-outlined">library_books</span> Khoá
                            học
                        </a>
                    </li>

                    <li class="sidebar-list-item">
                        <a href="/elearning/admin/blog">
                            <span class="material-icons-outlined">newspaper</span> Blog
                        </a>
                    </li>

                    <li class="sidebar-list-item">
                        <a href="#" target="_blank">
                            <span class="material-icons-outlined">visibility</span>
                            Lượt truy cập
                        </a>
                    </li>
                    <li class="sidebar-list-item">
                        <a href="#" target="_blank">
                            <span class="material-icons-outlined">payments</span> Doanh thu
                        </a>
                    </li>
                    <li class="sidebar-list-item">
                        <a href="#" target="_blank">
                            <span class="material-icons-outlined">mail</span> Tin nhắn
                        </a>
                    </li>
                    <li class="sidebar-list-item">
                        <a href="/elearning/logout">
                            <span class="material-icons-outlined">logout</span> Đăng xuất
                        </a>
                    </li>
                </ul>
            </aside>
            <!-- End Sidebar -->

            <!-- Main -->
            <main class="main-container" style="width: 100%">
                <div class="main-title">
                    <h1>Thêm/Sửa bài học</h1>
                </div>
                <form class="form" action=${link} method="post" enctype="multipart/form-data">
                    <input name="LessonPartID" type="hidden" value="${lesson.getLessonPartID()}">
                    <input name="CourseID" type="hidden" value="${CourseID}">
                    <input name="LessonID" type="hidden" value="${lesson.getLessonID()}">
                    <div class="form-input">
                        <label>Tải video lên:</label>
                        <input type="file" name="VideoURL" accept="video/*" onchange="checkFileUpload(this)">
                        <c:if test="${not empty lesson.getVideoURL()}">
                            <video controls width="100%">
                                <source src="../assets/videos/${lesson.getVideoURL()}">
                                Your browser does not support the video tag.
                            </video>
                        </c:if>
                    </div>
                    <div class="form-input">
                        <label for="lessonName">Tên bài học</label>
                        <input id="lessonName" class="input" name="Name" value="${lesson.getName()}">
                    </div>
                    <div class="form-input">
                        <label for="lessonDes">Mô tả</label>
                        <textarea id="lessonDes" class="textarea input-fullwidth" rows="10" name="Description">${lesson.getDesctiption()}</textarea>
                    </div>
                    <button class="form-input btn btn-primary" type="submit">Lưu</button>
                </form>
            </main>
            <div class="overlay" id="dialog">
                <div class="modal">
                    <i class="close-icon fa-solid fa-xmark"></i>
                    <h3 class="modal-title">
                        Cảnh báo!
                    </h3>
                    <div class="modal-content">
                        Không được tải lên file có kích thước lớn hơn 500MB. Vui lòng thử lại
                    </div>
                </div>
            </div>
            <!-- End Main -->
        </div>

        <!-- Scripts -->

        <!-- Custom JS -->

        <script src="../js/admin.js"></script>
        <script src="../js/toastAndModel.js"></script>
        <script>
                            function checkFileUpload(input) {
                                const maxSizeInBytes = 500 * 1024 * 1024; // 500MB
                                const files = input.files;

                                if (files.length > 0) {
                                    const fileSize = files[0].size;

                                    if (fileSize > maxSizeInBytes) {
                                        document.getElementById("dialog").style.display = "block";
                                        input.value = ''; // Clear the input to prevent submitting the oversized file
                                    } else {
                                        // File is within the size limit, you can proceed with further actions
                                        console.log('File size is within the limit.');
                                    }
                                }
                            }
        </script>
    </body>
</html>
