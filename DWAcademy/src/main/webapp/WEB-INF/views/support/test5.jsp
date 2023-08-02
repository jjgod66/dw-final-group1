<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="javax.xml.parsers.DocumentBuilderFactory" %>
<%@ page import="javax.xml.parsers.DocumentBuilder" %>
<%@ page import="org.w3c.dom.Document" %>
<%@ page import="org.w3c.dom.NodeList" %>
<%@ page import="org.w3c.dom.Node" %>
<%@ page import="org.w3c.dom.Element" %>
<%@ page import="org.w3c.dom.Document" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/common/boxoffice.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<script src="<%=request.getContextPath()%>/resources/bootstrap-5.2.3-dist/js/bootstrap.bundle.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/common.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/moment.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/daterangepicker.js"></script>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@100&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@300&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/velocity/2.0.6/velocity.min.js"></script>
<style type="text/css">
#wrapper {margin-left:auto;margin-right:auto;width: 85%; margin-bottom: 100px;}
body{
  margin: 0;
  overflow: clip;
  background: #1B2021;
  font-family: 'DM Serif Display', serif;
  font-family: 'IBM Plex Sans KR', sans-serif;
  min-height: 2000px;
}
.ro {
    font-size: 5rem;
    color: #f8f9fa; 
    font-family: 'Niconne', cursive;
    font-weight: 700;
    text-shadow: 2px 4px 0px #d9480f , 12px 18px 4px #000000 ;
}
.ro1 {
	padding-top: 18px;
    padding-left: 10px;
    font-size: 4rem;
    color: #f8f9fa; 
    font-family: 'Niconne', cursive;
    font-weight: 700;
    text-shadow: 2px 4px 0px #d9480f,12px 18px 4px #000000 ;
}
#roo{margin-left: 15%;}
main{
  position: fixed;
  display: flex;
  top: 0;
  height: 100vh;
}

canvas{
  width: 100%;
  height: 100%;
  margin: auto;
}
#container{
  z-index: 2;
  position: fixed;
  top: 0;
  height: 100vh;
  width: 100%;
  justify-content: center;
  align-items: center;
}
    #navbar {
      width:30%;
      font-size:13px;
      color: #000000;
      display: flex;
      align-items: center;
      float: right;
      padding-top: 10px;
    }

    .right-menu a {
      padding-right:10px;
      color: #dee2e6;
      text-decoration: none;
    }
    .ro, .ro1 {
	  align-items: center;
	  float: left;
	}

    ul li{
		list-style: none;
	}
	a {
		text-decoration: none;
		color:#dee2e6;
	}
	#menu {
		padding-top:40px;
		padding-right:15%;
		height:50px;
		line-height: 50px; 
		margin:0 auto;
		text-align: center;
	}

	#menu > ul > li {
		float:right;
		width:85px;
		position:relative;
	}
    #menu > ul > li > ul {
    	padding: 0;
		width:100px;
		display:none;
		position: absolute;
		font-size:14px;
	}
    #menu > ul > li:hover > ul {
		display:block;
	}
    #menu > ul > li > ul > li:hover {
		opacity:0.7;
		transition: ease 0.5s;
		}
    
    main {
    /* position: fixed; */
    /* display: flex; */
    top: 0;
    height: 100vh;
}canvas {
    /* width: 100%; */
    /* height: 100%; */
    /* margin: auto; */
        width: 1920px;
    height: 133px;
}
</style>
</head>
<body>
<div id="container">
	<div id="wrapper">
		<div id="roo">
			<div class="ro">DW </div>
			<div class="ro1"> cinema</div>
		</div>
		
		<div id="navbar">
		    <div class="right-menu">
		      <a href="#">혜택</a>
		      <a href="#">고객센터</a>
		      <a href="#">로그인</a>
		      <a href="#">회원가입</a>
		    </div>
		</div>
		
		<div id="menu">
			<ul>
				<li><a href="#">이벤트</a>
					<ul>
						<li><a href="#">진행중인 이벤트</a></li>
						<li><a href="#">지난 이벤트</a></li>
					</ul>
				</li>
				<li><a href="#">스토어</a>
					<ul>
						<li><a href="#">기프트카드</a></li>
						<li><a href="#">팝콘/스낵/음료</a></li>
					</ul>
				</li>
				<li><a href="#">예매 </a>
				</li>
				<li><a href="#">극장</a>
				</li>
				<li><a href="#">영화</a>
					<ul>
						<li><a href="#">전체영화 </a></li>
						<li><a href="#">현재상영작 </a></li>
						<li><a href="#">상영예정작 </a></li>
						<li><a href="#">영화리뷰  </a></li>
						<li><a href="#">무비포스트 </a></li>
					</ul>
				</li>
			</ul>
		</div>
		
		
		
		
		
		
		
		
		
		
		
	</div>	
