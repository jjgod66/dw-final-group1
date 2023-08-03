<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="sysAdminHeader.jsp" %>
    
<c:set var="cri" value="${pageMaker.cri }" />

<style>

.nav-item > span {
	border: 1px solid #ccc;
	background-color : white;
	padding : 0.5rem;
	margin-right : 0.5rem;
	cursor : pointer;
}
#boxOffice, #futureOffice {
	padding : 0.3rem;
}

</style>

<div id="wrapper">
	<div id="content">
		<jsp:include page="admin_contentHeader.jsp">
			<jsp:param value="${subject }" name="subject" />
			<jsp:param value="${item1 }" name="item1" />
			<jsp:param value="${item2 }" name="item2" />
			<jsp:param value="${url }" name="url" />
		</jsp:include>
		<div class="card">
			<div class="card-header" style="padding-bottom: 0;">
				<ul class="nav nav-tabs" style="padding-bottom: 0.4rem;">
				  <li class="nav-item" id="boxOffice" onclick="isFuture('b'); searchList_go(1);">
				    <button class="btn_medium">박스오피스</button>
				  </li>
				  <li class="nav-item" id="futureOffice" onclick="isFuture('f'); searchList_go(1);">
				    <button class="btn_medium">상영예정작</button>
				  </li>
				</ul>
				<div class="float-end">
					<span>
						<select name="searchType" id="searchType" onchange="javascript:searchList_go(1);">
										<option value="r" ${cri.searchType eq 'r' ? 'selected' : '' }>예매율</option>
										<option value="n" ${cri.searchType eq 'n' ? 'selected' : '' }>영화명</option>
										<option value="d" ${cri.searchType eq 'd' ? 'selected' : '' }>개봉일</option>
						</select>
						<input type="hidden" id="keyword" name="keyword" value="${cri.keyword }">
					</span>
					<button type="button" class="btn_medium" id="movieRegistFormBtn" style="margin: 0.3rem;">&nbsp;&nbsp;등록&nbsp;&nbsp;</button>
				</div>
			</div>
			<div class="card-body">
				<div class="container px-4">
				<div class="movieList row gx-1 px-1" style="text-align: -webkit-center;">
					<c:forEach items="${movieList}" var="movie">
						<div class="col-md-3" style="border: 1px solid #ccc;">
							<div class="p-1" style="width: 80%; height: 20rem; overflow: hidden;">
								<img src="/common/getPicture.do?name=${movie.MOVIE_MAINPIC_PATH}&item_cd=${movie.MOVIE_CD}&type=moviePoster" class="img-thumbnail" style="object-fit: cover; width: 100%; hegith:100%;">
							</div>
							<div>
								${movie.GRADE } <a href="movieRegistForm.do?movie_cd=${movie.MOVIE_CD }">${movie.MOVIE_NAME}</a>
							</div>
							<div>
								예매율: ${movie.reserveRatio }% / 개봉일: <fmt:formatDate value='${movie.OPENDATE }' pattern='yyyy-MM-dd'/>
							</div>
						</div>
					</c:forEach>
				</div>
				</div>
			</div>
			<div class="mt-5 mb-5">
				<%@ include file="../common/pagination.jsp" %>
			</div>
		</div>
	</div>
</div>    

<script>
 
	$(function(){
		$('#movieRegistFormBtn').on('click', function(){
			location.href="movieRegistForm.do";
		});
		
	});
	function isFuture(e){
		console.log(e);
		if (e == "b"){
			$('input[name="keyword"]').val('');			
		} else if(e == "f") {
			$('input[name="keyword"]').val('f');
		}
	}
	
	let searchFormUrl = "movieAdminMain.do";
</script>
<%@ include file="sysAdminFooter.jsp"%>