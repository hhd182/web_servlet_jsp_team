/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.User;

import com.sun.org.apache.bcel.internal.generic.AALOAD;
import dao.UserDAO;
import security.Encryptor;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.HashMap;

/**
 *
 * @author duong
 */
@WebServlet(name = "LoginController", urlPatterns = {"/login"})
public class UserLoginController extends HttpServlet {

    String role = null;
    String id = null;
    UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        request.getRequestDispatcher("login.jsp").forward(request, response);
            response.sendRedirect("login.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        User u = new User();
        u.setUsername(username);
        u.setPassword(password);

        User validUser = userDAO.checkUser(u);
        role = validUser.getRole();
        id = validUser.getUserID();
        System.out.println("Login with user role and ID is: " + role + " " + id);
        if (id != null) {
           
            HttpSession session = request.getSession();
            session.setAttribute("id", id);
            session.setAttribute("role", role);
        
            request.setAttribute("idUser", id);
            
            if (role.equals("GUEST")) {
                response.sendRedirect("home");
//                request.getRequestDispatcher("home.jsp").forward(request, response);
            }
            if(role.equals("ADMIN")){
                response.sendRedirect("admin/managerAcc");
            }
        } else {
            request.setAttribute("errorMessage", "Lỗi, không tìm thấy tài khoản");
            request.getRequestDispatcher("login.jsp").forward(request, response);
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
