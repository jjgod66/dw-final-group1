<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.btn-more {
    position: relative;
    padding: 40px 0 0 0;
}
.btn-more.v1 .btn {
    border: 1px solid #eaeaea;
}
.btn-more .btn {
    display: block;
    width: 100%;
    margin: 0;
    padding: 0;
    height: 40px;
    border: 0;
    border-bottom: 1px solid #eaeaea;
    background-color: transparent;
    color: #666;
}
[type=button], [type=reset], [type=submit], button {
    -webkit-appearance: button;
}
button {
    cursor: pointer;
    letter-spacing: -.5px;
    font-weight: 400;
    font-family: NanumBarunGothic,Dotum,'돋움',sans-serif;
}

button, select {
    text-transform: none;
}
.btn-more .btn i {
    margin-left: 6px;
}
.ico-btn-more-arr {
    width: 12px;
    height: 7px;
    background-image: url(https://img.megabox.co.kr/static/pc/images/common/ico/ico-btn-more-arr.png);
}

.iconset {
    overflow: hidden;
    display: inline-block;
    margin: -1px 0 0 0;
    padding: 0;
    font-size: 0;
    line-height: 0;
    vertical-align: middle;
    background-position: 0 0;
    background-repeat: no-repeat;
}
/* * {
    box-sizing: border-box;
} */
i {
    font-style: italic;
}
</style>

<div class="btn-more v1" style="">
	<a href="javascript:searchList_go(${pageMaker.next ? pageMaker.startPage+1 : -1 });"  class="btn">
		더보기 <i class="iconset ico-btn-more-arr"></i>
	</a>
</div>

<script>
	function searchList_go(page, url) {
		if(page < 1){
			return;
		}
		let perPageNum = 10;
		if( $('select[name="perPageNum"]').val() ){
			perPageNum = $('select[name="perPageNum"]').val();
		}
		
		let searchForm = $('#searchForm');
		
		searchForm.find('[name="page"]').val( page );
		searchForm.find('[name="perPageNum"]').val( perPageNum );
		searchForm.find('[name="searchType"]').val( $('select[name="searchType"]').val() );
		searchForm.find('[name="keyword"]').val( $('div.input-group > input[name="keyword"]').val() );
		searchForm.attr("method", "post");
		
		if(url){
			searchForm.attr("action",url);
		}else{
			searchForm.attr("action","list.do");
		}
		searchForm.submit();
	}
</script>