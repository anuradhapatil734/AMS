package com.Module;

import com.Entity.Registration;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static java.sql.Date.valueOf;

public class Promodule {

    Connection con;

    public Promodule(Connection con) {
        super();
        this.con = con;
    }


    public boolean registerinsert(Registration r) {
        boolean status = false;
        try {
            Connection conn = this.con;
            String query = "INSERT INTO registration1 (firstname, lastname, middlename, dob, category, address, city, state, country, zipcode, email, phone, course, fee, remainingfees, reg_date,paid) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?, ?)";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, r.getFirstname());
            ps.setString(2, r.getLastname());
            ps.setString(3, r.getMiddlename());
            ps.setDate(4, valueOf(r.getDob()));
            ps.setString(5, r.getCategory());
            ps.setString(6, r.getAddress());
            ps.setString(7, r.getCity());
            ps.setString(8, r.getState());
            ps.setString(9, r.getCountry());
            ps.setString(10, r.getZipcode());
            ps.setString(11, r.getEmail());
            ps.setString(12, r.getPhone());
            ps.setString(13, r.getCourse());
            ps.setInt(14, r.getFee());
            ps.setInt(15, r.getRemainingfees());
            ps.setDate(16, valueOf(r.getReg_date()));
            ps.setInt(17,r.getPaid());

            int rows = ps.executeUpdate();
            if (rows > 0) {
                status = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }


    public boolean loginsert(String name, int pass) throws SQLException {

        String sql = "select * from login where name=? and password=?";

        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, name);
        ps.setInt(2, pass);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            System.out.println("Login Success");
            return true;

        }

