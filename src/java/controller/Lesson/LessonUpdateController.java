/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.Lesson;

import dao.LessonDao;
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
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.UUID;

/**
 *
 * @author My Asus
 */
@WebServlet(name="LessonUpdateController", urlPatterns={"/admin/updatelesson"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,   // 2 MB
                 maxFileSize = 1024 * 1024 * 500,       // 10 MB
                 maxRequestSize = 1024 * 1024 * 550)
public class LessonUpdateController extends HttpServlet {
   
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
            out.println("<title>Servlet LessonUpdateController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LessonUpdateController at " + request.getContextPath () + "</h1>");
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
        UUID id = UUID.fromString(request.getParameter("LessonID"));
        LessonDao dao = new LessonDao();
        Lesson lesson = dao.getObject(id);
        request.setAttribute("CourseID", request.getParameter("CourseID"));
        request.setAttribute("lesson", lesson);
        request.setAttribute("title", "Sửa khóa học");
        request.setAttribute("link", "/elearning/admin/updatelesson");
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
        UUID lessonID = UUID.fromString(request.getParameter("LessonID"));
        String courseId = request.getParameter("CourseID");
        
        // Lấy thông tin file từ request
        Part filePart = request.getPart("VideoURL");
        
        LessonDao dao = new LessonDao();
        Lesson lesson = dao.getObject(lessonID);
        
        if (filePart != null && filePart.getSize() > 0) {
            String fileName = getSubmittedFileName(filePart);
            // Xóa video cũ
            String videoName = lesson.getVideoURL();
            String deletePath = getServletContext().getRealPath("").replace("build" + File.separator + "web", "web");
            String filePath = deletePath + "assets" + File.separator + "videos";
            Files.delete(Paths.get(filePath, videoName));
        
            // Lưu trữ video
            String uploadPath = getServletContext().getRealPath("").replace("build" + File.separator + "web", "web");
            filePath = uploadPath + "assets" + File.separator + "videos" + File.separator + fileName;
            filePart.write(filePath);
            lesson.setVideoURL(fileName);
        }
        
        lesson.setName(name);
        lesson.setDesctiption(description);
        int result = dao.updateObject(lesson);
        
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