</div>
<script id="vertShader" type="text">

// attributes, in
attribute vec3 aPosition;

// matrices
uniform mat4 uModelViewMatrix;
uniform mat4 uProjectionMatrix;

void main() {
  gl_Position = uProjectionMatrix * uModelViewMatrix * vec4(aPosition, 1.0);
}
</script>

<script id="fragShader" type="text">
#ifdef GL_ES
precision highp float;
#endif

uniform float uTime;
uniform float uSpeedColor;
uniform vec2 uResolution;
  
uniform vec3 uColor1;
uniform vec3 uColor2;
uniform vec3 uColor3;
uniform vec3 uColor4;
uniform vec3 uColor5;

const int AMOUNT = 2;
const float scale = 2.0;

  
vec3 blendExclusion(vec3 base, vec3 blend) {
	return base+blend-2.0*base*blend;
}

vec3 blendExclusion(vec3 base, vec3 blend, float opacity) {
	return (blendExclusion(base, blend) * opacity + base * (1.0 - opacity));
}
  
float blendLighten(float base, float blend) {
	return max(blend,base);
}

vec3 blendLighten(vec3 base, vec3 blend) {
	return vec3(blendLighten(base.r,blend.r),blendLighten(base.g,blend.g),blendLighten(base.b,blend.b));
}

vec3 blendLighten(vec3 base, vec3 blend, float opacity) {
	return (blendLighten(base, blend) * opacity + base * (1.0 - opacity));
}
  
float blendDarken(float base, float blend) {
	return min(blend,base);
}

vec3 blendDarken(vec3 base, vec3 blend) {
	return vec3(blendDarken(base.r,blend.r),blendDarken(base.g,blend.g),blendDarken(base.b,blend.b));
}

vec3 blendDarken(vec3 base, vec3 blend, float opacity) {
	return (blendDarken(base, blend) * opacity + base * (1.0 - opacity));
}

float blendPinLight(float base, float blend) {
	return (blend<0.5)?blendDarken(base,(2.0*blend)):blendLighten(base,(2.0*(blend-0.5)));
}

vec3 blendPinLight(vec3 base, vec3 blend) {
	return vec3(blendPinLight(base.r,blend.r),blendPinLight(base.g,blend.g),blendPinLight(base.b,blend.b));
}

vec3 blendPinLight(vec3 base, vec3 blend, float opacity) {
	return (blendPinLight(base, blend) * opacity + base * (1.0 - opacity));
}
  
  
float blendOverlay(float base, float blend) {
	return base<0.5?(2.0*base*blend):(1.0-2.0*(1.0-base)*(1.0-blend));
}

vec3 blendOverlay(vec3 base, vec3 blend) {
	return vec3(blendOverlay(base.r,blend.r),blendOverlay(base.g,blend.g),blendOverlay(base.b,blend.b));
}

vec3 blendOverlay(vec3 base, vec3 blend, float opacity) {
	return (blendOverlay(base, blend) * opacity + base * (1.0 - opacity));
}

float blendLinearDodge(float base, float blend) {
	// Note : Same implementation as BlendAddf
	return min(base+blend,1.0);
}

vec3 blendLinearDodge(vec3 base, vec3 blend) {
	// Note : Same implementation as BlendAdd
	return min(base+blend,vec3(1.0));
}