        return false;
    }

    public List<Registration> RegistrationRecord() throws SQLException {
        PreparedStatement ps = con.prepareStatement("SELECT * FROM registration1");
        ResultSet rs = ps.executeQuery();
        List<Registration> list = new ArrayList<>();

        while (rs.next()) {
            Registration pr = new Registration();
            pr.setId(rs.getInt("id"));
            pr.setFirstname(rs.getString("FirstName"));
            pr.setMiddlename(rs.getString("MiddleName"));
            pr.setLastname(rs.getString("LastName"));
            pr.setEmail(rs.getString("email"));
            pr.setPhone(rs.getString("phone"));
            pr.setCourse(rs.getString("course"));
            pr.setFee(rs.getInt("fee"));
            pr.setRemainingfees(rs.getInt("remainingfees"));
            pr.setReg_date(rs.getDate("reg_date").toLocalDate());
            //System.out.println(rs.getDate("reg_date").toLocalDate());
            java.sql.Timestamp ts = rs.getTimestamp("reg_date");

            if (ts != null) {
                pr.setReg_date(ts.toLocalDateTime().toLocalDate());
            } else {
                pr.setReg_date(null);
            }



            list.add(pr); // Add the object to the list
        }

        return list;
    }

    public int list_delete(int id) throws SQLException {
        int i = 0;
        String sql = "delete from registration1 where id=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, id);
        int i1 = ps.executeUpdate();
        if (i1 == 1) {
            System.out.println("Record Delete");

        }

        return i;
    }

    public List<Registration> checkid_list(int id) throws SQLException {

        List<Registration> list = new ArrayList<>();
        Registration pr = null;
        String sql = "select * from registration1 where id=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            pr = new Registration();
            pr.setId(rs.getInt("id"));
            pr.setFirstname(rs.getString("firstname"));
            pr.setMiddlename(rs.getString("middlename"));
            pr.setLastname(rs.getString("lastname"));
            pr.setEmail(rs.getString("email"));
            pr.setPhone(rs.getString("phone"));
            pr.setCourse(rs.getString("course"));
            pr.setFee(rs.getInt("fee"));
            pr.setRemainingfees(rs.getInt("remainingfees"));
            pr.setPaid(rs.getInt("paid"));



            list.add(pr);
        }
        return list;
    }

    public boolean list_update(Registration r2) throws SQLException {
        boolean b = false;
        String sql = "UPDATE registration1 SET FirstName=?, Middlename=?, LastName=?, email=?, phone=?, course=?, fee=?, remainingfees=?, paid=? WHERE id=?";

        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, r2.getFirstname());
        ps.setString(2, r2.getMiddlename());
        ps.setString(3, r2.getLastname());
        ps.setString(4, r2.getEmail());
        ps.setString(5, r2.getPhone());
        ps.setString(6, r2.getCourse());
        ps.setInt(7, r2.getFee());
        ps.setInt(8, r2.getRemainingfees());
        ps.setInt(9, r2.getPaid());
        ps.setInt(10, r2.getId());

        int i = ps.executeUpdate();
        if (i == 1) {
            b = true;
            System.out.println("Record Updated Successfully");
        }
        return b;
    }


    public List<Registration> RegistrationRecord1F() throws SQLException {
        PreparedStatement ps = con.prepareStatement("SELECT * FROM registration1");
        ResultSet rs = ps.executeQuery();
        List<Registration> list = new ArrayList<>();

        while (rs.next()) {
            Registration pr = new Registration();
            pr.setId(rs.getInt("id"));
            pr.setFirstname(rs.getString("FirstName"));
            pr.setMiddlename(rs.getString("MiddleName"));
            pr.setLastname(rs.getString("LastName"));
            pr.setEmail(rs.getString("email"));
            pr.setPhone(rs.getString("phone"));
            pr.setCourse(rs.getString("course"));
            pr.setFee(rs.getInt("fee"));

            list.add(pr);
        }

        return list;

    }

    public List<Registration> checkid_fees(int id) throws SQLException {

        List<Registration> list = new ArrayList<>();
        Registration pr = null;
        String sql = "select * from registration1 where id=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            pr = new Registration();
            pr.setId(rs.getInt("id"));
            pr.setFirstname(rs.getString("firstname"));
            pr.setMiddlename(rs.getString("middlename"));
            pr.setLastname(rs.getString("lastname"));
            pr.setEmail(rs.getString("email"));
            pr.setPhone(rs.getString("phone"));
            pr.setCourse(rs.getString("course"));
            pr.setFee(rs.getInt("fee"));

            list.add(pr);
        }
        return list;

    }

    public boolean fees_update(Registration r2) throws SQLException {
        boolean b = false;
        String sql = "UPDATE registration1 SET FirstName=?, Middlename=?, LastName=?, email=?, phone=?, course=?, fee=? WHERE id=?";

        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, r2.getFirstname());
        ps.setString(2, r2.getMiddlename());
        ps.setString(3, r2.getLastname());
        ps.setString(4, r2.getEmail());
        ps.setString(5, r2.getPhone());
        ps.setString(6, r2.getCourse());
        ps.setInt(7, r2.getFee());
        ps.setInt(8, r2.getId());

        int i = ps.executeUpdate();
        if (i == 1) {
            b = true;
            System.out.println("Record Updated Successfully");
        }
        return b;

    }

    public List<Registration> RegistrationRecord1R() throws SQLException {
        PreparedStatement ps = con.prepareStatement("SELECT * FROM registration1");
        ResultSet rs = ps.executeQuery();
        List<Registration> list = new ArrayList<>();

        while (rs.next()) {
            Registration pr = new Registration();
            pr.setId(rs.getInt("id"));
            pr.setFirstname(rs.getString("FirstName"));
            pr.setMiddlename(rs.getString("MiddleName"));
            pr.setLastname(rs.getString("LastName"));
            pr.setEmail(rs.getString("email"));
            pr.setPhone(rs.getString("phone"));
            pr.setCourse(rs.getString("course"));
            pr.setFee(rs.getInt("fee"));

            list.add(pr);
        }

        return list;

    }

    public List<Registration> checkid_report(int id) throws SQLException {
        List<Registration> list = new ArrayList<>();
        Registration pr = null;
        String sql = "select * from registration1 where id=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            pr = new Registration();
            pr.setId(rs.getInt("id"));
            pr.setFirstname(rs.getString("firstname"));
            pr.setMiddlename(rs.getString("middlename"));
            pr.setLastname(rs.getString("lastname"));
            pr.setEmail(rs.getString("email"));
            pr.setPhone(rs.getString("phone"));
            pr.setCourse(rs.getString("course"));
            pr.setFee(rs.getInt("fee"));

            list.add(pr);
        }
        return list;

    }

    public boolean report_update(Registration r2) throws SQLException {
        boolean b = false;
        String sql = "UPDATE registration1 SET FirstName=?, Middlename=?, LastName=?, email=?, phone=?, course=?, fee=?,remainingfees=?, paid=? WHERE id=?";

        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, r2.getFirstname());
        ps.setString(2, r2.getMiddlename());
        ps.setString(3, r2.getLastname());
        ps.setString(4, r2.getEmail());
        ps.setString(5, r2.getPhone());
        ps.setString(6, r2.getCourse());
        ps.setInt(7, r2.getFee());
        ps.setInt(8,r2.getRemainingfees());
        ps.setInt(9,r2.getPaid());
        ps.setInt(10, r2.getId());

        int i = ps.executeUpdate();
        if (i == 1) {
            b = true;
            System.out.println("Record Updated Successfully");
        }
        return b;

    }

    public int totalstudent() throws SQLException {
        String sql = "SELECT COUNT(*) FROM registration1";
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        int count=0;
        if (rs.next()) {
            count = rs.getInt(1);
            System.out.println("Total student count from DB: " + count); // debug log
        }
        return count;

    }

    public int totalfee() throws SQLException {
        String sql = "SELECT SUM(paid) FROM registration1";
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        int count = 0;
        if (rs.next()) {
            count = rs.getInt(1);
            System.out.println("total fess collect from DB: " + count); // debug log
        }
        return count;


    }

    public int pendingfee() throws SQLException {
        String sql = "SELECT SUM(remainingfees) FROM registration1";
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        int count = 0;
        if (rs.next()) {
            count = rs.getInt(1);
            System.out.println("pending fee from DB: " + count);
        }
        return count;


    }

    public boolean list_edit(Registration r2) throws SQLException {
        boolean b = false;
        String sql = "UPDATE registration1 SET FirstName=?, Middlename=?, LastName=?, email=?, phone=?, course=?, fee=? WHERE id=?";

        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, r2.getFirstname());
        ps.setString(2, r2.getMiddlename());
        ps.setString(3, r2.getLastname());
        ps.setString(4, r2.getEmail());
        ps.setString(5, r2.getPhone());
        ps.setString(6, r2.getCourse());
        ps.setInt(7, r2.getFee());
        ps.setInt(8, r2.getId());

        int i = ps.executeUpdate();
        if (i == 1) {
            b = true;
            System.out.println("Record Updated Successfully");
        }
        return b;

    }

    public List<Registration> checkid_edit(int id) throws SQLException {

        List<Registration> list = new ArrayList<>();
        Registration pr = null;
        String sql = "select * from registration1 where id=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            pr = new Registration();
            pr.setId(rs.getInt("id"));
            pr.setFirstname(rs.getString("firstname"));
            pr.setMiddlename(rs.getString("middlename"));
            pr.setLastname(rs.getString("lastname"));
            pr.setEmail(rs.getString("email"));
            pr.setPhone(rs.getString("phone"));
            pr.setCourse(rs.getString("course"));
            pr.setFee(rs.getInt("fee"));

            list.add(pr);
        }
        return list;
    }


    public int newstudent() throws SQLException {
        String sql = "SELECT COUNT(*) FROM registration1 WHERE DATE(reg_date) = CURDATE()";
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        int count = 0;
        if (rs.next()) {
            count = rs.getInt(1);
            System.out.println("New students today from DB: " + count); // debug log
        }
        return count;

    }

    public int tatalcourse() throws SQLException {
        String sql = "SELECT COUNT(DISTINCT course) FROM registration1";
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        int count = 0;
        if (rs.next()) {
            count = rs.getInt(1);
            System.out.println("total Course from DB: " + count); // debug log
        }
        return count;

    }



    public Map<String, Integer> getStudentCountByCourse() throws SQLException {
        Map<String, Integer> map = new HashMap<>();
        String sql = "SELECT course, COUNT(*) AS total FROM registration1 GROUP BY course";
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            String course = rs.getString("course");
            int total = rs.getInt("total");
            map.put(course, total);
        }

        return map;
    }

    public List<Registration> RegistrationRecordRE() throws SQLException {
        PreparedStatement ps = con.prepareStatement("SELECT * FROM registration1");
        ResultSet rs = ps.executeQuery();
        List<Registration> list = new ArrayList<>();

        while (rs.next()) {
            Registration pr = new Registration();
            pr.setId(rs.getInt("id"));
            pr.setFirstname(rs.getString("FirstName"));
            pr.setMiddlename(rs.getString("MiddleName"));
            pr.setLastname(rs.getString("LastName"));
            pr.setEmail(rs.getString("email"));
            pr.setPhone(rs.getString("phone"));
            pr.setCourse(rs.getString("course"));
            pr.setFee(rs.getInt("fee"));
            pr.setRemainingfees(rs.getInt("remainingfees"));
            pr.setReg_date(rs.getDate("reg_date").toLocalDate());

            list.add(pr);
        }

        return list;
    }



}



