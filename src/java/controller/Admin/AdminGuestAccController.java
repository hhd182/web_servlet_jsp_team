/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Admin;

import dao.EnrollDAO;
import dao.UserDAO;
import dao.BlogCommentDAO;
import dao.CourseCommentDAO;

import entity.Blog;
import entity.Course;
import entity.EnrolledCourse;
import entity.BlogComment;
import entity.CourseComment;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author duong
 */
@WebServlet(name = "AdminGuestAccController", urlPatterns = {"/admin/managerAcc/user"})
public class AdminGuestAccController extends HttpServlet {

    UserDAO userDAO = new UserDAO();
    EnrollDAO enrollDAO = new EnrollDAO();
    BlogCommentDAO blogCommentDAO = new BlogCommentDAO();
    CourseCommentDAO courseCommentDAO = new CourseCommentDAO();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AdminGuestAccController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminGuestAccController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("userID");
        
        List<EnrolledCourse> listEnrolledCourse = enrollDAO.getAllEnrollCourse(id);
        System.out.println("Do dai danh sach cac khoa hoc da dang ky la: " + listEnrolledCourse.size());
        request.setAttribute("listEnrolledCourse", listEnrolledCourse);
        
        List<BlogComment> listBlogComment = blogCommentDAO.getAllCommentByUserID(id);
        request.setAttribute("listCommentBlog", listBlogComment);
        
        List<CourseComment> listCourseComment = courseCommentDAO.getAllCommentByUserID(id);
        request.setAttribute("listCommentCourse", listCourseComment);
        
        request.getRequestDispatcher("accDetail.jsp").forward(request, response);
    }

    
    
    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
