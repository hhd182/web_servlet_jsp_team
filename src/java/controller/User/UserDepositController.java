/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.User;

import dao.UserDAO;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author TGDD
 */
@WebServlet(name = "DepositController", urlPatterns = {"/user-deposit"})
public class UserDepositController extends HttpServlet {

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
            out.println("<title>Servlet DepositController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DepositController at " + request.getContextPath() + "</h1>");
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
        UserDAO dao = new UserDAO();
        String id = (String) request.getSession().getAttribute("id");
        User user = dao.getUserById(id);

        String generateUniqueCode = generateUniqueCode(user);
        request.setAttribute("generateUniqueCode", generateUniqueCode);

        request.getRequestDispatcher("deposit.jsp").forward(request, response);
    }

    private String generateUniqueCode(User user) {
        long currentTime = System.currentTimeMillis();
        return "CODE-" + currentTime + "-" + user.getUserID();
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
        String amount = request.getParameter("amount");

        // Validate and process the deposit
        boolean depositSuccessful = processDeposit(request, amount);

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        if (depositSuccessful) {
            out.println("<script>alert('Nạp tiền thành công!'); window.location='user';</script>");
        } else {
            out.println("<script>alert('Nạp tiền thất bại!'); window.location='deposit.jsp';</script>");
        }
    }

    private boolean processDeposit(HttpServletRequest request, String amount) {
        try {
            UserDAO dao = new UserDAO();
            String id = (String) request.getSession().getAttribute("id");
            User user = dao.getUserById(id);

            long currentBalance = user.getMoney();
            long depositAmount = Long.parseLong(amount);
            long newBalance = currentBalance + depositAmount;

            dao.updateBalance(user, newBalance);

            user.setMoney(newBalance);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
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
