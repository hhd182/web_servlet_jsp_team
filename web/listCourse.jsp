<%-- 
    Document   : listCourse
    Created on : Nov 15, 2023, 10:36:38 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="enity.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Danh sách khóa hoc</title>
    </head>

    <style>
        input{
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border-radius: 10px;
            border: 1px solid gray;
        }
        .price-img{
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            grid-gap: 30px;
        }
        
        .nav{
            padding: 8px 0;
            width: 1400px;
            margin: auto;
        }
    </style>

    <body>
        
        <div class="nav">
            <a href="loadallcourse">Home</a>     
            <a href="loadCourse">Course</a>            


        </div>
        <div id="container">
            <div id="header">
                <a id="btn" href="/elearning/addNewCourse.jsp" >New Course</a>
            </div>

            <div>
                <h2 id="title" >My course</h2>

                <div id="list-courses">

                    <c:forEach var="p" items="${cList}">
                        <a href="/elearning/updateCourse?id=${p.courseID}" id="course">
                            <div id="course-info">
                                <div id="img">
                                    <img src=${p.imageUrl} alt="alt"/>
                                </div>
                                <div>
                                    <div id="desc-price">
                                        <h3 >${p.title}</h3>
                                        <p id="price">${p.teacherName}</p>
                                    </div>
                                    <div id="desc-price">
                                        <p id="desc">${p.descriptionCourse}</p>
                                        <p id="price">${p.price}</p>    
                                    </div>
                                </div>
                            </div>
                        </a>
                    </c:forEach>
                </div>
            </div>
            
           
        </div>
    </body>
</html>
