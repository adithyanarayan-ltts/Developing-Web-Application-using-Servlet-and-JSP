<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Verification</title>
<link rel="stylesheet" href="main.css">
</head>
<body>
<div style="text-align:center">
<form action="./InsertMemberController" method="post">
            <input type="text" name="authcode" >
            <button class="button" type="submit">Verify</button>
        </form><br><br>
Didn't get the code? <a href = "register.html"> Click here to retry </a>
</div>
</body>
</html>