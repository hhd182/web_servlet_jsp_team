<%-- Document : managerBlog Created on : Dec 8, 2023, 10:54:57 AM Author : duong --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang Admin</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
              integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />

        <!-- Material Icons -->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined" rel="stylesheet" />
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
            integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
            />

        <!-- Custom CSS -->
        <link rel="stylesheet" href="../css/main.css" />
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
                    <span class="material-icons-outlined" onclick="closeSidebar()">close</span>
                </div>

                <ul class="sidebar-list">
                    <li class="sidebar-list-item">
                        <a href="/elearning/admin/managerAcc">
                            <span class="material-icons-outlined">groups</span> Học viên
                        </a>
                    </li>
                    <li class="sidebar-list-item">
                        <a href="/elearning/admin/course/">
                            <span class="material-icons-outlined">library_books</span> Khoá
                            học
                        </a>
                    </li>

                    <li class="sidebar-list-item" style="background-color: whitesmoke">
                        <a href="/elearning/admin/blog">
                            <span class="material-icons-outlined">newspaper</span> <span style="color: black">Blog</span>
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

            <main class="main-container" style="width: 100%">
                <div class="main-title ">
                    <h1>Quản lý Blog</h1>

                </div>
                <c:if test="${empty listBlog or listBlog.size() eq 0}">
                    <p>Không tồn tại blog</p>
                    <div class="btnContainer">
                        <div class="btnL">
                            <form action="/elearning/admin/blog/add" method="get">
                                <button class="btn-backgound" type="submit">
                                    <i class="fa-solid fa-circle-plus"></i>
                                    Thêm blog</button>
                            </form>
                        </div>
                    </div>
                </c:if>
                <c:if test="${not empty listBlog or listBlog.size() gt 0}">
                    <div class="up-table">
                        <div>
                            <p>Số lượng bài viết: ${listBlog.size()}</p>
                        </div>
                        <div class="btnContainer">
                            <div class="">
                                <form action="/elearning/admin/blog/add" method="get">
                                    <button style="height: 50px; padding: 14px 20px; display: flex; align-items: center; gap: 4px;"  class="btn btn-primary">
                                        <i class="fa-solid fa-circle-plus"></i>
                                        <span>
                                            Thêm blog
                                        </span>
                                    </button>
                                </form>
                            </div>
                        </div>

                    </div>
                    <table style="width: 100%;">
                        <tr>
                            <th>STT</th>
                            <th>Tiêu đề</th>
                            <th>Ngày khởi tạo</th>
                            <th>Ngày cập nhật</th>
                            <th>Tổng lượt xem</th>
                            <th>Thao Tác</th>
                        </tr>
                        <c:set var="count" value="0" />
                        <c:forEach var="blog" items="${listBlog}">
                            <tr>
                                <td>${count + 1}</td>
                                <td class="td-bold"> <a href="/elearning/blog?id=${blog.getBlogID()}" style="color: #309255">${blog.title} </a></td>
                                <td>${blog.createdDate}</td>
                                <td>${blog.updateAt}</td>
                                <td>${blog.totalView}</td>
                                <td class="btn_flex">
                                    <div class="btnContainer">
                                        <div class="">
                                            <form action="/elearning/admin/blog/update" method="get">
                                                <input type="hidden" name="blogID"
                                                       value="${blog.getBlogID()}" />
                                                <button class="btn btn-primary" type ="submit">
                                                    <span style="display: flex; align-items: center; gap: 4px;">
                                                        <i class="fa-solid fa-sliders"></i>

                                                        Sửa
                                                    </span>
                                                </button>
                                            </form>
                                        </div>
                                    </div>
                                    
                                    <div class="btnContainer">
                                        <div class="">
                                            <form action="/elearning/admin/blog/delete" method="post">
                                                <input type="hidden" name="blogID"
                                                       value="${blog.getBlogID()}" />
                                                <button class="btn btn-destructive" type ="submit">
                                                    <span style="display: flex; align-items: center; gap: 4px;">
                                                        <i class="fa-solid fa-trash"></i>
                                                        Xóa
                                                    </span>
                                                </button>
                                            </form>
                                        </div>
                                    </div>

                                    
                                </td>
                            </tr>

                            <!-- Tăng biến đếm sau mỗi lần lặp -->
                            <c:set var="count" value="${count + 1}" />
                        </c:forEach>
                    </table>
                </c:if>
            </main>
        </div>

    </body>

</html>