<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link href="<%=request.getContextPath()%>/resources/img/logo_ico.png" rel="shortcut icon" type="image/x-icon">
		<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap-5.2.3-dist/css/bootstrap.min.css">
		<link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/sidebars/">
		
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
		<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
		<script src="<%=request.getContextPath()%>/resources/js/jquery-3.7.0.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/bootstrap-5.2.3-dist/js/bootstrap.bundle.min.js"></script>
	</head>
	<body>
	<main class="d-flex flex-nowrap">
		<div class="container">
			<header class="d-flex justify-content-center py-3">
				<ul class="nav nav-pills">
					<li class="nav-item"><a href="#" class="nav-link active"
						aria-current="page">Home</a></li>
					<li class="nav-item"><a href="#" class="nav-link">Features</a></li>
					<li class="nav-item"><a href="#" class="nav-link">Pricing</a></li>
					<li class="nav-item"><a href="#" class="nav-link">FAQs</a></li>
					<li class="nav-item"><a href="#" class="nav-link">About</a></li>
				</ul>
			</header>
		</div>
	</main>	
		<div class="flex-shrink-0 p-3"
			style="width: 280px; background-color: gray;">
			<a href="/"
				class="d-flex align-items-center pb-3 mb-3 link-body-emphasis text-decoration-none border-bottom">
				<svg class="bi pe-none me-2" width="30" height="24">
					<use xlink:href="#bootstrap"></use></svg> <span class="fs-5 fw-semibold">Collapsible</span>
			</a>
			<ul class="list-unstyled ps-0">
				<li class="mb-1">
					<button
						class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
						data-bs-toggle="collapse" data-bs-target="#home-collapse"
						aria-expanded="false">Home</button>
					<div class="collapse" id="home-collapse" style="">
						<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
							<li><a href="#"
								class="link-body-emphasis d-inline-flex text-decoration-none rounded">Overview</a></li>
							<li><a href="#"
								class="link-body-emphasis d-inline-flex text-decoration-none rounded">Updates</a></li>
							<li><a href="#"
								class="link-body-emphasis d-inline-flex text-decoration-none rounded">Reports</a></li>
						</ul>
					</div>
				</li>
				<li class="mb-1">
					<button
						class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
						data-bs-toggle="collapse" data-bs-target="#dashboard-collapse"
						aria-expanded="false">Dashboard</button>
					<div class="collapse" id="dashboard-collapse" style="">
						<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
							<li><a href="#"
								class="link-body-emphasis d-inline-flex text-decoration-none rounded">Overview</a></li>
							<li><a href="#"
								class="link-body-emphasis d-inline-flex text-decoration-none rounded">Weekly</a></li>
							<li><a href="#"
								class="link-body-emphasis d-inline-flex text-decoration-none rounded">Monthly</a></li>
							<li><a href="#"
								class="link-body-emphasis d-inline-flex text-decoration-none rounded">Annually</a></li>
						</ul>
					</div>
				</li>
				<li class="mb-1">
					<button
						class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
						data-bs-toggle="collapse" data-bs-target="#orders-collapse"
						aria-expanded="false">Orders</button>
					<div class="collapse" id="orders-collapse" style="">
						<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
							<li><a href="#"
								class="link-body-emphasis d-inline-flex text-decoration-none rounded">New</a></li>
							<li><a href="#"
								class="link-body-emphasis d-inline-flex text-decoration-none rounded">Processed</a></li>
							<li><a href="#"
								class="link-body-emphasis d-inline-flex text-decoration-none rounded">Shipped</a></li>
							<li><a href="#"
								class="link-body-emphasis d-inline-flex text-decoration-none rounded">Returned</a></li>
						</ul>
					</div>
				</li>
				<li class="border-top my-3"></li>
				<li class="mb-1">
					<button
						class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
						data-bs-toggle="collapse" data-bs-target="#account-collapse"
						aria-expanded="false">Account</button>
					<div class="collapse" id="account-collapse" style="">
						<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
							<li><a href="#"
								class="link-dark d-inline-flex text-decoration-none rounded">New...</a></li>
							<li><a href="#"
								class="link-dark d-inline-flex text-decoration-none rounded">Profile</a></li>
							<li><a href="#"
								class="link-dark d-inline-flex text-decoration-none rounded">Settings</a></li>
							<li><a href="#"
								class="link-dark d-inline-flex text-decoration-none rounded">Sign
									out</a></li>
						</ul>
					</div>
				</li>
			</ul>
		</div>
		<div class="b-example-divider b-example-vr"></div>
	</body>
</html>