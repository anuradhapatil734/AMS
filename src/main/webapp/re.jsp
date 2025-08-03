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
      height: 200vh;
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
      border-radius: 12px;
      box-shadow: 0 0 20px rgba(0, 0, 0, 0.3);
      padding: 30px;
      margin: 20px auto;
      max-width: 1100px;
    }
    .dashboard-card {
      border-radius: 20px;
      min-height: 180px;
      transition: transform 0.3s ease, box-shadow 0.3s ease;
      box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.2);
    }

    .dashboard-card:hover {
      transform: translateY(-5px);
      box-shadow: 8px 8px 20px rgba(0, 0, 0, 0.35);
    }

    .btn-excel {
      background-color: #28a745;
      color: white;
      border: none;
      padding: 5px 10px;
      margin-right: 5px;
    }

    .btn-pdf {
      background-color: #dc3545;
      color: white;
      border: none;
      padding: 5px 10px;
      margin-right: 5px;
    }

    .btn-print {
      background-color: #007bff;
      color: white;
      border: none;
      padding: 5px 10px;
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
    <div class="col-md-2 sidebar d-flex flex-column p-3" id="sidebar">
      <div class="row bg-white mb-3 rounded">
        <div class="col-sm mt-2">
          <span class="sidebar-label"> <img src="image/vvit.png" alt="VVIT Logo" class="img-fluid mb-2 rounded-circle img3"></span>
        </div>
        <div class="col-sm">
          <h3 class="text-primary fw-bold mt-3">VVIT</h3>
        </div>
      </div>

      <ul class="nav nav-pills flex-column mb-auto px-1"  id="navList">
        <li class="mb-3"><a href="welcome.jsp" class="btn btn-outline-primary w-100 "><i class="bi bi-house me-2"></i> <span class="sidebar-label">Dashboard</span></a></li>
        <li class="mb-3"><a href="AddStudent.jsp" class="btn btn-outline-primary w-100"><i class="bi bi-bar-chart me-2"></i><span class="sidebar-label"> Add Student</span></a></li>
        <li class="mb-3"><a href="StudentList.jsp" class="btn btn-outline-primary w-100"><i class="bi bi-people me-2"></i><span class="sidebar-label"> Student List</span></a></li>
        <li class="mb-3"><a href="fees.jsp" class="btn btn-outline-primary w-100 "><i class="bi bi-cash me-2"></i><span class="sidebar-label"> Fees</span></a></li>
        <li class="mb-3"><a href="report.jsp" class="btn btn-outline-primary w-100 active"><i class="bi bi-file-earmark-text me-2"></i><span class="sidebar-label"> Reports</span></a></li>
        <li class="mb-3"><a href="email.jsp" class="btn btn-outline-primary w-100 "><i class="bi bi-envelope-fill me-2"></i><span class="sidebar-label">Email</span></a></li>
      </ul>
      <div class="mt-auto">
        <a href="Registration.jsp" class="btn btn-outline-primary w-100">
          <span class="sidebar-label"> <i class="bi bi-box-arrow-right me-2"></i> Logout</span>
        </a>
      </div>
    </div>

    <!-- Main Content -->
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

      <!-- Student List -->
      <div class="d-flex justify-content-between align-items-center mt-4 px-3">
        <h3 style="color: black" class="fw-bold">Report</h3>
      </div>

      <!-- Table -->
      <div class="main-box mt-3">
        <div class="container">


          <div class="row g-4 mt-2">

            <div class="row g-4"> <!-- Bootstrap gutter spacing -->
              <!-- Total Students -->
              <div class="col-md-4">
                <div class="card text-white text-center py-4  dashboard-card" style="
      background-color: #e754db;
      border-radius: 20px;
      min-height: 180px;
      box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.2);
    ">
                  <div>
                    <i class="bi bi-people-fill fs-1 mb-3" style="color: #ffffff;"></i>
                    <div class="fs-5">Total Students</div>
                    <h2 class="fw-bold mt-2">
                      <%
                        try {
                          Promodule p = new Promodule(JdbcConnection.getConnection());
                          int total = p.totalstudent();
                          out.print(total);
                        } catch (Exception e) {
                          e.printStackTrace();
                        }
                      %>
                    </h2>
                  </div>
                </div>
              </div>

              <!-- Total Fees Collection -->
              <div class="col-md-4">
                <div class="card text-white text-center py-4  dashboard-card" style="
      background: linear-gradient(135deg, #849be4, #5876d1);
      border-radius: 20px;
      min-height: 180px;
      box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.2);
    ">
                  <div>
                    <i class="bi bi-wallet2 fs-1 mb-3" style="color: #ffffff;"></i>
                    <div class="fs-5">Total Fees Collection</div>
                    <h2 class="fw-bold mt-2">
                      <%
                        try {
                          Promodule p = new Promodule(JdbcConnection.getConnection());
                          int total = p.totalfee();
                          out.print("₹" + total);
                        } catch (Exception e) {
                          e.printStackTrace();
                        }
                      %>
                    </h2>
                  </div>
                </div>
              </div>

              <!-- Pending Fees -->
              <div class="col-md-4">
                <div class="card text-white text-center py-4  dashboard-card" style="
      background-color: #4cc96f;
      border-radius: 20px;
      min-height: 180px;
      box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.2);
    ">
                  <div>
                    <i class="bi bi-cash-coin fs-1 mb-3" style="color: #ffffff;"></i>
                    <div class="fs-5">Pending Fees</div>
                    <h2 class="fw-bold mt-2">
                      <%
                        try {
                          Promodule p = new Promodule(JdbcConnection.getConnection());
                          int pending = p.pendingfee();
                          out.print("₹" + pending);
                        } catch (Exception e) {
                          e.printStackTrace();
                        }
                      %>
                    </h2>
                  </div>
                </div>
              </div>
            </div>

          </div>

          <br><br>
          <div class="main-box mt-3">


            <div class="row mb-3">
              <div class="col-md-4">
                <h6>To:</h6>
                <input type="date" id="minDate" class="form-control" placeholder="From Date (yyyy-mm-dd)">
              </div>


              <div class="col-md-4">
                <h6>Form:</h6>
                <input type="date" id="maxDate" class="form-control" placeholder="To Date (yyyy-mm-dd)">
              </div>

              <div class="col-md-4">
                <h6>Course:</h6>
                <select id="courseFilter" class="form-control">
                  <option disabled selected value="">Select Course</option>
                  <option value="Computer">Computer</option>
                  <option value="Civil">Civil</option>
                  <option value="Electrical">Electrical</option>
                  <option value="Electronics">Electronics</option>
                  <option value="Mechanical">Mechanical</option>
                </select>
              </div>

            </div>





            <div class="table-responsive ">
              <table id="studentTable" class="table table-striped table-hover align-middle text-center">
                <thead class="table-primary">
                <tr>
                  <th>Id</th>
                  <th>Name</th>
                  <th>Email</th>
                  <th>Phone</th>
                  <th>Course</th>
                  <th>Fee</th>
                  <th>Remaining Fees</th>
                  <th>Date</th>
                  <th>Proceed</th>
                  <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <%
                  try {
                    Promodule p = new Promodule(JdbcConnection.getConnection());
                    List<Registration> al = p.RegistrationRecord();
                    for (Registration pr : al) {

                %>
                <tr>
                  <td><%= pr.getId() %></td>

                  <%
                    String fullName =pr.getFirstname()  + pr.getMiddlename() + pr.getLastname();
                  %>
                  <td><%= fullName %></td>

                  <td><%= pr.getEmail() %></td>
                  <td><%= pr.getPhone() %></td>
                  <td><%= pr.getCourse() %></td>
                  <td>₹<%= pr.getFee() %></td>
                  <td><span class="badge bg-warning text-dark">₹<%= pr.getRemainingfees() %></span></td>
                  <td> <%= (pr.getReg_date() != null) ? pr.getReg_date() : "--" %>
                  </td>

                  <td>
                    <a href="spro.jsp?id=<%= pr.getId() %>" class="btn btn-sm btn-outline-success">
                      <i class="bi bi-cash-coin"></i> Proceed
                    </a>
                  </td>
                  <td>
                    <a href="list_update.jsp?id=<%= pr.getId() %>" class="text-primary me-2" title="Edit">
                      <i class="bi bi-pencil-square fs-5"></i>
                    </a>
                    <a href="slist_delete?id=<%= pr.getId() %>" class="text-danger" title="Delete">
                      <i class="bi bi-trash3 fs-5"></i>
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
    <div>
    </div>



    <script>
      $(document).ready(function () {
        const table = $('#studentTable').DataTable({
          pageLength: 7,
          scrollX: true,
          dom: 'fBrtip',
          buttons: [
            {
              extend: 'excelHtml5',
              text: 'Export to Excel',
              className: 'btn-excel'
            },
            {
              extend: 'pdfHtml5',
              text: 'Export to PDF',
              className: 'btn-pdf',
              orientation: 'landscape',
              pageSize: 'A4'
            },
            {
              extend: 'print',
              text: 'Print Table',
              className: 'btn-print'
            }
          ]
        });


        $('#customSearch').on('keyup', function () {
          table.search(this.value).draw();
        });



        $('#courseFilter').on('change', function () {
          table.column(4).search(this.value).draw();
        });



        $('#minDate').on('input',function (){
          table.column(7).search(this.value).draw();
        });

        $('#maxDate').on('input',function (){
          table.column(7).search(this.value).draw();
        });



      });
    </script>

    <script>
      const toggleBtn = document.getElementById('toggleSidebarBtn');
      const sidebar = document.getElementById('sidebar');

      toggleBtn.addEventListener('click', () => {
        sidebar.classList.toggle('collapsed');
      });
    </script>
  </div>
</div>
</body>

</html>




