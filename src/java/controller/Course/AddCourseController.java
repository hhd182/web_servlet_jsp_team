/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Course;

import dao.CourseDAO;
import dao.UserDAO;
import entity.Course;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.UUID;
import jakarta.servlet.http.HttpSession;
/**
 *
 * @author Admin
 */
@WebServlet(name = "AddCourseController", urlPatterns = {"/admin/course/add"})
public class AddCourseController extends HttpServlet {

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
            out.println("<title>Servlet AddCourseController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddCourseController at " + request.getContextPath() + "</h1>");
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
            response.sendRedirect("addNewCourse.jsp");
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
        User user;
        UserDAO udao = new UserDAO();
        String idUser = (String) request.getSession().getAttribute("id");
        user = udao.getUserById(idUser);
        
        System.out.println(idUser);
        
        String id = UUID.randomUUID().toString();
        String title = request.getParameter("title");
        String teacherName = user.getName();
        String level = request.getParameter("level");
        String description = request.getParameter("description");
        String language = request.getParameter("language");
        String duration = request.getParameter("duration");
        String price = request.getParameter("price");
        String imgurl = request.getParameter("imgurl");

        CourseDAO dao = new CourseDAO();

        Course s = new Course(id, teacherName, Integer.parseInt(price), duration, description, language, level, imgurl, title, 0);
        dao.addNewCourse(s);
        response.sendRedirect("/elearning/admin/course");

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
