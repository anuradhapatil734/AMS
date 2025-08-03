<%--
  Created by IntelliJ IDEA.
  User: patil
  Date: 18-07-2025
  Time: 10:22 am
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Registration</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        body {
            margin: 0;
            background-color: #150050;
            font-family: Arial, sans-serif;
        }

        h1 {
            text-align: center;
            color: white;
            padding: 20px 0;
        }

        .main-box {
            background-color: white;
            border-radius: 12px;
            box-shadow: 0 0 20px rgba(0,0,0,0.3);
            padding: 30px;
            max-width: 1100px;
            margin: 20px auto;
        }

        .image-box {
            background-color: #D9D9D9;
            padding: 15px;
            border-radius: 10px;
        }

        .image-box img {
            width: 100%;
            border-radius: 10px;
        }

        h4 {
            color: red;
            margin-top: 20px;
        }
    </style>
</head>
<body >

<div class="d-flex justify-content-center align-items-center pt-4">
    <img src="image/vvit.png" alt="VVIT Logo" class="img-thumbnail" width="80" height="80" style="margin-right:15px;">
    <h1 style="color:white; margin:0;">VIDYAVARDHINI INSTITUTE OF TECHNOLOGY, PAL</h1>
</div>

<div class="container mt-4" background-color: white;>

    <div class="main-box">

        <div class="row" >
            <!-- Left Form Section -->
            <div class="col-md-6">
                <form  action= "Registration_insert" method="post">
                    <h4 style="color:red;">Student Information</h4>
                    <div class="row mb-3" >
                        <div class="col-sm-4"><input type="text" class="form-control" placeholder="First Name" id="first" name="first"></div>
                        <div class="col-sm-4"><input type="text" class="form-control" placeholder="Middle Name" id="middle" name="middle"></div>
                        <div class="col-sm-4"><input type="text" class="form-control" placeholder="Last Name" id="last" name="last"></div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-sm-8"><input type="date" class="form-control" id="dob" name="dob"></div>
                        <div class="col-sm-4">
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

                    <h4 style="color:red;">Address</h4>
                    <div class="row">
                        <div class="col-sm-12 p-3">
                            <div class="form-group">
                                <textarea class="form-control" id="add" placeholder="Street Address" name="add"></textarea>

                            </div>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-sm-6"><input type="text" class="form-control" placeholder="City" name="city"></div>
                        <div class="col-sm-6"><input type="text" class="form-control" placeholder="State" name="state"></div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-sm-6"><input type="text" class="form-control" placeholder="Country" name="country"></div>
                        <div class="col-sm-6"><input type="text" class="form-control" placeholder="ZIP Code" name="zip"></div>
                    </div>

                    <h4 style="color:red;">Contact Information</h4>
                    <div class="row mb-3">
                        <div class="col-sm-6"><input type="email" class="form-control" placeholder="Email" name="email"></div>
                        <div class="col-sm-6"><input type="number" class="form-control" placeholder="Phone Number" name="phone"></div>
                    </div>

                    <h4 style="color:red;">Course & Fees</h4>
                    <div class="mb-3">
                        <select class="form-select" name="course" id="course" onchange="setFees()" required>
                            <option disabled selected value="">Select Course</option>
                            <option value="Computer">Computer</option>
                            <option value="Civil">Civil</option>
                            <option value="Electrical">Electrical</option>
                            <option value="Electronics">Electronics</option>
                            <option value="Mechanical">Mechanical</option>
                        </select>
                    </div>

                    <div class="mb-3">
                        <input type="text" class="form-control" id="fees" name="fees" placeholder="Course Fees"  />
                    </div>

                    <script>
                        function setFees() {
                            const course = document.getElementById("course").value;
                            const feesField = document.getElementById("fees");
                            let fees = 0;

                            switch(course) {
                                case 'Computer': fees = 30000; break;
                                case 'Civil': fees = 28000; break;
                                case 'Electrical': fees = 27000; break;
                                case 'Electronics': fees = 29000; break;
                                case 'Mechanical': fees = 31000; break;
                            }

                            feesField.value = fees;
                        }
                    </script>
                        <div class="row">
                            <div class="col-md-sm">
                                <h4  class=" text-danger mb-3"> <label>Today Date:</label></h4>
                                <input type="date" name="reg_date"  class=" form-control" name="date" id="date">
                            </div>
                        </div><br><br>

                    <div class="d-flex gap-3">
                        <button type="submit" class="btn btn-outline-primary">Submit</button>
                        <button type="reset" class="btn btn-outline-secondary">Reset</button>
                        <a href="Login.jsp" class="btn btn-outline-dark">Admin Login</a>
                    </div>
                </form>
            </div>

            <!-- Right Image Section -->
            <div class="col-md-6 d-flex align-items-center">
                <div class="image-box w-100">

                    <img src="image/student.png" alt="Student Image" style="width: 400px; height: 600px;">

                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>