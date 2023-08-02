<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="sysAdminHeader.jsp"%>

<c:set var="cri" value="${pageMaker.cri }" />

<style>
#content h2 {
	margin: 0;
}
.local_frm01 {
	width: 100%;
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

		<div class="s_wrap">
			<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jqueryui/1.8.17/jquery-ui.min.js"></script>
			<h2>지점검색</h2>
			<form name="fsearch" id="fsearch" method="get">
				<input type="hidden" name="code" value="list">
				<div class="tbl_frm01">
					<table>
						<colgroup>
							<col class="w100">
							<col>
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">검색어</th>
								<td><select name="searchType" id="searchType">
										<option value="nlaip" ${cri.searchType eq 'nlaip' ? 'selected' : '' }>구분</option>
										<option value="n" ${cri.searchType eq 'n' ? 'selected' : '' }>영화관명</option>
										<option value="l" ${cri.searchType eq 'l' ? 'selected' : '' }>지역구분</option>
										<option value="a" ${cri.searchType eq 'a' ? 'selected' : '' }>주소</option>
										<option value="i" ${cri.searchType eq 'i' ? 'selected' : '' }>관리자ID</option>
										<option value="p" ${cri.searchType eq 'p' ? 'selected' : '' }>전화번호</option>
								</select> <input type="text" name="keyword" value="${cri.keyword }" class="frm_input"
									size="30"></td>
							</tr>
							
						</tbody>
					</table>
				</div>
				<div class="btn_confirm mb-2">
					<input type="submit" value="검색" class="btn_medium">
				</div>
			</form>
				<div class="local_ov mart30">
					전체 : <b class="fc_red">${pageMaker.totalCount }</b> 건 조회
				</div>
				<div class="local_frm01 mt-3">
					<button class="btn_lsmall bx-white" id="theaterRegistFormBtn">지점 등록</button>
				</div>
				<div class="tbl_head01">
					<table>
						<colgroup>
							<col class="w100">
							<col class="w100">
							<col class="w150">
							<col class="w150">
							<col class="w150">
							<col class="w100">
							<col class="w80">
							<col class="w100">
							<col class="w100">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">영화관명</th>
								<th scope="col">지역구분</th>
								<th scope="col">주소</th>
								<th scope="col">관리자ID</th>
								<th scope="col">관리자PWD </th>
								<th scope="col">전화번호</th>
								<th scope="col">상영관 수</th>
								<th scope="col">등록일시</th>
								<th scope="col">비활성화여부</th>
							</tr>
						</thead>
						<tbody class="list">
							<c:if test="${empty theaterList }">
								<tr>
									<td colspan="12">
										<strong>해당 내용이 없습니다.</strong>
									</td>
								</tr>
							</c:if>
							<c:forEach items="${theaterList }" var="thr">
								<tr class="list0">
									<td><a href="theaterRegistForm.do?thr_name=${thr.thr_name }">${thr.thr_name }</a></td>
									<td>${thr.thr_loc }</td>
									<td>${thr.thr_addr } ${thr.thr_addr_detail }</td>
									<td>${thr.admin_id }</td>
									<td>${thr.admin_pwd }</td>
									<td>${thr.thr_tel }</td>
									<td>1234</td>
									<td><fmt:formatDate value='${thr.regdate }' pattern='yyyy-MM-dd'/></td>
									<td>${thr.gb_del }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="mt-5">
					<%@ include file="../common/pagination.jsp" %>
				</div>
		</div>

	</div>
</div>

<script>
	$(function(){
		$('#theaterRegistFormBtn').on('click', function(){
			location.href="theaterRegistForm.do";
		});
	});
	
	let searchFormUrl = "theaterAdminMain.do";
</script>

<%@ include file="sysAdminFooter.jsp" %>