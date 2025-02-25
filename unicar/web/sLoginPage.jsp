<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <link href="styles.css" rel="stylesheet" type="text/css">
  <title>Login</title>

</head>
<body>
  <div class="container">
    <div style="padding-top: 50%;padding-bottom: 50%">
    <h1>SUCCESSFULLY LOGIN</h1>
    <h1><%= request.getParameter("username") %></h1>
  </div>
</div>
</body>

</html>