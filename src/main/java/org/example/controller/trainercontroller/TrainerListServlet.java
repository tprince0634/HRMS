package org.example.controller.trainercontroller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.example.service.TrainerService;

import java.io.IOException;

@WebServlet("/trainerList")
public class TrainerListServlet extends HttpServlet {

    private final TrainerService trainerService = new TrainerService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        request.setAttribute("trainers", trainerService.getAllTrainers());
        request.getRequestDispatcher("views/admin/trainerList.jsp").forward(request, response);
    }
}