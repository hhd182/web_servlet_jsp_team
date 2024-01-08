/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Course;

import dao.CourseCommentDAO;
import dao.CourseDAO;
import dao.EnrollDAO;
import dao.UserDAO;

import entity.CourseComment;
import entity.Course;
import entity.EnrolledCourse;
import entity.Lesson;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/**
 *
 * @author Admin
 */
@WebServlet(name = "CourseInfoController", urlPatterns = {"/courseinfoctl"})
public class CourseInfoController extends HttpServlet {

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
            out.println("<title>Servlet CourseInfoController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CourseInfoController at " + request.getContextPath() + "</h1>");
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

        User user;
        UserDAO udao = new UserDAO();
        String idUser = (String) request.getSession().getAttribute("id");
        user = udao.getUserById(idUser);

        String id = request.getParameter("id");
        List<CourseComment> c;
        CourseCommentDAO cdao = new CourseCommentDAO();
        c = cdao.getAllCmtById(id);
        request.setAttribute("cmtList", c);
        CourseDAO dao = new CourseDAO();
        Course p = dao.getCourseByID(id);

        EnrollDAO edao = new EnrollDAO();
        EnrolledCourse e = edao.findEnroll(idUser, id);

        int i = dao.getLessonCountForCourse(id);
        request.setAttribute("i", i);
        
        if (user.getMoney() < p.getPrice()) {
            request.setAttribute("money", "Nạp tiền đi con gà");
        } else {
            request.setAttribute("money", "Đủ tiền");
        }

        if (e != null) {
            request.setAttribute("enrolled", e.toString());
        } else {
            request.setAttribute("enrolled", "Enrollment not found");
        }
        dao.updateTotalViewCourse(p);

        try {
             Lesson l = new Lesson();
             l = dao.getLessonByCourse(id);
        System.out.println(l.toString());
//            System.out.println(l.getLessonID());

        request.setAttribute("l", l.getLessonID());
        } catch (Exception ex) {
            System.out.println(ex);
        }
       
        List<Lesson> listLesson= new ArrayList<>();
        listLesson = dao.getLessonByCourseId(id);
        
//        System.out.println(listLesson.size());

        request.setAttribute("sizeL", listLesson.size());
        request.setAttribute("idUser", idUser);

        request.setAttribute("p", p);
        request.getRequestDispatcher("courseInfo.jsp").forward(request, response);
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
