<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<jsp:useBean id="sReg" scope="request" type="com.Unicar.regServlet" />
<html>
<head>
    <title>Welcome Page</title>
</head>
<body>
    <h1>Successfully registered!</h1>
    <h1>Welcome, <%= request.getParameter("name") %>!</h1>
    <h1>Your ID is, <%= request.getParameter("id") %>!</h1>
    <h1>Your email is, <%= request.getParameter("email") %>!</h1>
    <h1>Your phone number is, <%= request.getParameter("phoneNum") %>!</h1>
</body>
</html>