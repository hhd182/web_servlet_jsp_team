<%-- Document : updateblog Created on : Nov 15, 2023, 3:13:49 PM Author : duong --%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Sửa Blog</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
              integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />

        <!-- Material Icons -->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined" rel="stylesheet" />

        <!-- Custom CSS -->
        <link rel="stylesheet" href="../../css/main.css" />
        <link rel="stylesheet" href="../../css/pages/blogadmin.css" />
    </style>
</head>

<body>
    <div class="grid-container">
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

        <main class="main-container " style="width: 100%;">
            <div class="main-title">
                <h1>Sửa Blog</h1>
            </div>

            <div class="form-wrapper">
                <form action="/elearning/admin/blog/update" method="post">
                    <input type="hidden" name="id" value="${b.getBlogID()}" />
                    <input type="hidden" name="createdDate" value="${b.getCreatedDate()}" />
                    <input type="hidden" name="totalView" value="${b.getTotalView()}" />
                    <div class="row">
                        <div class="col c-12">
                            <div class="single-form">
                                <label>Tiêu đề</label>
                                <input class="input input-fullwidth" name="title" value="${b.getTitle()}"/>
                            </div>

                            <div class="single-form">
                                <label>Nội dung</label>
                                <textarea class="textarea input-fullwidth" name="content" rows="4" cols="50"
                                          placeholder="Nhập nội dung bài viết tại đây">${b.getContent()}</textarea>
                            </div>

                            <div>
                                <div class="single-form">
                                    <button class="btn btn-primary" type="submit">Cập nhật</button>
                                </div>
                            </div>

                        </div>
                    </div>
                </form>
            </div>
        </main>
    </div>
</body>

</html>