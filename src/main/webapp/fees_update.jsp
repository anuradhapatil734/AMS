<%--
  Created by IntelliJ IDEA.
  User: patil
  Date: 20-07-2025
  Time: 03:40 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.connection.JdbcConnection" %>
<%@ page import="com.Module.Promodule" %>
<%@ page import="com.Entity.Registration" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Student</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
    <style>
        body {
            background-color: #f0f0f0;
            font-family: 'Segoe UI', sans-serif;
        }
        .btn-outline-primary {
            color: white ;
            border-color: white ;
        }
        h7 {
            color: red;
            margin-top: 20px;
        }
        .sidebar { height: 100vh; background-color: #233480; color: white; }
        .topbar { background-color: #233480; color: white; }
        .profile-icon {
            width: 35px; height: 35px; border-radius: 50%; background-color: white;
            display: flex; align-items: center; justify-content: center;
        }
        .search-input { width: 250px; }
        .nav-link { color: white; }

        .nav-link.active, .nav-link:hover { background-color: #1a2a60; color: white; }
        .img3 { height: 50px; width: 50px; }
        .main-box {
            background-color: white; border-radius: 12px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.3); padding: 30px; margin-top: 20px;
        }



    </style>
</head>

<body>
<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <div class="col-md-2 sidebar d-flex flex-column p-3" id="cl">
            <div class="row bg-white mb-3 rounded">
                <div class="col-sm mt-2">
                    <img src="image/vvit.png" alt="VVIT Logo" class="img-fluid mb-2 rounded-circle img3">
                </div>
                <div class="col-sm">
                    <h3 class="text-primary fw-bold mt-3">VVIT</h3>
                </div>
            </div>
            <ul class="nav nav-pills flex-column mb-auto px-1">
                <li class="mb-3"><a href="dashboard.jsp" class="btn btn-outline-primary w-100 t"><i class="bi bi-house me-2"></i> Dashboard</a></li>
                <li class="mb-3"><a href="AddStudent.jsp" class="btn btn-outline-primary w-100" class="nav-link"><i class="bi bi-bar-chart me-2" ></i> Add Student</a></li>
                <li class="mb-3"><a href="StudentList.jsp" class="btn btn-outline-primary w-100" class="nav-link active"><i class="bi bi-people me-2"></i> Student List</a></li>
                <li class="mb-3"><a href="fees.jsp" class="btn btn-outline-primary w-100" class="nav-link"><i class="bi bi-cash me-2"></i> Fees</a></li>
                <li class="mb-3" ><a href="report.jsp" class="btn btn-outline-primary w-100" class="nav-link"><i class="bi bi-file-earmark-text me-2"></i> Reports</a></li>
                <li class="mb-3"><a href="email.jsp" class="btn btn-outline-primary w-100 "><i class="bi bi-envelope-fill me-2"></i>Emaill </a></li>

            </ul>
            <div class="mt-auto">
                <a href="Registration.jsp" class="btn btn-outline-primary w-100">
                    <i class="bi bi-box-arrow-right me-2"></i> Logout
                </a>
            </div>
        </div>

        <!-- Main Content -->
        <div class="col-md-10">
            <!-- Topbar -->
            <div class="d-flex justify-content-between align-items-center p-3 topbar rounded mt-2">
                <div class="d-flex align-items-center gap-3">
                    <button class="btn btn-light d-md-none"><i class="bi bi-list"></i></button>
                    <input type="text" id="customSearch" class="form-control search-input" placeholder="Search students...">

                </div>

                <div class="d-flex align-items-center">
                    <i class="bi bi-bell-fill me-3 fs-5"></i>
                    <i class="bi bi-envelope-fill me-3 fs-5"></i>
                    <div class="profile-icon me-2">
                        <i class="bi bi-person-fill text-dark"></i>
                    </div>
                    <span class="fw-semibold">jaya</span>
                </div>
            </div>

            <!-- Form Content -->
            <%
                try {
                    int id = Integer.parseInt(request.getParameter("id"));
                    Promodule p = new Promodule(JdbcConnection.getConnection());
                    List<Registration> al = p.checkid_fees(id);
                    for (Registration pr : al) {
            %>
            <br>
            <h3 class="fw-bold">Edit StudentList</h3>

            <div class="main-box">
                <h4>Update Student Information</h4>
                <form action="fees_update" method="post">
                    <input type="hidden" name="id" value="<%=pr.getId()%>">
                    <div class="row">
                        <div class="col-md-4 mb-3">
                            <h7> <label for="firstname">First Name:</label></h7>
                            <input type="text" name="firstname" id="firstname" value="<%= pr.getFirstname() %>" class="form-control">
                        </div>
                        <div class="col-md-4 mb-3">
                            <h7><label for="middlename">Middle Name:</label></h7>
                            <input type="text" name="middlename"   class="form-control"value="<%= (pr.getMiddlename() != null) ? pr.getMiddlename() : "" %>">
                        </div>
                        <div class="col-md-4 mb-3">
                            <h7> <label for="lastname">Last Name:</label></h7>
                            <input type="text" name="lastname"  class="form-control"value="<%= (pr.getLastname() != null) ? pr.getLastname() : "" %>">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <h7><label for="email" class="form-label">Email:</label></h7>
                            <input type="email" name="email" id="email" class="form-control" value="<%=pr.getEmail()%>" placeholder="Enter Email">
                        </div>
                        <div class="col-md-6 mb-3">
                            <h7><label for="phone" class="form-label">Phone:</label></h7>
                            <input type="text" name="phone" id="phone" class="form-control" value="<%=pr.getPhone()%>" placeholder="Enter Phone">

                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col-md-6">
                            <h7> <label for="course" class="form-label">Select Course</label></h7>
                            <select class="form-select" name="course" id="course" onchange="setFees()" required>
                                <option disabled selected value="">Select Course</option>
                                <option value="Computer">Computer</option>
                                <option value="Civil">Civil</option>
                                <option value="Electrical">Electrical</option>
                                <option value="Electronics">Electronics</option>
                                <option value="Mechanical">Mechanical</option>
                            </select>
                        </div>

                        <div class="col-md-6">
                            <h7><label for="fees" class="form-label">Course Fees</label></h7>
                            <input type="text" class="form-control" id="fees" name="fees" placeholder="Auto-filled Fee" readonly required />
                        </div>
                    </div>


                    <script>
                        function setFees() {
                            const course = document.getElementById("course").value;
                            const feesField = document.getElementById("fees");

                            const courseFees = {
                                Computer: 30000,
                                Civil: 28000,
                                Electrical: 27000,
                                Electronics: 29000,
                                Mechanical: 31000
                            };

                            feesField.value = courseFees[course] || '';
                        }
                    </script>



                    <div class="mt-3">
                        <button type="submit" class="btn btn-outline-success">Update</button>
                        <button type="reset" class="btn btn-outline-secondary">Reset</button>
                    </div>
                </form>
            </div>
            <%  } } catch (Exception e) { e.printStackTrace(); } %>
        </div>
    </div>
</div>
</body>
</html>
