<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>Slide Form</title>
  <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css'>
<style>
body{
  background: #4d4d4d;
  margin:0;
}

.bold{
  font-family: 'Montserrat', sans-serif;
  font-weight:700;
  font-size:25px;
}

.normal{
  font-family: 'Darker Grotesque', sans-serif;
  font-weight:500;
  font-size:17px;
}

@keyframes moving{
  0%{width:400px;transform:translate(0px);}
  50%{width:550px;transform:translate(200px);}
  100%{width:400px;transform:translate(500px);}
}

@keyframes start{
  0%{width:400px;transform:translate(500px);}
  50%{width:550px;transform:translate(200px);}
  100%{width:400px;transform:translate(0px);}
}

@keyframes startForm{
  0%{width:500px;transform:translate(0px);}
  50%{width:650px;transform:translate(200px);}
  100%{width:500px;transform:translate(400px);}
}

@keyframes movingForm{
  0%{width:500px;transform:translate(400px);}
  50%{width:650px;transform:translate(200px);}
  100%{width:500px;transform:translate(0px);}
}


h4{
  font-size:22px;
}

.container{
  height:450px;
  width:900px;
  position:absolute;
  top:50%;
  left:50%;
  transform:translate(-50%, -50%);
}

.text{
  width:60%;
  line-height:20px;
  margin:0 auto;
}



.form{
  text-align:center;
  position:absolute;
  height:100%;
  transform:translate(400px);
  width:500px;
  background-color:#fff;
  border-radius:0px 10px 10px 0px;
}

input{
  border:0px;
  border-bottom:1px solid lightgray;
  margin-bottom:15px;
  padding: 8px 5px;
  width:60%;
}

.b-button{
  background-color:#079992;
  clor:white;
  padding:12px 60px;
  color:#fff;
  font-size:14px;
  border-radius:25px;
  cursor: pointer;
}

	
</style>
</head>
<body>

<div class="container">
  <div class="form">
    <h4 class="bold title">Create Account</h4>
    <input type="text" placeholder="Name" class="normal name">
    <input type="text" placeholder="Email" class="normal">
    <br/>
    <input type="password" placeholder="Password" class="normal"><br>
    <button class="b-button normal">SIGN UP</button>
  </div>
</div>

</body>
</html>