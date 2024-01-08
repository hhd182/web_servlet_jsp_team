<%-- 
    Document   : managerAcc
    Created on : Dec 7, 2023, 4:21:23 PM
    Author     : duong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Trang Admin</title>
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
            integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
            />

        <!-- Material Icons -->
        <link
            href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined"
            rel="stylesheet"
            />

        <!-- Custom CSS -->
        <link rel="stylesheet" href="../../css/main.css" />
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
                        <img src="../../assets/logo-icon.png" alt="" />
                    </div>
                    <span class="material-icons-outlined" onclick="closeSidebar()"
                          >close</span
                    >
                </div>

                <ul class="sidebar-list">
                    <li class="sidebar-list-item" >
                        <a href="/elearning/admin/managerAcc">
                            <span class="material-icons-outlined">groups</span>Học viên
                        </a>
                    </li>   
                    <li class="sidebar-list-item" style="background-color: whitesmoke">
                        <a href="/elearning/admin/course/">
                            <span class="material-icons-outlined">library_books</span> <span style="color: black">Khoá học</span>
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

            <main class="main-container" style="width: 100%;">
                <div class="main-title">
                    <h1>Sửa khoá học</h1>
                    <button onclick="window.location.href = '/elearning/admin/lesson?CourseID=${p.courseID}'" class="btn btn-primary" style="margin-top: 8px;" id="btn">Thêm bài học</button>

                </div>

                <form action="/elearning/admin/course/update" method="post" style="width: 100%;" >
                    <input name="totalView" hidden="true" value="${p.totalView}"/>
                    <input name="id" hidden="true" value="${p.courseID}"/>
                    <div class='row'  >
                        <div class="col l-6 c-12" style="width: 100%">
                            <label>Tiêu đề</label>
                            <input name="title" placeholder="Tiêu đề" value="${p.title}" class="input input-fullwidth" type="text" />
                        </div>
                        <div class="col l-6 c-12">
                            <label>Cấp độ</label>
                            <input name="level" value="${p.levelCourse}" class="input input-fullwidth" placeholder="Dễ" type="text" />
                        </div>

                        <div class="col l-6 c-12">
                            <label>Ngôn ngữ</label>
                            <input name="language" value="${p.languageCourse}"  class="input input-fullwidth" placeholder="Tiếng Việt" type="text" />
                        </div>
                        <div class="col l-6 c-12">
                            <label>Thời lượng</label>
                            <input name="duration"  value="${p.duration}" class="input input-fullwidth" placeholder="1:00" type="text" />
                        </div>

                        <div class="col l-6 c-12">
                            <label>Giá cả</label>
                            <input name="price"  value="${p.price}"  class="input input-fullwidth" placeholder="1000 vnd" type="text" />
                        </div>
                        <div class="col l-6 c-12">
                            <label>Link ảnh</label>
                            <input name="imgurl" value="${p.imageUrl}" class="input input-fullwidth" placeholder="https://img" type="text" />
                        </div>
                        <div class="col c-12">
                            <label>Nội dung</label>
                            <textarea name="description"  class="textarea input-fullwidth" placeholder="" type="text">${p.descriptionCourse}</textarea>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary" id="btn" style="margin-top: 40px">Lưu</button>
                </form>



            </main>


            <!-- End Main -->
        </div>

        <!-- Scripts -->

        <!-- Custom JS -->

        <script src="../js/admin.js"></script>
    </body>
</html>

