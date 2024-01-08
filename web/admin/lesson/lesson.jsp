<%-- 
    Document   : studentList
    Created on : Aug 14, 2020, 8:52:51 PM
    Author     : Diep
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý bài học</title>
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
        <link rel="stylesheet" href="../css/pages/lesson-admin.css" />
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
                    <h1>Danh sách bài học</h1>
                </div>
                <c:forEach var="lessonPart" items="${ListLessonPart}" varStatus="loop">
                    <div class="lesson-part-container">
                        <form class="lesson-part" action="updatelessonpart" method="POST">
                            <input class="input" name="lessonTitle" value="${lessonPart.getTitle()}">
                            <input name="lessonPartID" type="hidden" value="${lessonPart.getLessonPartID()}">
                            <button class="btn btn-primary" type="submit">Sửa</button>
                            <a class="text-error" href='deletelessonpart?LessonPartID=${lessonPart.getLessonPartID()}'">Xóa</a>
                        </form>

                        <ul class="lesson-list">
                            <c:forEach var="lesson" items="${lessonPart.getListLesson()}" varStatus="loop">
                                <li>
                                    ${lesson.getName()}
                                    <br>
                                    <a href="updatelesson?LessonID=${lesson.getLessonID()}&CourseID=${CourseID}">Sửa</a>
                                    <a class="text-error" href="deletelesson?LessonID=${lesson.getLessonID()}">Xóa</a>
                                </li>
                            </c:forEach>
                        </ul>
                        <button onclick="window.location.href = 'addlesson?LessonPartID=${lessonPart.getLessonPartID()}&CourseID=${CourseID}'" class="btn btn-secondary">Thêm bài học</button>
                    </div>
                </c:forEach>
                <hr>    
                <h2 class="text-center">Thêm chương học</h2>
                <form action="/elearning/admin/lesson" method="POST">
                    <div class="lesson-part">
                        <input class="input input-fullwidth" name="newLessonPart" />
                        <button class="btn btn-primary" type="submit">Thêm</button>
                    </div>
                    <input name="CourseID" type="hidden" value="${CourseID}">
                </form>
            </main>
            <!-- End Main -->
        </div>

        <!-- Scripts -->

        <!-- Custom JS -->

        <script src="../js/admin.js"></script>
    </body>
</html>
