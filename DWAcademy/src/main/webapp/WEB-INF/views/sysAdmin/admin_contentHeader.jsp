<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.breadcrumb {
	padding: 0 0 0 25px;
	color: #000;
	line-height: 34px;
	border-bottom: 1px solid #e9e9e9;
	text-align: left;
	font-size: 12px;
}
h1, h2, h3, h4, h5, h6 {
	font-size: 1em;
	font-weight: 600;
}
</style>
<section class="content-header">
	<div class="breadcrumb">
		<span>${param.subject }</span> <i class="bi bi-chevron-compact-right" style="padding-top: 0.1rem; align-self: center;"></i> ${param.item1 }
	</div>
</section>
	<h1><span style="margin-left: 2rem;">${param.item2 }</span></h1>