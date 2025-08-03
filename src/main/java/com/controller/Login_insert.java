package com.controller;

import com.Entity.Login;
import com.Module.Promodule;
import com.connection.JdbcConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/Login_insert")
public class Login_insert extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());

    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
        String name=request.getParameter("name");

        int pass= Integer.parseInt(request.getParameter("password"));

        System.out.println("UserName"+name+"\n "+"Password"+pass);

        try {

            Promodule p=new Promodule(JdbcConnection.getConnection());
            boolean b= p.loginsert(name,pass);
            if (b) {
                HttpSession session=request.getSession();
                session.setAttribute("userName",name);
                response.sendRedirect("welcome.jsp");
            }
            else {
                response.sendRedirect("Login.jsp");
            }

           /* if(b){
                response.setContentType("text/html");
                PrintWriter out = response.getWriter();

                out.println("<script type=\"text/javascript\">");
                out.println("alert('Form successfully!');");
                out.println("location='login.jsp';"); // redirect to another page after alert
                out.println("</script>");
                response.getWriter().append("Login.jsp");
            }*/

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