vec3 blendLinearDodge(vec3 base, vec3 blend, float opacity) {
	return (blendLinearDodge(base, blend) * opacity + base * (1.0 - opacity));
}

  
float blendLinearBurn(float base, float blend) {
	// Note : Same implementation as BlendSubtractf
	return max(base+blend-1.0,0.0);
}

vec3 blendLinearBurn(vec3 base, vec3 blend) {
	// Note : Same implementation as BlendSubtract
	return max(base+blend-vec3(1.0),vec3(0.0));
}

vec3 blendLinearBurn(vec3 base, vec3 blend, float opacity) {
	return (blendLinearBurn(base, blend) * opacity + base * (1.0 - opacity));
}
  
float blendLinearLight(float base, float blend) {
	return blend<0.5?blendLinearBurn(base,(2.0*blend)):blendLinearDodge(base,(2.0*(blend-0.5)));
}

vec3 blendLinearLight(vec3 base, vec3 blend) {
	return vec3(blendLinearLight(base.r,blend.r),blendLinearLight(base.g,blend.g),blendLinearLight(base.b,blend.b));
}

vec3 blendLinearLight(vec3 base, vec3 blend, float opacity) {
	return (blendLinearLight(base, blend) * opacity + base * (1.0 - opacity));
}
  
  
float blendScreen(float base, float blend) {
	return 1.0-((1.0-base)*(1.0-blend));
}

vec3 blendScreen(vec3 base, vec3 blend) {
	return vec3(blendScreen(base.r,blend.r),blendScreen(base.g,blend.g),blendScreen(base.b,blend.b));
}

vec3 blendScreen(vec3 base, vec3 blend, float opacity) {
	return (blendScreen(base, blend) * opacity + base * (1.0 - opacity));
}

float rand(vec2 co){
    return fract(sin(dot(co, vec2(12.9898, 78.233))) * 43758.5453);
}
  
//lengths

float createLen() {
  float time = 10.0 + uTime / 1.0; 
  
  vec2 coord = scale * (gl_FragCoord.xy - uResolution.xy) / min(uResolution.y, uResolution.x);

  float len;
  for(int i = 0; i < AMOUNT; i++) {
    len = length(vec2(coord.x, coord.y));

    coord.x = coord.x + cos(coord.y - sin(len)) - cos(time / 9.1);
    coord.y = coord.y + sin(coord.y + cos(len)) + sin(time / 12.0);
  }
  
  return len;
}
  
float createLen2(float x,  float y, float speed, float offset) {
  float time = offset + uTime / speed; 
  
  vec2 coord =  scale * (gl_FragCoord.xy - uResolution.xy) / min(uResolution.y, uResolution.x);
  
  float len;
  
  for(int i = 0; i < AMOUNT; i++) {
    len = length(vec2(coord.x, coord.y));
    coord.x = coord.x + sin(coord.y + cos(len) * cos(len)) + sin(time / x);
    coord.y = coord.y - cos(coord.y + sin(len) * sin(len)) + cos(time / y);
  }
  
  return len;
}

float createLen3(float x,  float y, float speed, float offset) {
  float time = offset + uTime / speed; 
  
  vec2 coord = scale * (gl_FragCoord.xy - uResolution.xy) / min(uResolution.y, uResolution.x);

  float len;
  
  for(int i = 0; i < AMOUNT; i++) {
    len = length(vec2(coord.x, coord.y));
    
    //coord.x = coord.x - cos(coord.y + sin(len)) + cos(time / x);
    coord.y = coord.y + sin(coord.y + cos(len)) + sin(time / y);
  }
  
  return len;
}

float createLen4(float x,  float y, float speed, float offset) {
  float time = offset + uTime / speed; 
  
  vec2 coord = scale * (gl_FragCoord.xy - uResolution.xy) / min(uResolution.y, uResolution.x);

  float len;
  
  for(int i = 0; i < AMOUNT; i++) {
    len = length(vec2(coord.x, coord.y));
    
    coord.x = coord.x - cos(coord.y + sin(len)) + cos(time / x);
    //coord.y = coord.y + sin(coord.y + cos(len)) + sin(time / y);
  }
  
  return len;
}
  
