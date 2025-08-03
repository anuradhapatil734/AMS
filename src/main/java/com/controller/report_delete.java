package com.controller;

import com.Module.Promodule;
import com.connection.JdbcConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/report_delete")
public class report_delete extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
        System.out.println("inside delete_insert");
        int id=Integer.parseInt(request.getParameter("id"));
        System.out.println(id);
        try {
            Promodule pp=new Promodule(JdbcConnection.getConnection());
            int i=pp.list_delete(id);
            if (i==1) {
                response.sendRedirect("login.jsp");
            }
            else  {

                response.sendRedirect("report.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}
