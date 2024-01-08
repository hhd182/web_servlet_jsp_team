/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.User;

import com.sun.org.apache.bcel.internal.generic.LLOAD;
import dao.UserDAO;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.UUID;

/**
 *
 * @author TGDD
 */
@WebServlet(name="UpdateController", urlPatterns={"/user-update"})
public class UserUpdateController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateController at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        System.out.println("go to post");
        String id = (String) request.getSession().getAttribute("id");
        String name = request.getParameter("name");
        String dob_raw = request.getParameter("dob");
        System.out.println("dob_raw: " + dob_raw);
        String email = request.getParameter("email");
        String pNum = request.getParameter("pNum");
        String aBalance_raw = request.getParameter("money");
        long aBalance = 0;
        Date dob = null;
        try {
            aBalance = Long.parseLong(aBalance_raw);
            dob = new java.sql.Date(new SimpleDateFormat("yyyy-MM-dd").parse(dob_raw).getTime());
            System.out.println("dob: " + dob);
        } catch (Exception e) {
        }
        User user = new User(id, name, dob, email, pNum, aBalance);
        UserDAO dao  = new UserDAO();
        dao.updateUser(user);
        response.sendRedirect("user");
        
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
