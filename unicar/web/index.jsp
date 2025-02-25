<%@page import="com.UniCar.dao.LoginDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    String username = (String)session.getAttribute("session_username");//get attributes from session
    String userid = (String)session.getAttribute("session_userid");
    String role = (String)session.getAttribute("session_role");
    if (userid == null) { //if null (user not login) redirect to login page
    request.setAttribute("errMessage", "You have not login");
    out.println( "<script> location.href='./Login.jsp'; </script>");
    }
    if(role==null)role="Admin";
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>UniCar</title>
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
    </head>
    <body style="background-color: red;
          background-image: url('asset/backgroundred.jpg');
          background-repeat: no-repeat;
          background-attachment: fixed;
          background-position: center;
          background-size: cover">
        <h1></h1>
        
        <% if(role.equals("Passenger")){%>
        <jsp:include page="WEB-INF/jspf/navBarPassenger.jspf"/>
        <%}else if (role.equals("Driver")){%>
        <jsp:include page="WEB-INF/jspf/navBarDriver.jspf"/>
        <%}else{%>
        <jsp:include page="WEB-INF/jspf/navBar.jspf"/>
        <%}%>
        
        <div class="container-fluid p-5 text-center"><h1> Unicar System</h1></div>
        
        <div class="container-fluid col-md-6 p-5 text-center bg-body-tertiary">
            <h2>Welcome <%=role %></h2>
            <h3><span style="color:red"><%=username %></span></h3>
        </div>
        
        <jsp:include page="WEB-INF/jspf/footer.jspf"/>
        
    </body>
</html>
