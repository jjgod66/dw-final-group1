<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="sysAdminHeader.jsp" %>
    
    
<style>
.breadcrumb {
    padding: 0 0 0 25px;
    color: #000;
    line-height: 34px;
    border-bottom: 1px solid #e9e9e9;
    text-align: left;
        font-size: 12px;
}
#content {
	max-width: 80rem;
	margin : 2rem auto 2rem auto;
    padding-bottom: 100px;
    border: 1px solid #ccc;
}
.s_wrap {
    margin: 30px 25px;
}
#content h1 {
    margin: 0 0 20px;
    padding-bottom: 15px;
    border-bottom: 1px solid #888;
    font-size: 20px;
    line-height: 1em;
    letter-spacing: -1px;
}
h1, h2, h3, h4, h5, h6 {
    font-size: 1em;
    font-weight: 600;
}
#content h2 {
    margin: 30px 0 0;
    position: relative;
    font-size: 16px;
    font-weight: 600;
    letter-spacing: -1px;
    line-height: 1em;
    padding: 0 0 10px 10px;
}
#content h2:before {
    display: inline-block;
    position: absolute;
    left: 0;
    top: 0;
    width: 4px;
    height: 16px;
    background: #1a4e99;
    content: '';
}
.tbl_frm01 {
    border-top: 1px solid #888;
}
.tbl_frm01 table {
    width: 100%;
}
.w180 {
    width: 180px !important;
}
.tbl_frm01 th {
    font-weight: 600;
}
.tbl_frm01 th, .tbl_frm01 td {
    padding: 8px 14px;
    height: 23px;
    border-bottom: 1px solid #e4e5e7;
    text-align: left;
    vertical-align: middle;
}
table th {
    background-color: #f8f8f8;
    white-space: nowrap;
    text-overflow: ellipsis;
    line-height: 1.3em;
}

.tbl_frm01 td label {
    margin-right: 7px;
}
.banner_or_img {
    margin: 5px 0 0;
}
.frm_info {
    display: block;
    padding-top: 5px;
    line-height: 1.4em;
}
.btn_confirm {
    margin-top: 20px;
    text-align: center;
}
.btn_confirm a, .btn_confirm input, .btn_confirm button {
    margin: 0 1.5px;
}
.btn_ssmall, .btn_small, .btn_lsmall, .btn_medium, .btn_large {
    background: #333;
    border: 1px solid #333;
    color: #fff !important;
}
.btn_large {
    padding: 10px 21px;
    font-size: 15px;
    line-height: 1.222;
    font-weight: 600;
}
body, div, table, th, td, pre, blockquote {
    font-size: 12px;
}
.tbl_frm02 table {
    width: 100%;
}
.w180 {
    width: 180px !important;
}
.tbl_frm02 th {
    font-weight: 600;
}
.tbl_frm02 th, .tbl_frm02 td {
    padding: 8px 14px;
    height: 22px;
    border: 1px solid #e4e5e7;
    text-align: left;
    vertical-align: middle;
}
table th {
    background-color: #f8f8f8;
    white-space: nowrap;
    text-overflow: ellipsis;
    line-height: 1.3em;
}
.required, textarea.required {
    background: url(/img/wrest.gif) top right no-repeat;
}

.frm_input {
    padding: 0 4px 1px 4px;
    font-size: 12px;
    font-weight: normal;
    border: 1px solid #ddd;
    background-color: #fff;
    border-radius: 0;
    -webkit-border-radius: 0;
}
</style>  
    
<div id="wrapper">
	<div id="content">
		 <jsp:include page="admin_contentHeader.jsp">
			<jsp:param value="${subject }" name="subject" />
			<jsp:param value="${item1 }" name="item1" />
			<jsp:param value="${item2 }" name="item2" />
		</jsp:include>
		 
		 <!-- ########영화관리 ############ -->
		 
<div class="s_wrap">
	
<form name="flogo" method="post" action="./design/logo_update.php" enctype="MULTIPART/FORM-DATA">
<input type="hidden" name="token" value="">



<!-- ########기본정보 입력  ############ -->

