/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Enrolled;

import com.sun.java.swing.plaf.windows.resources.windows;
import dao.CourseDAO;
import dao.EnrollDAO;
import dao.UserDAO;
import entity.Course;
import entity.EnrolledCourse;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.UUID;
import javafx.scene.control.Alert;

/**
 *
 * @author Admin
 */
@WebServlet(name = "AddEnrolled", urlPatterns = {"/addenrolled"})
public class AddEnrolled extends HttpServlet {

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
            out.println("<title>Successfully!!!</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Successfully!!!</h1>");
            out.println("</body>");
            out.println("</html>");
        }
        String referer = request.getHeader("Referer");
        response.sendRedirect(referer);
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
        String id = UUID.randomUUID().toString();
        User user;
        Course c;
        UserDAO udao = new UserDAO();
        String idUser = (String) request.getSession().getAttribute("id");

        user = udao.getUserById(idUser);
        CourseDAO cdao = new CourseDAO();
        String id_course = request.getParameter("id");

        c = cdao.getCourseByID(id_course);

        if (user.getMoney() >= c.getPrice()) {
            udao.changeMoney(user, c);
            Date created_date = new Date();

            java.util.Date utilDate = new java.util.Date();
            java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());

            EnrolledCourse e = new EnrolledCourse(id, user, c, sqlDate);

            EnrollDAO dao = new EnrollDAO();
            dao.addNewEnroll(e);

            
//            
//            request.setAttribute("toast", "Tham gia thành công!!!");
//            request.getRequestDispatcher("courseInfo.jsp").forward(request, response);
            
            String referer = request.getHeader("Referer");
            response.sendRedirect(referer);
        } else {
            

            request.setAttribute("money", "Nạp tiền đi con gà");
            request.getRequestDispatcher("courseInfo.jsp").forward(request, response);
        }

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
