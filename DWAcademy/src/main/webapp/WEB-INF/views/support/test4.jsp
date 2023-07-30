<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>CodePen - Neumorphism Search Bar</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/finder.css">
</head>
<body>
<!-- partial:index.partial.html -->
    <div class="finder">
      <div class="finder__outer">
        <div class="finder__inner">
          <div class="finder__icon" ref="icon"></div>
          <input class="finder__input" type="text" name="q" />
        </div>
      </div>
    </div>
<!-- partial -->
<script src="<%=request.getContextPath()%>/resources/js/finder.js"></script>

</body>
</html>
    