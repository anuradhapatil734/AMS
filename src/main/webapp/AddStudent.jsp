<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Dashboard - VVIT</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">

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
            <div class="row bg-white mb-3 rounded align-items-center ">
                <div class="col-sm mt-2">
                    <span class="sidebar-label"><img src="image/vvit.png" alt="VVIT Logo" class="img-fluid  rounded-circle img3"></span>
                </div>
                <div class="col-sm">
                      <h3 class="text-primary fw-bold mt-0">VVIT</h3>
                </div>
            </div>

            <ul class="nav nav-pills flex-column mb-auto px-1"  id="navList">
                <li class="mb-3"><a href="welcome.jsp" class="btn btn-outline-primary w-100 "><i class="bi bi-house me-2"></i> <span class="sidebar-label">Dashboard</span></a></li>
                <li class="mb-3"><a href="AddStudent.jsp" class="btn btn-outline-primary w-100 active"><i class="bi bi-bar-chart me-2"></i><span class="sidebar-label"> Add Student</span></a></li>
                <li class="mb-3"><a href="StudentList.jsp" class="btn btn-outline-primary w-100"><i class="bi bi-people me-2"></i><span class="sidebar-label"> Student List</span></a></li>
                <li class="mb-3"><a href="fees.jsp" class="btn btn-outline-primary w-100"><i class="bi bi-cash me-2"></i><span class="sidebar-label"> Fees</span></a></li>
                <li class="mb-3"><a href="report.jsp" class="btn btn-outline-primary w-100"><i class="bi bi-file-earmark-text me-2"></i><span class="sidebar-label"> Reports</span></a></li>
                <li class="mb-3"><a href="email.jsp" class="btn btn-outline-primary w-100"><i class="bi bi-envelope-fill me-2"></i><span class="sidebar-label">Email</span></a></li>
            </ul>


            <div class="mt-auto">
                <a href="Registration.jsp" class="btn btn-outline-primary w-100">
                    <i class="bi bi-box-arrow-right me-2"></i> <span class="sidebar-label"> Logout</span>
                </a>
            </div>
        </div>

        <!-- Main Content -->
        <div class="col-md-10 main-content ">
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

            <!-- Dashboard content -->
            <div class="d-flex justify-content-between align-items-center mt-4 px-3">
                <h3 style="color:black" class="fw-bold">Add Student</h3>
            </div>

            <div class="main-box">
                <div class="input-container">
                <form action="Registration_insert1" method="post">
                    <h5 class="text-danger">Student Information</h5>
                    <div class="row mb-3">
                        <div class="col-md-4"><input type="text" class="form-control" placeholder="First Name" name="first"></div>
                        <div class="col-md-4"><input type="text" class="form-control" placeholder="Middle Name" name="middle"></div>
                        <div class="col-md-4"><input type="text" class="form-control" placeholder="Last Name" name="last"></div>
                    </div>

                    <div class="row mb-3">
                        <div class="col-md-6"><input type="date" class="form-control" name="dob"></div>
                        <div class="col-md-6">
                            <select class="form-select" name="category">
                                <option disabled selected>Select Category</option>
                                <option>General</option>
                                <option>OBC</option>
                                <option>SC</option>
                                <option>ST</option>
                                <option>Other</option>
                            </select>
                        </div>
                    </div>

                    <h5 class="text-danger">Address</h5>
                    <div class="row mb-3">
                        <div class="col-12">
                            <textarea class="form-control" placeholder="Street Address" name="add"></textarea>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col-md-6"><input type="text" class="form-control" placeholder="City" name="city"></div>
                        <div class="col-md-6"><input type="text" class="form-control" placeholder="State" name="state"></div>
                    </div>

                    <div class="row mb-3">
                        <div class="col-md-6"><input type="text" class="form-control" placeholder="Country" name="country"></div>
                        <div class="col-md-6"><input type="text" class="form-control" placeholder="ZIP Code" name="zip"></div>
                    </div>

                    <h5 class="text-danger">Contact Information</h5>
                    <div class="row mb-3">
                        <div class="col-md-6"><input type="email" class="form-control" placeholder="Email" name="email"></div>
                        <div class="col-md-6"><input type="number" class="form-control" placeholder="Phone Number" name="phone"></div>
                    </div>

                    <h5 class="text-danger ">Course & Fees</h5>

                    <div class="row mb-3">
                        <div class="col-md-6">
                            <select class="form-select" name="course" id="course" onchange="setFees()" required>
                                <option disabled selected value="">Select Course</option>
                                <option value="Computer">Computer</option>
                                <option value="Civil">Civil</option>
                                <option value="Electrical">Electrical</option>
                                <option value="Electronics">Electronics</option>
                                <option value="Mechanical">Mechanical</option>
                            </select>
                        </div>
                            <br>
                        <div class="col-md-6">
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

                    <h5 class=" text-danger mb-3"> <label>Today Date:</label></h5>
                    <input type="date" name="reg_date"  class=" form-control" name="date" id="date">

                        <br><br>
                    <div class="d-flex gap-3">
                        <button type="submit" class="btn btn-outline-success">Update</button>
                        <button type="reset" class="btn btn-outline-secondary">Reset</button>
                    </div>
                </form>
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
