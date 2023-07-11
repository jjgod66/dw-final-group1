<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="sysAdminHeader.jsp" %>
    
    
<style>

@font-face {
            font-family: 'NotoSansKR';
            src: url('font/NotoSansKR-Black.otf') format('opentype')
            src: url("resources/summernote/font/summernote.woff") format("woff"),
        }

.btn_ssmall, .btn_small, .btn_lsmall, .btn_medium, .btn_large {
    border: 1px solid #333;
    color: #fff !important;
}

.grey {
    background: #888;
    border: 1px solid #888;
    color: #fff !important;
}
.breadcrumb {
    padding: 0 0 0 25px;
    color: #000;
    line-height: 34px;
    border-bottom: 1px solid #e9e9e9;
    text-align: left;
        font-size: 12px;
}
#content {
	margin-left: 150px;
	margin-right:150px;
	padding-bottom: 100px;
	border-left: 1px solid #ccc;
	border-right: 1px solid #ccc;
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
.btn_large1 {
    border: 1px solid #333;
    color: #fff !important;
}
.btn_large {
    padding: 10px 21px;
    font-size: 15px;
    line-height: 1.222;
    font-weight: 600;
}
.btn_large1 {
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
		 <div class="breadcrumb">
			<span>HOME</span>&nbsp  &gt 이벤트관리 &gt 이벤트등록  
		 </div>
		 
		 <!-- ########영화관리 ############ -->
		 
<div class="s_wrap">
	<h1>이벤트 등록</h1>
	
<form role="form"  name="registform" method="post" action="eventRegist.do">
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
		<th scope="row" name="eventS">이벤트 구분 </th>
		<td>
			<select name="">
				<option value="">선택  </option>
				<option value="">영화  </option>
				<option value="">극장 </option>
				<option value="">시사회/무대인사  </option>
			</select>
		</td>
	</tr>
	<tr>
		<th scope="row">제목 </th>
		<td><input type="text" name="title" placeholder="제목을 입력하세요. "  value="" required="" itemname="제목" class="required frm_input" size="80" style="background-position: right top; background-repeat: no-repeat;"></td>
	</tr>
	
	<tr>
		<th scope="row">기간 </th>
		<td>
			<input type="text" placeholder="ex)20230707" name="" value="" class="frm_input wfull"> ~ <input type="text" name="" value="" class="frm_input wfull">
		</td>
	</tr>
	

	<tr>
		<th scope="row">상영종료일 </th>
		<td><input type="text" name="" value="" class="frm_input"></td>
	</tr>
	
	<tr>
		<th scope="row">내용 </th>
		<td>
			<textarea class="textarea" name="" id="content1" rows="20" 
							placeholder="1000자 내외로 작성하세요." style="display: block; width:100%"> </textarea>
		</td>
	</tr>


	</tbody>
	</table>
</div>
</section>


<div class="btn_confirm">
	<input type="submit" value="저장" class="btn_large" id="registBtn">
	<input type="button" value="취소" id="cancelBtn" class="btn_large1 grey">
</div>
</form>

</div>		 
		 
		 
		 
		 <!-- #################### -->
	</div>
</div>
    
<script>
	window.onload = function () {
		/* $('#content').summernote({
		}); */
		SmartEditor_summernote($('#content1'));
		
		//저장눌렀을때
		$('#registBtn').on('click', function () {
			let title = $('input[name="title"]');
			let eventS = $('th[name="eventS"]');
			
			if(title.val() == ''){
				alert("제목을필수에요");
				title.focus();
				return;
			};
			if(eventS.val() ==''){
				alert("이벤트 구분은 필수에요.");
				eventS.focus();
				return;
			};
			
			$('form[name="registform"]').submit();
		})
	
		
		//cnl취소버튼클릭
		$('#cancelBtn').on('click', function () {
			console.log('test');
			history.go(-1);
		});
	}
</script>


<%@ include file="/WEB-INF/views/common/summernote.jsp" %>

<%@ include file="sysAdminFooter.jsp"%>