<%--
  Created by IntelliJ IDEA.
  User: patil
  Date: 20-07-2025
  Time: 03:37 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.connection.JdbcConnection" %>
<%@ page import="java.util.List" %>
<%@ page import="com.Module.Promodule" %>
<%@ page import="com.Entity.Registration" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<title>Fees | VVIT</title>

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">

<!-- DataTables -->
<link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/buttons/2.4.1/css/buttons.dataTables.min.css">

<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/buttons/2.4.1/js/dataTables.buttons.min.js"></script>
<script src="https://cdn.datatables.net/buttons/2.4.1/js/buttons.html5.min.js"></script>
<script src="https://cdn.datatables.net/buttons/2.4.1/js/buttons.print.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.10.1/jszip.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/pdfmake.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/vfs_fonts.js"></script>

<style>
  body {
    background-color: #f0f0f0;
    font-family: 'Segoe UI', sans-serif;
  }
  .btn-outline-primary {
    color: white ;
    border-color: white ;
  }
  .sidebar {
    height: 140vh;
    background-color: #233480;
    color: white;
  }
  .topbar {
    background-color: #233480;
    color: white;
  }
  .profile-icon {
    width: 35px;
    height: 35px;
    border-radius: 50%;
    background-color: white;
    display: flex;
    align-items: center;
    justify-content: center;
  }
  .search-input {
    width: 250px;
  }
  .nav-link {
    color: white;
  }
  .nav-link.active,
  .nav-link:hover {
    background-color: #1a2a60;
    color: white;
  }
  .img3 {
    height: 50px;
    width: 50px;
  }
  .main-box {
    background-color: white;
    border-radius: 15px;
    box-shadow: 0 0 15px rgba(0,0,0,0.1);
    padding: 25px;
    margin-top: 30px;
    overflow-x: auto;
  }


  table.dataTable {
    border-collapse: separate !important;
    border-spacing: 0 8px !important;
  }


  table.dataTable thead th {
    background-color: #0d6efd;
    color: white;
    border: none;
    border-radius: 8px 8px 0 0;
  }



  table.dataTable tbody td {
    vertical-align: middle;
    border-top: none !important;
  }


  .btn-excel {
    background-color: #198754 !important;
    color: white !important;
  }

  .btn-pdf {
    background-color: #dc3545 !important;
    color: white !important;
  }

  .btn-print {
    background-color: #0d6efd !important;
    color: white !important;
  }

  /* Round buttons */
  .dt-button {
    border-radius: 20px !important;
  }

  .table td, .table th {
    padding: 12px;
  }

  .bi {
    vertical-align: middle;
  }

  .sidebar {
    width: 200px;
    transition: all 0.3s;
  }

  .sidebar.collapsed {
    width: 70px;
  }

  .sidebar.collapsed .sidebar-label {
    display: none;
  }

  .sidebar.collapsed .btn {
    justify-content: center;
    text-align: center;
    padding-left: 0;
    padding-right: 0;
  }



