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
import java.io.PrintWriter;
import java.time.LocalDate;


@WebServlet("/Registration_insert")
public class Registration_insert extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doGet(request,response);
        try {

        String firstname = request.getParameter("first");
        String lastname = request.getParameter("last");
        String middlename = request.getParameter("middle");

        String dobStr = request.getParameter("dob");
        LocalDate DayofBirth = LocalDate.parse(dobStr);

        String category = request.getParameter("category");
        String address = request.getParameter("add");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String country = request.getParameter("country");
        String zipcode = request.getParameter("zip");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String course = request.getParameter("course");
        String feeStr = request.getParameter("fees");
        //int paid = Integer.parseInt(request.getParameter("paid"));

      int fee = (feeStr == null || feeStr.trim().isEmpty()) ? 0 : Integer.parseInt(feeStr);

            // String remainStr = request.getParameter("remain");
            //int rf = (remainStr == null || remainStr.trim().isEmpty()) ? 0 : Integer.parseInt(remainStr);




            LocalDate regDateStr = LocalDate.parse(request.getParameter("reg_date"));




            String FullName=firstname+" "+middlename+" "+lastname;

      //   int paid = fee - rf;


        System.out.println("first Name:" + firstname + "\n" + "lastname" + lastname + "\n" + "middlename:" + middlename + "\n" +
                "Dayofbirth:" + DayofBirth + "\n" + "category:" + category + "\n" + "address :" + address + "\n" + "city :" + city + "\n" + "state:" + state + "\n"
                + "country:" + country + "\n" + "zipcode:" + zipcode + "\n" + "email:" + email + "\n" + "phone:" + phone + "\n" + "course:" + course+"date:"+regDateStr);





            Registration r2 = new Registration();
            r2.setFirstname(firstname);
            r2.setLastname(lastname);
            r2.setMiddlename(middlename);
            r2.setDob(DayofBirth);
            r2.setCategory(category);
            r2.setAddress(address);
            r2.setCity(city);
            r2.setState(state);
            r2.setCountry(country);
            r2.setZipcode(zipcode);
            r2.setEmail(email);
            r2.setPhone(phone);
            r2.setCourse(course);
            r2.setFee(fee);

            r2.setReg_date(regDateStr);
            r2.setFullName(FullName);






            Promodule p2= new Promodule(JdbcConnection.getConnection());
            boolean b=p2.registerinsert(r2);
            if(b==true) {
                response.setContentType("text/html");
                PrintWriter out = response.getWriter();

                out.println("<script type=\"text/javascript\">");
                out.println("alert('Form successfully!');");
                out.println("location='Registration.jsp';"); // redirect to another page after alert
                out.println("</script>");
            }
        } catch (Exception e) {
          e.printStackTrace();
        }
     }
}
