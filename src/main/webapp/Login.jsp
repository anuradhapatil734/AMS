<%--
  Created by IntelliJ IDEA.
  User: patil
  Date: 18-07-2025
  Time: 11:19 am
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login - VVIT PAL</title>
    <link rel="stylesheet" href="style.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">


</head>
<style>
    body {
        margin: 0;
        font-family: Arial, sans-serif;
        background: linear-gradient(to bottom right, #1e4265, #0066cc);
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .container {
        display: flex;
        width: 800px;
        height: 500px;
        background-color: white;
        border-radius: 10px;
        overflow: hidden;
        box-shadow: 0 0 20px rgba(181, 171, 171, 0.164);
    }

    .circle {
        position: absolute;
        border-radius: 50%;
        background: radial-gradient(circle, #004080, #3770ac);
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.3);
    }

    /* Customize each circle */

    .left {
        position: relative;
        /* Make this a positioning context */
        background: linear-gradient(to bottom, #f9fafa, #003366);
        color: white;
        flex: 1;
        padding: 40px;
        display: flex;
        flex-direction: column;
        justify-content: center;
        overflow: hidden;
        /* Prevent overflow of circles */
    }

    /* Update circles */
    .circle {
        position: absolute;
        border-radius: 50%;
        background: radial-gradient(circle, #004080,#073e79);
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.3);
        z-index: 1;
    }

    /* Circle 1 - Top Left */
    .circle2 {
        width: 400px;
        height: 400px;
        margin-top: -250px;
        margin-left: -80px;
        z-index: 0;
    }

    /* Circle 2 - Bottom Right */
    .circle3 {
        width: 270px;
        height: 270px;
        margin-bottom: -240px;
        margin-left: -130px;
    }


    .circle5 {
        width: 200px;
        height: 200px;
        margin-bottom: -70px;
        right: 20px;
    }


    .left {
        background: linear-gradient(to bottom, #f6f6f8, #f6f6f8);
        color: white;
        flex: 1;
        padding: 40px;
        display: flex;
        flex-direction: column;
        justify-content: center;
    }

    .left h1 {
        font-size: 32px;
        margin: 0;
        font-weight: bold;
    }

    .left h1 span {
        font-size: 16px;
    }

    .right {
        flex: 1;
        padding: 40px;
        position: relative;
    }

    .login-btn:hover {
        background-color: #499ff6;
    }

    .logo {
        width: 40px;
        position: absolute;
        margin-top: 15px;
        margin-left: -40px;
    }

    .admin-title {
        color: red;
        font-size: 24px;
        font-weight: bold;
        margin-bottom: 30px;
    }

    form label {
        display: block;
        margin-bottom: 5px;
        font-weight: bold;
    }

    .input-box {
        display: flex;
        align-items: center;
        border: 1px solid #ccc;
        border-radius: 6px;
        margin-bottom: 20px;
        padding: 10px;
    }

    .input-box .icon {
        margin-right: 10px;
    }

    .input-box input {
        border: none;
        outline: none;
        flex: 1;
        font-size: 14px;
    }

    button {
        background-color: #1c75bc;
        color: white;
        padding: 10px 20px;
        border: none;
        font-weight: bold;
        border-radius: 5px;
        cursor: pointer;
    }
    .man{
        margin-left: 80px;
        margin-top: -200px;
        z-index: 5;
        height: auto;
        width: auto;

    }
</style>
</head>

<body>
<div class="container">
    <div class="left">
        <!-- <div class=" position-absolute p-5 rounded-3"><span>z-3</span></div> -->
        <div class="z-3 text-center man">
            <h1>
                WELCOME
            </h1>
            <h3>
                <p  class="blockquote-footer">TO VVIT,PAL</p>
            </h3>
        </div>

        <div class="circle circle2 z-0"></div>
        <div class="circle circle3 z-0"></div>
        <div class="circle circle5 z-0"></div>



    </div>
    <div class="right">

        <img src="image/vvit.png" class="logo " alt="VVIT Logo">
        <h2 class="admin-title">Admin login</h2>
        <form action="Login_insert" method="post">
            <label>User Name</label>
            <div class="input-box">
                <span class="icon"><i class="fa fa-user"></i></span>
                <input type="text" placeholder="Enter the Name"  name="name" required />
            </div>

            <label>Password</label>
            <div class="input-box">
                <span class="icon"><i class="fa fa-lock"></i></span>
                <input type="password" placeholder="Password" name="password" required />
            </div>

            <button type="submit" class="btn btn-outline-dark"> Login</button>
        </form>
    </div>
</div>
</body>

</html>


