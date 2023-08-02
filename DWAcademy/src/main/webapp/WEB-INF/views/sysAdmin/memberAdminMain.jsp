<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="sysAdminHeader.jsp"%>

<c:set var="cri" value="${pageMaker.cri }" />
<style>
#content h2 {
	margin : 0;
}
.tbl_frm01 {
	width: 100%;
}
.mart30 {
	margin : 0;
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
			<h2>회원검색</h2>
				<div class="tbl_frm01">
					<table>
						<colgroup>
							<col class="w100">
							<col class="w150">
							<col>
							<col class="w50">
							<col class="w50">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">검색어</th>
								<td>
									<select name="searchType" id="searchType">
										<option value="ni" ${cri.searchType eq 'ni' ? 'selected' : '' }>구분</option>
										<option value="i" ${cri.searchType eq 'i' ? 'selected' : '' }>ID</option>
										<option value="n" ${cri.searchType eq 'n' ? 'selected' : '' }>이름</option>
									</select> 
									<input type="text" name="keyword" value="${cri.keyword }" class="frm_input"size="30">
									<button type="button" class="btn_medium" onclick="searchList_go(1);">검색</button>
								</td>
								<td></td>
								<td>
									<select name="searchType2" id="searchType2">
										<option value="sbd" ${cri.searchType2 eq 'sbd' ? 'selected' : '' }>필터</option>
										<option value="s" ${cri.searchType2 eq 's' ? 'selected' : '' }>휴면계정</option>
										<option value="b" ${cri.searchType2 eq 'b' ? 'selected' : '' }>블랙계정</option>
										<option value="d" ${cri.searchType2 eq 'd' ? 'selected' : '' }>삭제계정</option>
									</select>
								</td>
								<td>
									<select name="orderType" id="orderType">
										<option value="inr" ${cri.orderType eq 'inr' ? 'selected' : '' }>정렬기준</option>
										<option value="i" ${cri.orderType eq 'i' ? 'selected' : '' }>ID</option>
										<option value="n" ${cri.orderType eq 'n' ? 'selected' : '' }>이름</option>
										<option value="r" ${cri.orderType eq 'r' ? 'selected' : '' }>가입일자</option>
									</select>
								</td>
							</tr>
							
						</tbody>
					</table>
				</div>
				<div class="local_ov mart30">
					전체 : <b class="fc_red">${pageMaker.totalCount }</b> 건 조회
				</div>
				<div class="tbl_head01">
					<table>
						<colgroup>
							<col class="w150">
							<col class="w150">
							<col class="w150">
							<col class="w100">
							<col class="w100">
							<col class="w100">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">ID</th>
								<th scope="col">이름</th>
								<th scope="col">가입일자</th>
								<th scope="col">휴면여부</th>
								<th scope="col">블랙여부</th>
								<th scope="col">삭제여부</th>
							</tr>
						</thead>
						<tbody class="list">
							<c:if test="${empty memberList }">
								<tr>
									<td colspan="12">
										<strong>해당 내용이 없습니다.</strong>
									</td>
								</tr>
							</c:if>
							<c:forEach items="${memberList }" var="mem">
								<tr class="list0">
									<td><a href="memeberAdminDetail.do?mem_cd=${mem.mem_cd }">${mem.mem_id }</a></td>
									<td>${mem.mem_name }</td>
									<td><fmt:formatDate value="${mem.regdate }" pattern="yyyy-MM-dd"/></td>
									<td>${mem.gb_sleep  }</td>
									<td>${mem.gb_ban }</td>
									<td>${mem.gb_del }</td>
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
	let searchFormUrl = "memberAdminMain.do";
	
	$('#searchType2, #orderType').on('change', function(){
		searchList_go(1);
	});
</script>

<%@ include file="sysAdminFooter.jsp" %>