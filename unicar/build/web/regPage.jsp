<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<sql:setDataSource var="myDatasource"
                   driver="org.apache.derby.jdbc.ClientDriver"
                   url="jdbc:derby://localhost:1527/unicarDB" user="afif" password="123"/>


<!DOCTYPE html>
<html>
    <head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="styles.css">
  <div class="navbar">
  <a href="login.jsp"><img src="asset/home.png" class="navIcons" alt="home" ></a> 
  <a href="bookingPage.jsp"><img src="asset/sports-car.png" class="navIcons" alt="car"></a> 
  <a href="#"><img src="asset/location.png" class="navIcons" alt="location" ></a>
  <a href="#"><img src="asset/info-button.png" class="navIcons" alt="info" ></a> 
  <!-- <div  class="headerTitle">UniCar</div> -->
  <a href="login.jsp"><img src="asset/login.png" class="navIcons"></a>
</div>
  <title>Registration</title>
</head>
<body>
  <div class="container">
    <div style="padding-top: 25%;padding-bottom: 50%">
        <img src="asset/logoCropped.png" alt="Car">
    <h1>UniCar E-Hailing</h1>
    <h1>Registration Form</h1>
    
    <c:set var="passID" value="${param.passID}"/> 
    <c:set var="passName" value="${param.passName}"/> 
    <c:set var="passEmail" value="${param.passEmail}"/> 
    <c:set var="passPhoneNum" value="${param.passPhoneNum}"/> 
    <c:set var="passPassword" value="${param.passPassword}"/> 
    
    <c:if test="${(passID!=null)&&(passName!=null)&&(passEmail!=null)&&(passPhoneNum!=null)&&(passPassword!=null)}" var="result">
        <sql:update var="result" dataSource="${myDatasource}">
            INSERT INTO PASSENGER
            VALUES (?,?,?,?,?)
            
            <sql:param value="${passID}"/> 
            <sql:param value="${passName}"/> 
            <sql:param value="${passEmail}"/> 
            <sql:param value="${passPhoneNum}"/> 
            <sql:param value="${passPassword}"/>  
        </sql:update>
    </c:if>
    
    <form action="register" method="post">
        <label for="fname" >Enter your student ID:</label>
        <div style="padding:10px;"><input style="height: 25px" type="text" name="passID" placeholder="ID"></div>
        <label for="fname" >Enter your name :</label>
        <div style="padding:10px;"><input style="height: 25px" type="text" name="passName" placeholder="Name"></div>
        <label for="fname" >Enter your email:</label>
        <div style="padding:10px;"><input style="height: 25px" type="text" name="passEmail" placeholder="Email"></div>
         <label for="fname" >Enter your phone number:</label>
        <div style="padding:10px;"><input style="height: 25px" type="text" name="passPhoneNum" placeholder="Phone Number"></div>
         <label for="fname" >Enter password:</label>
        <div style="padding:10px;"> <input style="height: 25px" type="password" name="passPassword" placeholder="Password"></div>
      <button type="submit">Register</button>
    </form>
</diV>
</body>
</html>
