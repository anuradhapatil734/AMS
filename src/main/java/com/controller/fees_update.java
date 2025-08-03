package com.controller;

import com.Entity.Registration;
import com.Module.Promodule;
import com.connection.JdbcConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/fees_update")
public class fees_update extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
        try {
            int id=Integer.parseInt(request.getParameter("id"));
            System.out.println(id);
            String first=request.getParameter("firstname");
            String middle=request.getParameter("middlename");
            String last=request.getParameter("lastname");
            String email=request.getParameter("email");
            String phone=request.getParameter("phone");
            String course=request.getParameter("course");
            String feeStr = request.getParameter("fees");
            int fee = (feeStr == null || feeStr.trim().isEmpty()) ? 0 : Integer.parseInt(feeStr);

            Registration r2=new Registration ();
            r2.setId(id);
            r2.setFirstname(first);
            r2.setMiddlename(middle);
            r2.setLastname(last);
            r2.setEmail(email);
            r2.setPhone(phone);
            r2.setCourse(course);
            r2.setFee(fee);

            Promodule p=new Promodule(JdbcConnection.getConnection());
            boolean b=p.fees_update(r2);
            if(b){
                response.sendRedirect("StudentList.jsp");
            }


        } catch (Exception e) {
            e.printStackTrace();
        }


        }
}
