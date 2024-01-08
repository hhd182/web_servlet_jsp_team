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
            <main class="main-container" style="width: 100%">
                <div class="main-title">
                    <h1>Quản lý khoá học</h1>
                </div>
                <button style="height: 50px; padding: 14px 20px; display: flex; align-items: center; gap: 4px;" onclick="window.location.href = '/elearning/admin/course/add'" class="btn btn-primary">
                    <i class="fa-solid fa-circle-plus"></i>
                    <span>
                        Thêm khoá học
                    </span>
                </button>
                <!--        <form action="/elearning/admin/course/add" method="get">
                            <input type="submit" value="Thêm khoá học">
                        </form>-->
                <h1>Danh sách các khoá học</h1>
                <c:if test = "${empty cList or cList.size() eq 0}">
                    <p>Khong ton tai khoa hoc</p>
                </c:if>
                <c:if test = "${not empty cList or cList.size() gt 0}">
                    <div class="table-container">
                        <div class="table-horizontal-container">
                            <table class="unfixed-table" style="width: 100%">
                                <thead>
                                    <tr>
                                        <th>STT</th>
                                        <th>Tiêu đề</th>
                                        <th>Tên giảng viên</th>
                                        <th>Giá tiền</th>
                                        <th>Tổng lượt xem</th>
                                        <th>Tổng lượt đăng ký</th>
                                        <th>Tổng giá tiền</th>                
                                        <th>Công cụ</th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <c:set var="totalPrice" value="0" />
                                    <c:set var="totalEnroll" value="0"/>
                                    <c:set var="count" value="0" />
                                    <c:forEach var="course" items = "${cList}">
                                        <tr>
                                            <td>${count + 1}</td>
                                            <!--<td>${course.title}</td>-->   
                                            <td class="td-bold"> <a href="/elearning/courseinfoctl?id=${course.getCourseID()}" style="color: black">${course.title} </a></td>
                                            <td>${course.teacherName}</td>
                                            <td>${course.price}</td>
                                            <td>${course.totalView}</td>
                                            <td>${course.totalEnrollment}</td>
                                            <td>${course.totalRevenue}</td>
                                            <td>
                                                <div class="btnContainer" style="display: flex; gap: 8px;">
                                                    
                                                    <form action="/elearning/admin/course/update" method="get">
                                                        <input type="hidden" name="courseID" value="${course.getCourseID()}"/>
                                                        <button class="btn btn-primary" type ="submit">
                                                            <span style="display: flex; align-items: center; gap: 4px;">
                                                                <i class="fa-solid fa-sliders"></i>

                                                                Sửa
                                                            </span>
                                                        </button>
                                                    </form>

                                                    <form action="/elearning/admin/course/studentEnroll" method="get">
                                                        <input type="hidden" name="courseID" value="${course.getCourseID()}"/>
                                                        <button class="btn btn-info" type ="submit">
                                                            <span style="display: flex; align-items: center; gap: 4px;">
                                                                <i class="fa-solid fa-circle-info"></i>
                                                                Xem
                                                            </span>
                                                        </button>
                                                    </form>
                                                        
                                                        
                                                        <form action="/elearning/admin/course/delete" method="post">
                                                        <input type="hidden" name="courseID" value="${course.getCourseID()}"/>
                                                        <button class="btn btn-destructive" type ="submit">
                                                            <span style="display: flex; align-items: center; gap: 4px;">
                                                                <i class="fa-solid fa-trash"></i>
                                                                Xóa
                                                            </span>
                                                        </button>
                                                    </form>
                                                </div>
                                            </td>
                                        </tr>
                                        <c:set var="count" value="${count + 1}" />
                                        <c:set var="totalEnroll" value="${totalEnroll + course.totalEnrollment}" />
                                        <c:set var = "totalPrice" value="${totalPrice + course.totalRevenue}"/>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    </object>
                    </article>
                    <div>
                        <p>Tổng doanh thu: ${totalPrice}</p>
                        <p>Tổng lượt đăng ký: ${totalEnroll}</p>
                    </div>
                </c:if>
            </main>
            <!-- End Main -->
        </div>

        <!-- Scripts -->

        <!-- Custom JS -->

        <script src="../js/admin.js"></script>
    </body>
</html>

