/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.User;

import java.io.IOException;
import java.io.PrintWriter;
import entity.User;
import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import security.RandomStringExmple;

/**
 *
 * @author duong
 */
@WebServlet(name = "UserResetPassController", urlPatterns = {"/forgetpassword/resetpass"})
public class UserResetPassController extends HttpServlet {

    private int number = 6;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UserResetPassController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserResetPassController at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        String id = request.getParameter("userID");
//        RandomStringExmple randomStringExmple = new RandomStringExmple();
//        String newPass = randomStringExmple.randomPassword(number);
//        UserDAO userDAO = new UserDAO();
//        int kq = userDAO.resetPassword(id, newPass);
//        if (kq != 0) {
//            request.getRequestDispatcher("resetPassword.jsp").forward(request, response);
//        }
//    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        RandomStringExmple randomStringExmple = new RandomStringExmple();
        String newPass = randomStringExmple.randomPassword(number);
        UserDAO userDAO = new UserDAO();
        int kq = userDAO.resetPassword(username, newPass);

        if (kq != 0) {
            // Kiểm tra xem đã redirect hay chưa trước khi thực hiện
            if (!response.isCommitted()) {
                HttpSession session = request.getSession(false);
                session.setAttribute("newpass", newPass);
                session.setAttribute("username", username);
                response.sendRedirect("/elearning/resetPassword.jsp");
            } else {
               
                response.getWriter().println("Error: Redirect already committed.");
            }
        }
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
