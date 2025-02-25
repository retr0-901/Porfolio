<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>UniCar</title>
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
        
        <script>
            function validate() {
                var username = document.form.username.value;
                var passpassword = document.form.passpassword.value;
                if (username===null || username==="") {
                    alert("Please enter username");
                    return false;
                } else if(passpassword===null || passpassword==="") {
                    alert("Please enter password");
                    return false;
                }
            }
        </script>
    </head>
    <body style="background-color: red;
          //background-image: url('asset/blue_background.jpg');
          background-repeat: no-repeat;
          background-attachment: fixed;
          background-position: center;
          background-size: cover">
        <div class="container col-md-6 p-5 bg-body-tertiary" style="position:absolute; left:50%; top:50%; transform:translate(-50%, -50%);">
            <div style="text-align:center"><h1>UniCar System</h1></div>
            <center><img src="asset/logoCropped.png" style="width: 30%"></center>
            <!--<div style="text-align:center"><h3>Login</h3></div>-->
            <br>
            <div class="container col-md-6">
                <form class="row g-3" name="form" action="LoginServlet" method ="post" onsubmit="return validate()">
                    <div class="col-12">
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="login_role" value="Admin" checked>
                            <label class="form-check-label" for="login_role">
                                Admin
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="login_role" value="Passenger">
                            <label class="form-check-label" for="login_role">
                                Passenger
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="login_role" value="Driver">
                            <label class="form-check-label" for="login_role">
                                Driver
                            </label>
                        </div>
                    </div>
                    <div class="col-12">
                      <label for="username" class="form-label">Username</label>
                      <input type="text" class="form-control" name="username" placeholder="Enter username">
                    </div>
                    <div class="col-12">
                      <label for="password" class="form-label">Password</label>
                      <input type="password" class="form-control" name="passpassword" placeholder="Enter password">
                    </div>
                    <div class="col-12 text-center">
                      <button type="submit" class="btn btn-outline-secondary col-5">Login</button>
                      <button type="reset" class="btn btn-outline-secondary col-5">Reset</button>
                    </div>
                    <div>Dont have an account?</div>
                      <a href="regPage.jsp">Sign up here</a>
                </form>
                <div class="pt-1">
                <span style="color:red;text-align:center">
                    <div center-text-align><%=(request.getAttribute("errMessage") == null) ? "" : request.getAttribute("errMessage")%></div>
                </span>
                </div>
            </div>
        </div>
    </body>
</html>