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
        <title>Trang chi tiết người dùng</title>
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
                    <h1>Thông tin tài khoản</h1>
                </div>

                <!--Khoá học đã tham gia-->

                <h2>Danh sách các khoá học đã tham gia</h2>

                <c:if test = "${empty listEnrolledCourse or listEnrolledCourse.size() eq 0}">
                    <p>Khong ton tai khoa hoc</p>
                </c:if>
                <c:if test = "${not empty listEnrolledCourse or listEnrolledCourse.size() gt 0}">
                    <div>
                        <table style="width: 100%">
                            <tr>
                                <td>No.</td>
                                <td>Pic</td>
                                <td>Title</td>
                                <td>Teacher Name</td> 
                                <td>Price</td>
                                <td>Sub Date</td>
                            </tr>
                            <c:set var="totalPrice" value="0" />
                            <c:set var="totalCourses" value="0" />
                            <c:set var="count" value="0" />
                            <c:forEach var="enrollCourse" items="${listEnrolledCourse}">
                                <tr>
                                    <td>${count + 1}</td>
                                    <td><img src="${enrollCourse.course.imageUrl}" alt="alt" width="50px" height="50px"/></td>
                                    <!--<td>${enrollCourse.course.title}</td>-->
                                    <td class="td-bold"> <a href="/elearning/admin/course/studentEnroll?courseID=${enrollCourse.course.getCourseID()}" style="color: #309255">${enrollCourse.course.title}</a></td>
                                    <td>${enrollCourse.course.teacherName}</td>
                                    <td>${enrollCourse.course.price}</td>
                                    <td>${enrollCourse.subDate}</td>
                                </tr>
                                <!-- Tính tổng số tiền và số khoá học -->
                                <c:set var="totalPrice" value="${totalPrice + enrollCourse.course.price}" />
                                <c:set var="totalCourses" value="${totalCourses + 1}" />
                                <!-- Tăng biến đếm sau mỗi lần lặp -->
                                <c:set var="count" value="${count + 1}" />
                            </c:forEach>
                        </table>
                    </div>
                    <div>
                        <p>Total Price: ${totalPrice}</p>
                        <p>Total Courses: ${totalCourses}</p>
                    </div>
                </c:if>
                <!--Comment trong Blog-->

                <h2>Danh sách các đánh giá trong các Blog</h2>

                <c:if test = "${empty listCommentBlog or listCommentBlog.size() eq 0}">
                    <p>Khong ton tai danh gia</p>
                </c:if>
                <c:if test = "${not empty listCommentBlog or listCommentBlog.size() gt 0}">
                    <div>
                        <table style="width: 100%">
                            <tr>
                                <th>ID Blog</th>
                                <th>Tên Blog</th>
                                <th>Nội dung đánh giá</th><!-- comment -->
                                <th>Ngày đánh giá</th>
                                <th>Chức năng</th>
                            </tr>
                            <c:forEach var="blogComment" items = "${listCommentBlog}">
                                <tr>
                                    <td>${blogComment.blog.blogID}</td>
                                    <td>${blogComment.blog.title}</td>
                                    <td>${blogComment.description}</td>
                                    <td>${blogComment.createdDate}</td>
                                    <td>
                                        <div class="btnContainer" style="display: flex; justify-content:center">
                                            <form action="/elearning/blog">
                                                <input type="hidden" name="id" value="${blogComment.blog.blogID}" />
                                                <input
                                                    type="submit"
                                                    name=""
                                                    id=""
                                                    value="Xem"
                                                    class="btn btn-primary"
                                                    style="border: 0px; height: 50px"

                                                    />
                                            </form>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>

                        </table>
                    </div>
                </c:if>

                <!--Comment trong khoa hoc-->
                <h2>Danh sách các đánh giá trong các khoá hoc</h2>

                <c:if test = "${empty listCommentCourse or listCommentCourse.size() eq 0}">
                    <p>Khong ton tai danh gia</p>
                </c:if>
                <c:if test = "${not empty listCommentCourse or listCommentCourse.size() gt 0}">
                    <div>
                        <table style="width: 100%">
                            <tr>
                                <th>ID khoá học</th>
                                <th>Tên khoá học</th>
                                <th>Tên giảng viên</th><!-- comment -->
                                <th>Nội dung đánh giá</th>
                                <th>Ngày đánh giá</th>
                                <th>Chức năng</th>
                            </tr>
                            <c:forEach var="courseComment" items = "${listCommentCourse}">
                                <tr>
                                    <td>${courseComment.course.courseID}</td>
                                    <td>${courseComment.course.title}</td>
                                    <td>${courseComment.course.teacherName}</td>
                                    <td>${courseComment.description}</td>
                                    <td>${courseComment.created_date}</td>
                                    <td>
                                        <div class="btnContainer" style="display: flex; justify-content:center">
                                            <form action="/elearning/courseinfoctl">
                                                <input type="hidden" name="id" value="${courseComment.course.courseID}" />
                                                <input
                                                    type="submit"
                                                    name=""
                                                    id=""
                                                    value="Xem"
                                                    class="btn btn-primary"
                                                    style="border: 0px; height: 50px"

                                                    />
                                            </form>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>

                        </table>
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

