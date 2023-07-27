<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	@import url("https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap");

:root {
  --primary-color: #185ee0;
  --secondary-color: #e6eef9;
}

*,
*:after,
*:before {
  box-sizing: border-box;
}

body {
  font-family: "Inter", sans-serif;
  background-color: rgba(#e6eef9, 0.5);
}
.container1 {
  position: absolute;
  left: 0;
  top: 0;
  right: 0;
  bottom: 0;
  display: flex;
  align-items: center;
  justify-content: center;
}
.container2 {
  position: absolute;
  left: 0;
  top: 200px;
  right: 0;
  bottom: 0;
  display: flex;
  align-items: center;
  justify-content: center;
}
.tabs {
  display: flex;
  position: relative;
  background-color: #fff;
  box-shadow: 0 0 1px 0 rgba(#185ee0, 0.15), 0 6px 12px 0 rgba(#185ee0, 0.15);
  padding: 0.75rem;
  border-radius: 99px; 
}
.tabs * {
  z-index: 2;
}
input[type="radio"] {
  display: none;
}

.tab {
  display: flex;
  align-items: center;
  justify-content: center;
  height: 54px;
  width: 160px;
  font-weight: 500;
  border-radius: 99px; 
  cursor: pointer;
  transition: color 0.15s ease-in;
}

.notification {
  display: flex;
  align-items: center;
  justify-content: center;
  width: 2rem;
  height: 2rem;
  margin-left: 0.75rem;
  border-radius: 50%;
  background-color: var(--secondary-color);
  transition: 0.15s ease-in;
}
input[type="radio"]:checked + label {
  color: var(--primary-color);
}

input[type="radio"]:checked + label > .notification {
  background-color: var(--primary-color);
  color: #fff;
}

input[id="radio-1"]:checked ~ .glider {
  transform: translateX(0);
}

input[id="radio-2"]:checked ~ .glider {
  transform: translateX(100%);
}

input[id="radio-3"]:checked ~ .glider {
  transform: translateX(200%);
}

input[id="radio-4"]:checked ~ .glider {
  transform: translateX(300%);
}
input[id="radio-5"]:checked ~ .glider {
  transform: translateX(400%);
}
.glider {
  position: absolute;
  display: flex;
  height: 54px;
  width: 160px;
  background-color: var(--secondary-color);
  z-index: 1;
  border-radius: 99px; 
  transition: 0.25s ease-out;
}

@media (max-width: 700px) {
  .tabs {
    transform: scale(0.6);
  }
}
</style>
</head>
<body>
<div class="container1">
	<div class="tabs">
		<input type="radio" id="radio-1" name="tabs" checked="">
		<label class="tab" for="radio-1">Upcoming<span class="notification">2</span></label>
		<input type="radio" id="radio-2" name="tabs">
		<label class="tab" for="radio-2">Development<span class="notification">9</span></label>
		<input type="radio" id="radio-3" name="tabs">
		<label class="tab" for="radio-3">Completed<span class="notification">10</span></label>
		<input type="radio" id="radio-4" name="tabs">
		<label class="tab" for="radio-4">전체보기<span class="notification">26</span></label>
		<input type="radio" id="radio-1" name="tabs" >
		<span class="glider"></span>
	</div>
</div>
</body>
</html>