/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.Lesson;

import dao.LessonDao;
import dao.LessonPartDao;
import entity.Lesson;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.util.UUID;

/**
 *
 * @author My Asus
 */
@WebServlet(name="LessonAddController", urlPatterns={"/admin/addlesson"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,   // 2 MB
                 maxFileSize = 1024 * 1024 * 500,       // 10 MB
                 maxRequestSize = 1024 * 1024 * 550)
public class LessonAddController extends HttpServlet {
   
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
            out.println("<title>Servlet LessonAddController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LessonAddController at " + request.getContextPath () + "</h1>");
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
        Lesson lesson = new Lesson();
        lesson.setLessonPartID(UUID.fromString(request.getParameter("LessonPartID")));
        request.setAttribute("CourseID", request.getParameter("CourseID"));
        request.setAttribute("lesson", lesson);
        request.setAttribute("title", "Thêm bài học");
        request.setAttribute("link", "/elearning/admin/addlesson");
        RequestDispatcher rd = request.getRequestDispatcher("/admin/lesson/LessonDetail.jsp");
        rd.forward(request, response);
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
        String name = request.getParameter("Name");
        String description = request.getParameter("Description");
        String courseId = request.getParameter("CourseID");
        
        // Lấy thông tin file từ request
        Part filePart = request.getPart("VideoURL");
        String fileName = getSubmittedFileName(filePart);
        
        // Lưu trữ video trong thư mục uploads
        String uploadPath = getServletContext().getRealPath("").replace("build" + File.separator + "web", "web");
        String filePath = uploadPath + "assets" + File.separator + "videos" + File.separator + fileName;
        filePart.write(filePath);
        
        UUID lessonPartID = UUID.fromString(request.getParameter("LessonPartID"));
        Lesson lesson = new Lesson(name, fileName, description, lessonPartID);
        LessonDao dao = new LessonDao();
        int result = dao.createObject(lesson);
        response.sendRedirect("/elearning/admin/lesson?CourseID=" + courseId);
    }
    
    private String getSubmittedFileName(Part part) {
        for (String cd : part.getHeader("content-disposition").split(";")) {
            if (cd.trim().startsWith("filename")) {
                String fileName = cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
                return "video-" + UUID.randomUUID().toString() + "-" + fileName.substring(fileName.lastIndexOf('/') + 1).substring(fileName.lastIndexOf('\\') + 1);
            }
        }
        return null;
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
