<%-- Created by IntelliJ IDEA. User: patil Date: 24-07-2025 --%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Student Registration</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">


    <style>
        body {
            background-color: #f0f0f0;
            font-family: 'Segoe UI', sans-serif;
        }
        h1 {
            text-align: center;
            color: white;
            padding: 20px 0;
        }
        .btn-outline-primary {
            color: white;
            border-color: white;
        }
        .sidebar {
            min-height: 100vh;
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
            max-width: 1100px;
            margin: 20px auto;
        }
        h5 {
            color: red;
            margin-top: 20px;
        }
        .compose-btn {
            background-color: #dc3545;
            color: #fff;
            font-weight: bold;
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
            <div class="row bg-white mb-3 rounded align-items-center">
                <div class="col-sm mt-2">
                   <span class=" sidebar-label"> <img src="image/vvit.png" alt="VVIT Logo" class="img-fluid mb-2 rounded-circle img3"></span>
                </div>
                <div class="col-sm">
                    <h3 class="text-primary fw-bold mt-3">VVIT</h3>
                </div>
            </div>


            <ul class="nav nav-pills flex-column mb-auto px-1"  id="navList">
                <li class="mb-3"><a href="welcome.jsp" class="btn btn-outline-primary w-100 "><i class="bi bi-house me-2"></i> <span class="sidebar-label">Dashboard</span></a></li>
                <li class="mb-3"><a href="AddStudent.jsp" class="btn btn-outline-primary w-100"><i class="bi bi-bar-chart me-2"></i><span class="sidebar-label"> Add Student</span></a></li>
                <li class="mb-3"><a href="StudentList.jsp" class="btn btn-outline-primary w-100"><i class="bi bi-people me-2"></i><span class="sidebar-label"> Student List</span></a></li>
                <li class="mb-3"><a href="fees.jsp" class="btn btn-outline-primary w-100"><i class="bi bi-cash me-2"></i><span class="sidebar-label"> Fees</span></a></li>
                <li class="mb-3"><a href="report.jsp" class="btn btn-outline-primary w-100"><i class="bi bi-file-earmark-text me-2"></i><span class="sidebar-label"> Reports</span></a></li>
                <li class="mb-3"><a href="email.jsp" class="btn btn-outline-primary w-100 active"><i class="bi bi-envelope-fill me-2"></i><span class="sidebar-label">Email</span></a></li>
            </ul>


            <div class="mt-auto">
                <a href="Registration.jsp" class="btn btn-outline-primary w-100">
                    <span class="sidebar-label"> <i class="bi bi-box-arrow-right me-2"></i> Logout</span>
                </a>
            </div>
        </div>

        <!-- Main Content -->
        <div class="col-md-10 main-content">
            <!-- Topbar -->
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
                <h3 style="color: black" class="fw-bold">Email</h3>
            </div>

            <!-- Compose Section -->
            <div class="main-box">
                <div class="row">
                    <!-- Mail Sidebar -->
                    <div class="col-md-3 sidebar p-3 bg-white text-dark">
                        <h5 class="mb-3">Mail Menu</h5>
                        <ul class="list-group">
                            <li class="list-group-item">
                                <a href="SendMail.jsp" class="text-decoration-none text-dark">Send</a>
                            </li>
                        </ul>

                    </div>


                    <!-- Mail Composer -->
                    <div class="col-md-9 p-4">
                        <div class="card">
                            <div class="card-header d-flex justify-content-between">
                                <h5 class="text-danger"><i class="bi bi-envelope-fill me-2"></i> Compose Mail</h5>
                            </div>

                            <form method="post" action="email_insert" >
                                <div class="card-body">
                                    <div class="mb-3">
                                        <label class="form-label">To:</label>
                                        <input type="email" name="to" class="form-control" id="to" placeholder="recipient@example.com" >
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label">Subject:</label>
                                        <input type="text" name="subject" class="form-control" id="subject" placeholder="Enter subject here" >
                                    </div>


                                    <div class="mb-3">
                                        <label  class="form-label">Message:</label>
                                        <textarea name="message" id="message" class="form-control" rows="5" placeholder="Type your message here..."  ></textarea>
                                    </div>

                                    <div class="d-flex gap-2">
                                        <button type="submit" class="btn btn-success">Send</button>
                                        <button type="reset" class="btn btn-primary">Discard</button>
                                        <button type="button" class="btn btn-secondary">Draft</button>
                                    </div>
                                </div>
                            </form>
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