vec3 createCircle(vec2 position, vec3 color, float size, float blur) {
  vec2 pos = (gl_FragCoord.xy - uResolution.xy) / min(uResolution.y, uResolution.x) - position;
  float circle = sqrt(pow(pos.x, 3.0) + pow(pos.y, 2.0));
  circle = smoothstep(size, size + blur, 1.0 - circle);
  return color * circle;
}
  
vec3 rgb2hsv(vec3 c)
{
    vec4 K = vec4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
    vec4 p = mix(vec4(c.bg, K.wz), vec4(c.gb, K.xy), step(c.b, c.g));
    vec4 q = mix(vec4(p.xyw, c.r), vec4(c.r, p.yzx), step(p.x, c.r));

    float d = q.x - min(q.w, q.y);
    float e = 1.0e-10;
    return vec3(abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
}

vec3 hsv2rgb(vec3 c)
{
    vec4 K = vec4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
    vec3 p = abs(fract(c.xxx + K.xyz) * 6.0 - K.www);
    return c.z * mix(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y);
}
  
void main() {
    vec2 coord = scale * (gl_FragCoord.xy - uResolution.xy) / min(uResolution.y, uResolution.x);

  float len = createLen();
  float len2 = createLen2(10.0, 10.0, 8.0, 20.0);
  float len3 = createLen3(2.0, 2.0, 10.0, 30.0);
  float len4 = createLen4(5.0, 20.0, 5.0, 40.0);

  vec3 blue = uColor1 + cos(len) * 0.25 + 0.25;
  
  vec3 turquoise = uColor2 + cos(len2) * 0.5 + 0.75;

  /*
  vec2 pos = vec2(sin(uTime * 0.01 * sin(uTime * 0.001)), cos(uTime * 0.002));
  float radius = 0.5 + cos(uTime * 0.01) * 0.1;
  vec3 turquoise = createCircle(pos, uColor2, radius, 0.5);

  vec2 pos2 = vec2(cos(-uTime * 0.01), sin(-uTime * 0.03 * sin(-uTime * 0.001)));
  float radius2 = 0.3 + cos(uTime * 0.01) * 0.01;
  turquoise += createCircle(pos2, uColor2, radius2, 0.75);
  */
  
  vec3 pink = uColor3 + cos(len3) * 0.5 + 0.75;
  vec3 peach = uColor4 + cos(len4) * 0.75 + 0.95;
  
  float pinkValue = min(1.0, max(0.0, 1.2 - (pink[0] / 1.2)));
  
  float peachValue = min(1.0, max(0.0, 1.5 - (peach[0] / 1.2)));

  float turquoiseValue = min(1.0, max(0.0, 1.5 - (turquoise[2] / 1.1)));

  vec3 blend = blue;
  blend = mix(blend, turquoise, turquoiseValue);
  blend = mix(blend, peach, peachValue);
  blend = mix(blend, pink, pinkValue);

  //blend += turquoise;
  //blend += torquoise;
  //blend = blendDarken(blend, pink);
  //blend = blendLinearBurn(blend, peach);

  vec3 lightercolor = blendLinearBurn(blend, peach);
  blend = mix(blend, lightercolor, max(1.0 - lightercolor[0], 0.0));
  
  blend = blendOverlay(blend, vec3(0.0, 0.0, 0.0));
  blend = blendLinearBurn(blend, vec3(1.0, 0.7, 0.1));

  vec3 color = blend;
  
  float r = color[0];
  float g = color[1];
  float b = color[2];

  vec3 hsb = rgb2hsv(vec3(r, g, b));
  hsb[1] -= rand(coord) * 0.4;
  vec3 rgb = hsv2rgb(hsb);
  
  gl_FragColor = vec4(rgb, 1.0);
}
</script>
<!-- partial -->
  <script src='https://cdnjs.cloudflare.com/ajax/libs/p5.js/1.3.1/p5.min.js'></script>
  <script src="<%=request.getContextPath() %>/resources/js/back.js"></script>

</body>
</html>
