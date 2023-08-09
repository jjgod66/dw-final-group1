<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>CodePen - Simple Profile Card</title>
	<style type="text/css">

body {
    background: rgb(255,154,158);
    background: linear-gradient(13deg, rgba(255,154,158,1) 0%, rgba(250,208,196,1) 100%);
}

main {
    width: 340px;
    overflow: hidden;
    background-color: #f1f1f1;
    font-size: 16px;
    line-height: 22px;
    color: #000;
    border-radius: 7px;
    box-shadow: -5px -5px 25px rgba(0, 0, 0, 0.705);
    margin: 50px auto;
    animation-name: rotate;
    animation-duration: 1.5s;
    animation-fill-mode: both;
}

.top-card {
    width: 100%;
    /* height: 200px; */
}

.top-card img {
    width: 100%;
}


.top-card .menu-icon .menu {
    position: relative;
    display: block;
    width: 100%;
    height: 4px;
    background-color: #000;
    margin-bottom: 6px;
    opacity: .5;
    transition: .4s;
}


.top-card .menu-icon:hover .menu {
    left: 0;
    border-radius: 1px;
}


h1 {
    font-size: 20px;
    color: #000;
    font-weight: 600;
    margin: 12px 0;
    border-bottom: 4px solid rgba(1, 106, 175, 0.603);
    width: 10%;
}

.middle-card, footer {
    margin: 5px 25px;
}

.middle-card {
    text-align: justify;
}




/* ANIMATION */
@keyframes rotate {
    0% {
        transform-origin: left bottom;
        transform: rotate3d(0, 0, 1, 45deg);
        opacity: 0;
    }
    100% {
        transform-origin: left bottom;
        transform: none;
        opacity: 1;
    }
}
	
	</style>
</head>
<!-- partial:index.partial.html -->
<body>
  <main>
    <section class="top-card">
      <img src="https://raw.githubusercontent.com/Jean-carje/Profile-card-Practice/master/Profile-card/img/user.jpg" alt="user picture">
    </section>

    <section class="middle-card">
      <h1>asdasd어바웃 </h1>
      <p>설명입니다.설명입니다.설명입니다.설명입니다.설명입니다.설명입니다.설명입니다.설명입니다.설명입니다.설명입니다.</p>
    </section>

  </main>
</body>
<!-- partial -->
  
</body>
</html>
    