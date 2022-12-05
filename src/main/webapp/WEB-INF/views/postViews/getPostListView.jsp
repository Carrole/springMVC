<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Syntax Sugar Posts</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
		  integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

	<style>
		.custom-container {
			width: 100%;
		}
		#nav {
			height: 70px;
			width: 100%;
			background-color: rgb(53, 63, 79);
		}

		#search-form {
			width: 100%;
		}
		#search-input {
			width: 60%;
		}
		.btn {
			background-color: rgb(53, 63, 79) !important;
		}

		.form-select {
			width: 25% !important;
			margin: 0 0.5rem;
		}
		#search-btn {
			width: 15% !important;
			margin: 0 0.5rem;
		}
		#search-div {
			width: 60% !important;
			margin: 0 0.5rem;
		}

		#content {
			width: 90%;
			margin: 2rem auto;
		}

		#logout-btn {
			cursor: pointer;
		}

		#logout-btn:hover {
			text-decoration: underline;
		}

		.table-dark {
			background-color: rgb(53, 63, 79) !important;
		}
		#title-col {
			width: 50%;
		}
	</style>

</head>
<script type="text/javascript">
	if("${message}" === "success") {
		localStorage.setItem("currentUser", "${currentUser}")
	}
</script>
<body>
	<div class="custom-container">
		<nav class="navbar bg-light px-4 d-inline-flex justify-content-between align-center" id="nav">
			<div class="d-inline-flex">
				<h1 class="d-inline">{ Syntax Sugar }</h1>
			</div>
			<div class="d-inline-flex" id="search-div">
				<form class="d-flex" method="post" action="searchPostList.do" id="search-form">
					<select name="searchCon" class="d-inline form-select">
						<option value="title">제목</option>
						<option value="content">글 내용</option>
						<option value="users">작성자</option>
					</select>
					<input class="d-inline form-control me-2" type="text" name="searchKey" id="search-input">
					<button class="d-inline btn btn-secondary" class="btn btn-outline-success" type="submit" id="search-btn">검색</button>
				</form>
			</div>
			<div class="d-inline-flex">
				<span class="navbar-brand mb-0 h1" id="currentUser"></span>
				<span class="navbar-brand mb-0 h3" onclick="logout()" id="logout-btn">로그아웃</span>
			</div>
		</nav>
		<div class="container-flex" id="content">
			<h2>익명 커뮤니티</h2>
			<table class = "table table-hover table align-middle">
				<tr class = "table-dark text-center">
					<td>#</td>
					<td id="title-col">제목</td>
					<td>작성자</td>
					<td>작성 일시</td>
					<td>조회</td>
				</tr>
				<c:forEach items="${plist}" var="post">
					<tr>
						<td class="text-center">${post.seq}</td>
						<td class="text-center"><a href="getPost.do?seq=${post.seq}&viewed=${post.viewed}"> ${post.title}</a></td>
						<td class="text-center">${post.nickname}</td>
						<td class="text-center">${post.created_at}</td>
						<td class="text-center">${post.viewed}</td>

					</tr>
				</c:forEach>
			</table>
			<button class="btn btn-dark float-end" type = "button" onclick="location.href='/insertPost.do'">글쓰기</button>
		</div>
	</div>
</body>
<script type="text/javascript">
	if (localStorage.getItem("currentUser") === null || localStorage.getItem("currentUser") === undefined) {
		alert("로그인 해주세요");
		window.location.href="/login.do";
	}

	function logout() {
		localStorage.clear();
		window.location.href = "/login.do";
	}

	const currentUserDOM = document	.getElementById("currentUser").innerText = localStorage.getItem("currentUser") + "님";
</script>
</html>