</style>
</head>
<body>
<div class="container-fluid">
  <div class="row">
    <!-- Sidebar -->
    <div class="col-md-2 sidebar d-flex flex-column p-3 " id="sidebar">
      <div class="row bg-white mb-3 rounded">
        <div class="col-sm mt-2">
          <span class="sidebar-label"><img src="image/vvit.png" alt="VVIT Logo" class="img-fluid mb-2 rounded-circle img3"></span>
        </div>
        <div class="col-sm">
          <h3 class="text-primary fw-bold mt-3">VVIT</h3>
        </div>
      </div>

      <ul class="nav nav-pills flex-column mb-auto px-1"  id="navList">
        <li class="mb-3"><a href="welcome.jsp" class="btn btn-outline-primary w-100 "><i class="bi bi-house me-2"></i> <span class="sidebar-label">Dashboard</span></a></li>
        <li class="mb-3"><a href="AddStudent.jsp" class="btn btn-outline-primary w-100"><i class="bi bi-bar-chart me-2"></i><span class="sidebar-label"> Add Student</span></a></li>
        <li class="mb-3"><a href="StudentList.jsp" class="btn btn-outline-primary w-100 active"><i class="bi bi-people me-2"></i><span class="sidebar-label"> Student List</span></a></li>
        <li class="mb-3"><a href="fees.jsp" class="btn btn-outline-primary w-100"><i class="bi bi-cash me-2"></i><span class="sidebar-label"> Fees</span></a></li>
        <li class="mb-3"><a href="report.jsp" class="btn btn-outline-primary w-100"><i class="bi bi-file-earmark-text me-2"></i><span class="sidebar-label"> Reports</span></a></li>
        <li class="mb-3"><a href="email.jsp" class="btn btn-outline-primary w-100 "><i class="bi bi-envelope-fill me-2"></i><span class="sidebar-label">Email</span></a></li>
      </ul>
      <div class="mt-auto">
        <a href="Registration.jsp" class="btn btn-outline-primary w-100">
         <span class="sidebar"><i class="bi bi-box-arrow-right me-2"></i> Logout</span>
        </a>
      </div>
    </div>

    <div class="col-md-10">
      <div class="d-flex justify-content-between align-items-center p-3 topbar rounded mt-2">
        <button id="toggleSidebarBtn" class="btn btn-outline-light me-2"><i class="bi bi-list"></i></button>

        <div class="d-flex align-items-center">
          <i class="bi bi-bell-fill me-3 fs-5"></i>
          <i class="bi bi-envelope-fill me-3 fs-5"></i>
          <div class="profile-icon me-2">
            <i class="bi bi-person-fill text-dark"></i>
          </div>
          <span class="fw-semibold">Anu</span>
        </div>
      </div>


      <div class="d-flex justify-content-between align-items-center mt-4 px-3">
        <h3 style="color: black" class="fw-bold">Student List</h3>
      </div>

      <div class="main-box mt-3">
        <div class="container">
          <table id="studentTable" class="table table-bordered table-hover display nowrap" style="width:100%">
            <thead class="table-light">
            <tr>
              <th>Id</th>
              <th>Name</th>
              <th>Email</th>
              <th>Phone</th>
              <th>Course</th>
              <th>Fee</th>

              <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <%
              try {
                Promodule p = new Promodule(JdbcConnection.getConnection());
                List<Registration> al = p.RegistrationRecord1F();
                for (Registration pr : al) {
            %>
            <tr>
              <td><%= pr.getId() %></td>
              <%
                String fullName =pr.getFirstname() + " " + pr.getMiddlename() + " " + pr.getLastname();
              %>
              <td><%= fullName %></td>

              <td><%= pr.getEmail() %></td>
              <td><%= pr.getPhone() %></td>
              <td><%= pr.getCourse() %></td>
              <td><%= pr.getFee() %></td>


              <td>
                <a href="fees_update.jsp?id=<%= pr.getId() %>">
                  <i class="bi bi-pencil-square me-2"></i>
                </a>
                <a href="fees_delete?id=<%= pr.getId() %>">
                  <i class="bi bi-trash3 text-danger"></i>
                </a>
              </td>
            </tr>
            <%
                }
              } catch (Exception e) {
                e.printStackTrace();
              }
            %>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- DataTables Script -->
<script>
  $(document).ready(function () {
    const table = $('#studentTable').DataTable({
      pageLength: 7,
      scrollX: true,
      dom: '<"d-flex justify-content-between align-items-center mb-3"fB>rtip',
      buttons: [
        {
          extend: 'excelHtml5',
          text: '<i class="bi bi-file-earmark-excel-fill me-2"></i> Excel',
          className: 'btn btn-excel btn-sm'
        },
        {
          extend: 'pdfHtml5',
          text: '<i class="bi bi-file-earmark-pdf-fill me-2"></i> PDF',
          className: 'btn btn-pdf btn-sm',
          orientation: 'landscape',
          pageSize: 'A4'
        },
        {
          extend: 'print',
          text: '<i class="bi bi-printer-fill me-2"></i> Print',
          className: 'btn btn-print btn-sm'
        }
      ]
    });

    $('#customSearch').on('keyup', function () {
      table.search(this.value).draw();
    });

    $('div.dataTables_filter input')
            .addClass('form-control form-control-sm ms-2')
            .css('width', '180px')
            .attr('placeholder', 'Search...');
  });
</script>

<script>
  const toggleBtn = document.getElementById('toggleSidebarBtn');
  const sidebar = document.getElementById('sidebar');

  toggleBtn.addEventListener('click', () => {
    sidebar.classList.toggle('collapsed');
  });
</script>
</body>
</html>

