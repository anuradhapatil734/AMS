package com.controller;

import com.Module.Promodule;
import com.connection.JdbcConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.util.Arrays;
import java.util.Collections;
import java.util.Map;

@WebServlet("/welcome_insert")
public class welcome_insert extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       doGet(request,response);

        try {
            Connection con = JdbcConnection.getConnection();
            Promodule p = new Promodule(con);

            // Get student count by course
            Map<String, Integer> data = p.getStudentCountByCourse();

            int computer = data.getOrDefault("Computer", 0);
            int civil = data.getOrDefault("Civil", 0);
            int mechanical = data.getOrDefault("Mechanical", 0);
            int electronics = data.getOrDefault("Electronics", 0);
            int electrical = data.getOrDefault("Electrical", 0);

            int max = Collections.max(Arrays.asList(computer, civil, mechanical, electronics, electrical));

            // Set attributes exactly as JSP expects
            request.setAttribute("Computer", computer);
            request.setAttribute("Civil", civil);
            request.setAttribute("Mechanical", mechanical);
            request.setAttribute("Electronics", electronics);
            request.setAttribute("Electrical", electrical);
            request.setAttribute("max", max);

            request.getRequestDispatcher("welcome.jsp").forward(request, response);


        } catch (Exception e) {


            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Something went wrong");
        }
    }
}