<section id="anc_sitfrm_ini">
<h2>기본정보</h2>
<div class="tbl_frm02">
	<table>
	<colgroup>
		<col class="w180">
		<col>
	</colgroup>
	<tbody>
	<tr>
			<th scope="row" style="text-align: center;">포스터</th>
			<td>
				<div class="row">
					<div class="col-md-2">
						<div id="pictureView" style="border: 1px solid green; height: 360px; width: 280px; margin: 0 auto; margin-bottom: 5px;"></div>
					</div>
					<div class="col-md-10">
						<input type="file" name="movie_mainpic" id="movie_mainpic" accept=".jpeg, .png, .jpg, .gif" style="display: none;" onchange="imageChange_go();" required>
						<input type="button" id="posterBtn" value="포스터 등록">
						<input id="inputFileName" class="form-control" type="text" name="" disabled>
						<input id="picture" class="form-control" type="hidden" name="uploadPicture">
					</div>
				</div>
			</td>
		</tr>
	<tr>
		<th scope="row">제목</th>
		<td>
			<input type="text" name="movie_name" value="${movie.movie_name }" id="movie_name"  class="required frm_input form-control" style="background-position: right top; background-repeat: no-repeat;" required>
		</td>
	</tr>
	<tr>
		<th scope="row">감독</th>
		<td>
			<input type="text" name="movie_director" value="${movie.movie_director }" id="movie_director" class="required frm_input form-control" style="background-position: right top; background-repeat: no-repeat;" required>
					</td>
	</tr>
	<tr>
		<th scope="row">영화소개</th>
		<td>
			<textarea name="movie_info" class="required frm_input form-control" rows="5" cols="150" style="background-position: right top; background-repeat: no-repeat; resize: none;" required>
				${movie.movie_info }
			</textarea>
		</td>
	</tr>
	
	<tr>
		<th scope="row">러닝타임</th>
		<td>
			<input type="text" name="movie_length" id="movie_length" value="${movie.movie_length }" placeholder="양의 정수로 입력해주세요" class="frm_input wfull"> 분
		</td>
	</tr>
	<tr>
		<th scope="row">장르</th>
		<td>
			<select name="genre_cd">
				<c:forEach items="${genreList }" var="genre" >
					<option value="${genre.genre_cd }">${genre.genre_name }</option>
				</c:forEach>
			</select>
		</td>
	</tr>
	<tr>
		<th scope="row">관람등급 </th>
		<td>
			<select name="movie_grade">
				<c:forEach items="${gradeList }" var="grade" >
					<option value="${grade}">${grade}</option>
				</c:forEach>
			</select>
		</td>
	</tr>
	<tr>
		<th scope="row">개봉일 </th>
		<td><input type="date" name="opendate" id="opendate" class="frm_input" required></td>
	</tr>
	<tr>
		<th scope="row">상영종료일 </th>
		<td><input type="date" name="enddate" id="enddate" class="frm_input" required></td>
	</tr>
	<tr>
		<th scope="row">출연진 </th>
		<td><input type="text" name="movie_actor" id="movie_actor" class="required frm_input form-control" size="80" style="background-position: right top; background-repeat: no-repeat;" required></td>
	</tr>
	
	
	<tr>
		<th scope="row">더빙타입 </th>
		<td class="td_label">
			<label><input type="checkbox" name="isdub" value="DU" checked="checked"> 더빙 </label>
			<label><input type="checkbox" name="isdub" value="DE"> 자막 </label>
			<label><input type="checkbox" name="isdub" value="NO"> 없음 </label>
		</td>
	</tr>
		<tr>
		<th scope="row">3D유무 </th>
		<td class="td_label">
			<label><input type="checkbox" name="is3d" value="2D"> 2D</label>
			<label><input type="checkbox" name="is3d" value="3D"> 3D </label>
		</td>
	</tr>
	<tr>
		<th scope="row">관련사진 </th>
		<td> 
			<input type="file" name="movie_picList" id="movie_picList">
		</td>
	</tr>
	<tr>
		<th scope="row">예고편 </th>
		<td> 
			<input type="file" name="movie_videoList" id="movie_videoList">
		</td>
	</tr>
	</tbody>
	</table>
</div>
</section>


<div class="btn_confirm">
	<c:choose>
		<c:when test="${empty movie}">
			<button type="button" id="registBtn" class="btn_large">등록</button>
		</c:when>
		<c:otherwise>
			<button type="button" id="modifyBtn" class="btn_large">수정</button>
			<button type="button" id="deleteBtn" class="btn_large">삭제</button>
		</c:otherwise>
	</c:choose>
	<button type="button" id="cancelBtn" class="btn_large">뒤로가기</button>
</div>
</form>
</div>		 
		 <!-- #################### -->
	</div>
</div>

<script>
$('#posterBtn').on('click', function(){
	console.log('test');
	$('#movie_mainpic').click();
});

function imageChange_go(){
	let inputImage = $('input#movie_mainpic')[0];
	preViewPicture(inputImage, $('div#pictureView'));
	$('input[name="uploadPicture"]').val(inputImage.files[0].name);
};	

</script>  
<%@ include file="sysAdminFooter.jsp"%>