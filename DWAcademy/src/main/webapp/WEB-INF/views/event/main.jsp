<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<% 
// https://getbootstrap.kr/docs/5.2/components/card 
%>
<style>

</style>
<div class="sub_visual">
    <h3>이벤트</h3>
    <h6>movie event</h6>
</div>
<div class="container">
	<h2 style="padding: 40px 0px 40px 0px">진행중인 이벤트 </h2>
	
	<div class="tab-list fixed">
		<ul class="nav nav-tabs fs-5" id="myTab" role="tablist" style="justify-content: space-evenly;">
		  <li class="nav-item" role="presentation">
		    <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home-tab-pane" type="button" role="tab" aria-controls="home-tab-pane" aria-selected="true">전체</button>
		  </li>
		  <li class="nav-item" role="presentation">
		    <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile-tab-pane" type="button" role="tab" aria-controls="profile-tab-pane" aria-selected="false">영화</button>
		  </li>
		  <li class="nav-item" role="presentation">
		    <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact-tab-pane" type="button" role="tab" aria-controls="contact-tab-pane" aria-selected="false">극장</button>
		  </li>
		  <li class="nav-item" role="presentation">
		    <button class="nav-link" id="disabled-tab" data-bs-toggle="tab" data-bs-target="#disabled-tab-pane" type="button" role="tab" aria-controls="disabled-tab-pane" aria-selected="false">시사회/무대인사</button>
		  </li>
		</ul>
	</div>	
	
	<div class="tab-content inner-wrap" id="myTabContent">
	  <div class="tab-pane fade show active" id="home-tab-pane" role="tabpanel" aria-labelledby="home-tab" tabindex="0">
		  <div class="event-wrapper" style="padding: 20px 0;">
		    <div class="container">
			  <div class="event_title_wrap">
		            <div class="tabBtn_wrap">
		                <h3>영화</h3>
		            </div>
		            <a href="#" class="btn btn-allView">더보기</a>
		      </div>
		    </div>
	       </div>
        
	  <div class="container">
	  	<div class="row">
	  	<div class="card col-3" style="margin: 5px 15px; padding: 0; width: 22%;">
		  <img src="https://img.megabox.co.kr/SharedImg/event/2023/07/05/7D39tGLwKYaUZ6SbFNO8OzwJ0Py2mngA.jpg" class="card-img-top" style="width: 100%" alt="...">
		  <div class="card-body">
		    <a href="#" class="card-link"><h6 class="card-title">It's 유해진 그가 왔다! <달짝지근해: 7510> 예고편 보고 예매권 받자!</h6></a>
		    <a href="#" class="card-link">2023.7.05~2023.07.15</a>
		  </div>
	    </div>
			<div class="card col-3" style="margin: 5px 15px ; padding: 0; width: 22%;">
			  <img src="https://img.megabox.co.kr/SharedImg/event/2023/07/05/wImn8PcYkoklSDEhAZplm69ngbSrWKv9.jpg" class="card-img-top" style="width: 100%" alt="...">
			  <div class="card-body">
			    <a href="#" class="card-link">
			    	<p class="tit">
						&lt;비밀의 언덕&gt; 굿즈패키지 상영회
					</p>
				</a>
			    <a href="#" class="card-link">2023.7.05~2023.07.15</a>
			  </div>
		    </div>
		    <div class="card col-3" style="margin: 5px 15px; padding: 0; width: 22%;">
			  <img src="https://img.megabox.co.kr/SharedImg/event/2023/06/27/BMbeiQGzlWVsgHJCqmzvnUAXVS1dKhl5.jpg" class="card-img-top" style="width: 100%" alt="...">
			  <div class="card-body">
			    <a href="#" class="card-link"><h6 class="card-title">It's 유해진 그가 왔다! <달짝지근해: 7510> 예고편 보고 예매권 받자!</h6></a>
			    <a href="#" class="card-link">2023.7.05~2023.07.15</a>
			  </div>
		    </div>
		    <div class="card col-3" style="margin: 5px 15px; padding: 0; width: 22%;">
			  <img src="https://img.megabox.co.kr/SharedImg/event/2023/07/03/nNQsxrvDKLtuAYjyX4Czfj5TQZ0KCiqV.jpg" class="card-img-top" style="width: 100%" alt="...">
			  <div class="card-body">
			    <a href="#" class="card-link"><h6 class="card-title">It's 유해진 그가 왔다! <달짝지근해: 7510> 예고편 보고 예매권 받자!</h6></a>
			    <a href="#" class="card-link">2023.7.05~2023.07.15</a>
			  </div>
		    </div>
		</div>
	  </div>
	  
	  <div class="event-wrapper">
	    <div class="container">
		  <div class="event_title_wrap">
	            <div class="tabBtn_wrap">
	                <h3>극장 </h3>
	            </div>
	            <a href="#" class="btn btn-allView">더보기</a>
	      </div>
	    </div>
       </div>
       
       <div class="container">
	  	<div class="row">
	  	<div class="card col-3" style="margin: 5px 15px; padding: 0; width: 22%;">
		  <img src="https://img.megabox.co.kr/SharedImg/event/2023/06/22/lYvh9Hm1azfGygwBm4ew3sAwY6y04FEP.jpg" class="card-img-top" style="width: 100%" alt="...">
		  <div class="card-body">
		    <a href="#" class="card-link"><h6 class="card-title">It's 유해진 그가 왔다! <달짝지근해: 7510> 예고편 보고 예매권 받자!</h6></a>
		    <a href="#" class="card-link">2023.7.05~2023.07.15</a>
		  </div>
	    </div>
			<div class="card col-3" style="margin: 5px 15px ; padding: 0; width: 22%;">
			  <img src="https://img.megabox.co.kr/SharedImg/event/2023/06/30/8Wn3auNq9MoN128Dy5j6074n1dfktnDk.jpg" class="card-img-top" style="width: 100%" alt="...">
			  <div class="card-body">
			    <a href="#" class="card-link">
			    	<p class="tit">
						&lt;비밀의 언덕&gt; 굿즈패키지 상영회
					</p>
				</a>
			    <a href="#" class="card-link">2023.7.05~2023.07.15</a>
			  </div>
		    </div>
		    <div class="card col-3" style="margin: 5px 15px; padding: 0; width: 22%;">
			  <img src="https://img.megabox.co.kr/SharedImg/event/2023/06/23/LTLGHvAglnNGUGiyE9ia5Sk51rvmtJTL.jpg" class="card-img-top" style="width: 100%" alt="...">
			  <div class="card-body">
			    <a href="#" class="card-link"><h6 class="card-title">It's 유해진 그가 왔다! <달짝지근해: 7510> 예고편 보고 예매권 받자!</h6></a>
			    <a href="#" class="card-link">2023.7.05~2023.07.15</a>
			  </div>
		    </div>
		    <div class="card col-3" style="margin: 5px 15px; padding: 0; width: 22%;">
			  <img src="https://img.megabox.co.kr/SharedImg/event/2023/06/23/GE5PEI1q4RZAKIknTU6Ub1qUAwPhra5L.jpg" class="card-img-top" style="width: 100%" alt="...">
			  <div class="card-body">
			    <a href="#" class="card-link"><h6 class="card-title">It's 유해진 그가 왔다! <달짝지근해: 7510> 예고편 보고 예매권 받자!</h6></a>
			    <a href="#" class="card-link">2023.7.05~2023.07.15</a>
			  </div>
		    </div>
		</div>
	  </div>
	  
	  <div class="event-wrapper">
	    <div class="container">
		  <div class="event_title_wrap">
	            <div class="tabBtn_wrap">
	                <h3>시사회 / 무대인사  </h3>
	            </div>
	            <a href="#" class="btn btn-allView">더보기</a>
	      </div>
	    </div>
       </div>
       
       <div class="container">
	  	<div class="row">
	  	<div class="card col-3" style="margin: 5px 15px; padding: 0; width: 22%;">
		  <img src="https://img.megabox.co.kr/SharedImg/event/2023/06/28/3MqLAzGtNUtEYqqdalMMKrirsrqr8jRz.jpg" class="card-img-top" style="width: 100%" alt="...">
		  <div class="card-body">
		    <a href="#" class="card-link"><h6 class="card-title">It's 유해진 그가 왔다! <달짝지근해: 7510> 예고편 보고 예매권 받자!</h6></a>
		    <a href="#" class="card-link">2023.7.05~2023.07.15</a>
		  </div>
	    </div>
			<div class="card col-3" style="margin: 5px 15px ; padding: 0; width: 22%;">
			  <img src="https://img.megabox.co.kr/SharedImg/event/2023/07/03/VVulTlSKPhX0Aa9uwpkjkx5001Fj3tjc.jpg" class="card-img-top" style="width: 100%" alt="...">
			  <div class="card-body">
			    <a href="#" class="card-link">
			    	<p class="tit">
						&lt;비밀의 언덕&gt; 굿즈패키지 상영회
					</p>
				</a>
			    <a href="#" class="card-link">2023.7.05~2023.07.15</a>
			  </div>
		    </div>
		    <div class="card col-3" style="margin: 5px 15px; padding: 0; width: 22%;">
			  <img src="https://img.megabox.co.kr/SharedImg/event/2023/06/28/rDqozT67Q44EDmSsn9bfP04T9OgiSdQA.jpg" class="card-img-top" style="width: 100%" alt="...">
			  <div class="card-body">
			    <a href="#" class="card-link"><h6 class="card-title">It's 유해진 그가 왔다! <달짝지근해: 7510> 예고편 보고 예매권 받자!</h6></a>
			    <a href="#" class="card-link">2023.7.05~2023.07.15</a>
			  </div>
		    </div>
		    <div class="card col-3" style="margin: 5px 15px; padding: 0; width: 22%;">
			  <img src="https://img.megabox.co.kr/SharedImg/event/2023/06/30/gdPzCANdWJv0nmOIgzi860ZIcDnk7ZvI.jpg" class="card-img-top" style="width: 100%" alt="...">
			  <div class="card-body">
			    <a href="#" class="card-link"><h6 class="card-title">It's 유해진 그가 왔다! <달짝지근해: 7510> 예고편 보고 예매권 받자!</h6></a>
			    <a href="#" class="card-link">2023.7.05~2023.07.15</a>
			  </div>
		    </div>
		</div>
	  </div>
	  
	  <div class="tab-pane fade" id="profile-tab-pane" role="tabpanel" aria-labelledby="profile-tab" tabindex="0">...</div>
	  <div class="tab-pane fade" id="contact-tab-pane" role="tabpanel" aria-labelledby="contact-tab" tabindex="0">...</div>
	  <div class="tab-pane fade" id="disabled-tab-pane" role="tabpanel" aria-labelledby="disabled-tab" tabindex="0">...</div>
	</div>


</div>




<%@ include file="../include/footer.jsp" %>