package com.student.servlet;

import com.student.dao.StudentDAO;
import com.student.model.Student;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

/**
 * Controller Servlet – handles all HTTP requests for student operations.
 * MVC pattern: this class is the Controller.
 */
@WebServlet("/students")
public class StudentServlet extends HttpServlet {

    private final StudentDAO studentDAO = new StudentDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String action = req.getParameter("action");
        if (action == null) action = "list";

        switch (action) {
            case "add":
                req.getRequestDispatcher("/WEB-INF/views/add-student.jsp").forward(req, resp);
                break;
            case "edit":
                Student student = studentDAO.getStudentByRegNo(req.getParameter("regNo"));
                req.setAttribute("student", student);
                req.getRequestDispatcher("/WEB-INF/views/edit-student.jsp").forward(req, resp);
                break;
            case "delete":
                boolean deleted = studentDAO.deleteStudent(req.getParameter("regNo"));
                setMessage(req, deleted ? "success" : "error",
                           deleted ? "Student deleted successfully." : "Failed to delete student.");
                listStudents(req, resp);
                break;
            case "view":
                Student viewStudent = studentDAO.getStudentByRegNo(req.getParameter("regNo"));
                req.setAttribute("student", viewStudent);
                req.getRequestDispatcher("/WEB-INF/views/view-student.jsp").forward(req, resp);
                break;
            case "search":
                List<Student> results = studentDAO.searchStudents(req.getParameter("keyword"));
                req.setAttribute("students", results);
                req.setAttribute("keyword", req.getParameter("keyword"));
                req.getRequestDispatcher("/WEB-INF/views/list-students.jsp").forward(req, resp);
                break;
            default:
                listStudents(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String action = req.getParameter("action");

        if ("add".equals(action)) {
            boolean added = studentDAO.addStudent(buildStudentFromRequest(req));
            setMessage(req, added ? "success" : "error",
                       added ? "Student registered successfully." : "Registration failed. RegNo may already exist.");
        } else if ("edit".equals(action)) {
            boolean updated = studentDAO.updateStudent(buildStudentFromRequest(req));
            setMessage(req, updated ? "success" : "error",
                       updated ? "Student updated successfully." : "Update failed.");
        }
        listStudents(req, resp);
    }

    private void listStudents(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setAttribute("students", studentDAO.getAllStudents());
        req.getRequestDispatcher("/WEB-INF/views/list-students.jsp").forward(req, resp);
    }

    private Student buildStudentFromRequest(HttpServletRequest req) {
        Student s = new Student();
        s.setRegNo(req.getParameter("regNo").trim());
        s.setName(req.getParameter("name").trim());
        s.setEmail(req.getParameter("email").trim());
        s.setPhone(req.getParameter("phone").trim());
        s.setField(req.getParameter("field").trim());
        s.setDateOfBirth(LocalDate.parse(req.getParameter("dateOfBirth")));
        return s;
    }

    private void setMessage(HttpServletRequest req, String type, String text) {
        req.setAttribute("msgType", type);
        req.setAttribute("message", text);
    }
}
