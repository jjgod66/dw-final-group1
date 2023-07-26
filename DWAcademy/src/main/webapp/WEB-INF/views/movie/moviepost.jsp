<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.or.dw.vo.MemberVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../include/header.jsp" %>
<script src="http://kit.fontawesome.com/77ad8525ff.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="../../resources/css/boxoffice.css">
<style>
.board-search {
    position: relative;
    display: inline-block;
    vertical-align: middle;
    width: 230px;
    height: 36px;
    margin: 0;
    padding: 0 31px 0 0;
    border: 1px solid #d8d9db;
    border-radius: 3px;
}
.board-search .input-text {
    display: block;
    width: 100%;
    height: 34px;
    border: 0;
}
.board-search .btn-search-input {
    position: absolute;
    right: 1px;
    top: 1px;
}

.btn-search-input {
    overflow: hidden;
    width: 30px;
    height: 32px;
    margin: 0;
    padding: 0;
    font-size: 0;
    line-height: 0;
    border: 0;
    text-indent: -9999px;
    background: #fff url(https://img.megabox.co.kr/static/pc/images/common/btn/btn-search-input.png) no-repeat center;
}
select {
    overflow: hidden;
    height: 34px;
    border: 1px solid #d8d9db;
}

.btn-mp-write{
	color : #fff;
	background-color: #4aa8d8;
	padding : 10px;
	border : solid 1px #4aa8d8;
	border-radius: 0.375rem;
}
.btn-mp-write:hover{
	color : #4aa8d8;
	background-color: #fff;
}
</style>
<%@ include file="moviepost_modal.jsp" %>
<%
	String mem_cd = "";
	if(session.getAttribute("loginUser") != null){
		MemberVO member = (MemberVO)session.getAttribute("loginUser");
		mem_cd = member.getMem_cd();
	}
%>
<c:set var="cri" value="${pageMaker.cri }" />
<div class="sub_visual">
    <h3>무비포스트</h3>
    <h6>Movie Post</h6>
</div>

<div style="width: 100%;">
	<div style="padding: 30px;">
		<div style="width: 1300px; margin: 0 auto;">
			<div style="width: 95%; margin: 0 auto;">
				<div style="margin: 20px 10px 10px 0px; float: left"><input id="moviepostModalBtn" type="button" class="btn-mp-write" value="무비포스트 작성"></div>
				<div style="margin: 20px 0px 10px 10px; float: right; display: flex;">
					<div style="margin: 10px;">
						<span>
							<select name="searchType" id="searchType" onchange="javascript:searchList_go(1);">
											<option value="regdate" ${cri.searchType eq 'regdate' ? 'selected' : '' }>최신순 </option>
											<option value="like" ${cri.searchType eq 'like' ? 'selected' : '' }>공감순 </option>
							</select>
						</span>
					</div>
					<div id="boardSearch" class="inner-wrap" style="margin: 10px;">
						<div class="board-list-util mt0">
							<div class="board-search">
								<input type="text" title="영화 제목을 입력해 주세요." placeholder="영화 제목을 입력해 주세요." name="keyword"
									class="input-text" id="search" value="${cri.keyword }">
								<button type="button" class="btn-search-input" id="searchBtn">검색</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="moviepost_container" style="width: 1300px; margin: 0 auto; display: flex;">
			<div class="container" style="padding-bottom: 10px;">
			<c:if test="${empty moviePostList}">
				<div style="text-align: center;">등록된 무비포스트가 없습니다.</div>
			</c:if>
				<div class="row">
					<c:forEach items="${moviePostList }" var="mp">
		        		<div class="col-3 post" style="height: 400px;">
		        			<div class="card" style="margin: 20px; height: 90%;">
		        				<div class="card-body" style="height: 45%; background-image: url('<%=request.getContextPath() %>/sysAdmin/getPicture.do?name=${mp.MOVIE_PIC_PATH}&item_cd=${mp.MOVIE_CD}&type=movieImg');  background-repeat : no-repeat; background-size : cover;"></div>
		        				<div class="card-body" style="height: 55%;">
		        					<div>
		        						<p style="font-size: small;">
				        					<c:set var="mem_id_post" value="${mp.MEM_ID}" />
									    	${fn:substring(mem_id_post,0,3) }**
							    		</p>
							    	</div>
		        					<br>
		        					<div>${mp.MOVIE_NAME }</div>
		        					<div><p style="font-size: small;">${mp.MPOST_CONTENT }</p></div>
		        					<br>
		        					<div><p style="font-size: x-small;"><fmt:formatDate value="${mp.REGDATE }" pattern="yyyy-MM-dd HH:mm"/> <br><br></p></div>
		        					<div>
		        						<i class="fa-regular fa-thumbs-up">&nbsp;<span>${mp.LIKECNT }</span></i>
		        						&nbsp;&nbsp;&nbsp;&nbsp;
		        						<i class="fa-regular fa-message">&nbsp;<span>${mp.REPLYCNT }</span></i>
		        					</div>
		        				</div>
		        			</div>
		        		</div>
	        		</c:forEach>
	        	</div>
	      	</div>
     	</div>
     	<div class="mt-5 mb-5 paginationdiv">
			<%@ include file="../common/pagination.jsp" %>
		</div>
    </div>
</div>
<script>
let searchFormUrl = "moviePost.do";
let mem_cd = "<%=mem_cd%>";
$(function(){
	let mplist = '${moviePostList}';
	if(mplist == '[]'){
		$('.paginationdiv').css('display', 'none');
	}
	
	$('#searchBtn').on('click', function(){
		searchList_go(1);
	})
	
	$('#moviepostModalBtn').on('click', function(){
		if(mem_cd == null || mem_cd == ""){
			alert("로그인이 필요합니다.");
			return;
		}
		$('#moviepost-modal').modal("show");
		
	
	})
// 		$.ajax({
<%-- 			url : "<%=request.getContextPath()%>/movie/watchYN.do", --%>
// 			method : 'post',
// 			data : {"movie_cd" : movie_cd},
// 			success : function(res){
// 				console.log(res);
// 				if(res == "non"){
// 					alert("무비포스트는 관람 후 작성 가능합니다.");SELECT COUNT(*)
// 					return;
// 				}else if(res == "write"){
// 					alert("무비포스트는 영화 당 한 개만 작성 가능합니다.");
// 					return;
// 				}
// 			},
// 			error : function(err){
// 				alert(err);
// 			}
// 		})
	
})

</script>
<%@ include file="../include/footer.jsp" %>