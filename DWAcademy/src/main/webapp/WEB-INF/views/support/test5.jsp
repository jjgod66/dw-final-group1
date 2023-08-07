<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="styles.css">
<title>Parallax Scroll Example</title>
<style>

.parallax-container {
  position: relative;
  overflow: hidden;
}

.parallax-box {
  text-align:center;
  width: 100%;
  height: 100%;
  background-image: url('background-image.jpg'); /* 원하는 이미지로 변경 */
  background-size: cover;
  background-position: center;
  transform: translate(-100%, 0);
   transition: transform 1s cubic-bezier(0.2, 0.2, 0.2, 0.8), opacity 2s ease-in-out;
  opacity: 0; /* 초기에는 보이지 않도록 설정 */
}

.content-box {
  padding: 20px;
  background-color: rgba(255, 255, 255, 0.9);
  width: 70%;
  margin: 100px auto;
  border-radius: 10px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
}

</style>
</head>
<body>
<p>asd</p>
<p>asd</p>
<p>asd</p>
<p>asd</p>
<p>asd</p>
<p>asd</p>
<p>asd</p>
<p>asd</p>
<p>asd</p>
<p>asd</p>
<p>asd</p>
<p>asd</p>
<p>asd</p>
<p>asd</p>
<p>asd</p>
<p>asd</p>
<p>asd</p>
<p>asd</p>
<p>asd</p>
<p>asd</p>
<div class="parallax-container">
  <div class="content-box">
    <p>tj설명 tj설명 tj설명 tj설명 tj설명 tj설명 tj설명 tj설명 tj설명 tj설명 </p>
  </div>
    <div class="content-box">
    <p>tj설명 tj설명 tj설명 tj설명 tj설명 tj설명 tj설명 tj설명 tj설명 tj설명 </p>
  </div>
  <div class="parallax-box">
    <h1>W나타나는것 나타나는것 나타나는것 나타나는것 </h1>
  </div>
</div>
<div class="parallax-container">
  <div class="parallax-box">
    <h1>나타나는것 나타나는것 나타나는것 나타나는것 </h1>
  </div>
  <div class="content-box">
    <p>tj설명 tj설명 tj설명 tj설명 tj설명 tj설명 tj설명 tj설명 tj설명 tj설명 </p>
  </div>
    <div class="content-box">
    <p>tj설명 tj설명 tj설명 tj설명 tj설명 tj설명 tj설명 tj설명 tj설명 tj설명 </p>
  </div>
</div>
<p>asd</p>
<p>asd</p>
<p>asd</p>
<p>asd</p>
<p>asd</p>
<script>
const parallaxBoxes = document.querySelectorAll('.parallax-box');
const scrollThreshold = window.innerHeight / 2; // 화면 절반 높이만큼 스크롤 시 나타나게 설정

window.addEventListener('scroll', () => {
  parallaxBoxes.forEach((box) => {
    const boxTop = box.getBoundingClientRect().top;
    if (boxTop < scrollThreshold) {
      box.style.transform = 'translate(0)';
      box.style.opacity = 1;
    } else {
      box.style.transform = 'translate(-100%, 0)';
      box.style.opacity = 0;
    }
  });
});
</script>
</body>
</html>
