<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.connection.JdbcConnection" %>
<%@ page import="com.Module.Promodule" %>
<%@ page import="java.util.List" %>
<%@ page import="com.Entity.Registration" %>
<%@ page import="java.util.Map" %>

<%
    String user = (String) session.getAttribute("userName");
    if (user == null) {
        response.sendRedirect("Login.jsp");
        return;
    }

    Promodule p = new Promodule(JdbcConnection.getConnection());
%>

<html>
<head>
    <title>Fees | VVIT</title>

    <!-- Bootstrap & Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

    <!-- DataTables CSS & JS -->
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
            color: white;
            border-color: white;
        }

        .sidebar {
            height: 100vh;
            background-color: #233480;
            color: white;
        }

        .topbar {
            background-color: #233480;
            color: white;
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

        .profile-icon {
            width: 35px;
            height: 35px;
            border-radius: 50%;
            background-color: white;
            display: flex;
            align-items: center;
            justify-content: center;
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

        .bar-column {
            margin: 0 10px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .bar {
            width: 40px;
            color: white;
            font-weight: bold;
            border-radius: 8px 8px 0 0;
            transition: 0.3s ease;
            position: relative;
            display: flex;
            align-items: flex-end;
            justify-content: center;
        }

        .bar-label {
            margin-top: 8px;
            font-weight: 600;
            font-size: 14px;
        }

        .bar:hover::after {
            content: attr(data-value);
            position: absolute;
            top: -25px;
            background: #333;
            color: #fff;
            padding: 2px 6px;
            font-size: 12px;
            border-radius: 4px;
        }

        @media (max-width: 768px) {
            .search-input {
                width: 100%;
            }

            .bar {
                width: 25px;
                font-size: 10px;
            }

            .bar-label {
                font-size: 12px;
            }
        }



        /* Sidebar full & collapsed styles */
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
        <div class="col-md-2 sidebar d-flex flex-column p-3" id="sidebar" >
            <div class="row bg-white mb-3 rounded">
                <div class="col-sm mt-2">
                    <span class="sidebar-label">    <img src="image/vvit.png" alt="VVIT Logo" class="img-fluid mb-2 rounded-circle img3"></span>
                </div>
                <div class="col-sm">
                    <h4 class="text-primary fw-bold mt-3">VVIT</h4>
                </div>
            </div>


                <ul class="nav nav-pills flex-column mb-auto px-1"  id="navList">
                    <li class="mb-3"><a href="welcome.jsp" class="btn btn-outline-primary w-100 active"><i class="bi bi-house me-2"></i> <span class="sidebar-label">Dashboard</span></a></li>
                    <li class="mb-3"><a href="AddStudent.jsp" class="btn btn-outline-primary w-100"><i class="bi bi-bar-chart me-2"></i><span class="sidebar-label"> Add Student</span></a></li>
                    <li class="mb-3"><a href="StudentList.jsp" class="btn btn-outline-primary w-100"><i class="bi bi-people me-2"></i><span class="sidebar-label"> Student List</span></a></li>
                    <li class="mb-3"><a href="fees.jsp" class="btn btn-outline-primary w-100"><i class="bi bi-cash me-2"></i><span class="sidebar-label"> Fees</span></a></li>
                    <li class="mb-3"><a href="report.jsp" class="btn btn-outline-primary w-100"><i class="bi bi-file-earmark-text me-2"></i><span class="sidebar-label"> Reports</span></a></li>
                    <li class="mb-3"><a href="email.jsp" class="btn btn-outline-primary w-100"><i class="bi bi-envelope-fill me-2"></i><span class="sidebar-label">Email</span></a></li>
                </ul>


            <div class="mt-auto">
                <a href="Login.jsp" class="btn btn-outline-primary w-100">
                    <i class="bi bi-box-arrow-right me-2"></i> <span class="sidebar-label">Logout</span>
                </a>
            </div>
        </div>

        <!-- Main Content -->
        <div class="col-md-10" >
            <div class="d-flex justify-content-between align-items-center p-3 topbar rounded mt-2">

                <button id="toggleSidebarBtn" class="btn btn-outline-light me-2"><i class="bi bi-list"></i></button>
                <div class="d-flex align-items-center">
                    <i class="bi bi-bell-fill me-3 fs-5"></i>
                    <i class="bi bi-envelope-fill me-3 fs-5"></i>
                    <div class="profile-icon me-2">
                        <i class="bi bi-person-fill text-dark"></i>
                    </div>
                    <span class="fw-semibold"><%= user %></span>
                </div>
            </div>

            <!-- Dashboard Section -->
            <div class="main-box mt-3">
                <div class="container mt-4">
                    <h4 class="mb-4">Dashboard</h4>
                    <div class="row g-4">
                        <!-- Total Students -->
                        <div class="col-md-3">
                            <div class="card text-white text-center py-4 dashboard-card" style="background-color: #e754db;">
                                <i class="bi bi-people-fill fs-1 mb-3"></i>
                                <div class="fs-5">Total Students</div>
                                <h2 class="fw-bold mt-2"><%= p.totalstudent() %></h2>
                            </div>
                        </div>

                        <!-- New Students -->
                        <div class="col-md-3">
                            <div class="card text-white text-center py-4 dashboard-card" style="background-color: #4cc96f;">
                                <i class="bi bi-person-plus-fill fs-2"></i>
                                <div class="title">New Students</div>
                                <h2 class="fw-bold mt-2"><%= p.newstudent() %></h2>
                            </div>
                        </div>

                        <!-- Total Courses -->
                        <div class="col-md-3">
                            <div class="card text-white text-center py-4 dashboard-card" style="background-color: #ff7043;">
                                <i class="bi bi-mortarboard-fill fs-2"></i>
                                <div class="title">Total Courses</div>
                                <h2 class="fw-bold mt-2"><%= p.tatalcourse() %></h2>
                            </div>
                        </div>

                        <!-- Total Fees Collection -->
                        <div class="col-md-3">
                            <div class="card text-white text-center py-4 dashboard-card" style="background: linear-gradient(135deg, #849be4, #5876d1);">
                                <i class="bi bi-wallet2 fs-1 mb-3"></i>
                                <div class="fs-5">Total Fees Collection</div>
                                <h2 class="fw-bold mt-2">₹<%= p.totalfee() %></h2>
                            </div>
                        </div>
                    </div>

                    <!-- Bar Chart -->
                    <%

                        int courseMap = p.getCourseCounts();

                        int computer = courseMap.getOrDefault("computer", 0);
                        int civil = courseMap.getOrDefault("civil", 0);
                        int mechanical = courseMap.getOrDefault("mechanical", 0);
                        int electrical = courseMap.getOrDefault("electrical", 0);
                        int electronics = courseMap.getOrDefault("electronics", 0);

                        int max = Math.max(1, Math.max(Math.max(Math.max(computer, civil), mechanical), Math.max(electrical, electronics)));
                    %>

                    <h5 class="mb-4 text-center">📊 Total Student of 2025</h5>
                    <div class="d-flex justify-content-center align-items-end">
                        <div class="bar-column">
                            <div class="bar" style="height: <%= computer * 100 / max %>% ; background-color: #ff4fa6;"><%= computer %></div>
                            <div class="bar-label">CO</div>
                        </div>
                        <div class="bar-column">
                            <div class="bar" style="height: <%= civil * 100 / max %>% ; background-color: #ff9ff3;"><%= civil %></div>
                            <div class="bar-label">CE</div>
                        </div>
                        <div class="bar-column">
                            <div class="bar" style="height: <%= mechanical * 100 / max %>% ; background-color: #48dbfb;"><%= mechanical %></div>
                            <div class="bar-label">ME</div>
                        </div>
                        <div class="bar-column">
                            <div class="bar" style="height: <%= electrical * 100 / max %>% ; background-color: #ffa07a;"><%= electrical %></div>
                            <div class="bar-label">EE</div>
                        </div>
                        <div class="bar-column">
                            <div class="bar" style="height: <%= electronics * 100 / max %>% ; background-color: #a29bfe;"><%= electronics %></div>
                            <div class="bar-label">EJ</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    const toggleBtn = document.getElementById('toggleSidebarBtn');
    const sidebar = document.getElementById('sidebar');

    toggleBtn.addEventListener('click', () => {
        sidebar.classList.toggle('collapsed');
    });
</script>


</body>
</html>
