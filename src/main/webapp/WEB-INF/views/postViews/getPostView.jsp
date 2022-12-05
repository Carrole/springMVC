<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Syntax Sugar Post</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
		  integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

	<style>
		html, body {
			height: 100%;
		}

		body {
			background-color: rgb(53, 63, 79);
		}

		#post {
			margin: auto;
			width: 80%;
			height: 90%;
			background-color: white;
			border-radius: 1rem;
			/*box-shadow: ;*/
			padding: 1rem;
		}

		#viewed {
			height: 80% !important;
		}

		.delete:hover, .modify:hover {
			background-color: rgb(53, 63, 79);
			color: white;
		}

		.list {
			background-color: rgb(53, 63, 79);
		}

		.list:hover {
			background-color: black;
		}

		#comment-div {
			width: 100%;
		}

		#comment-btn {
			width: 90px;
		}
		#comment-btn:hover {
			background-color: rgb(53, 63, 79);
		}

	</style>
</head>
<script type="text/javascript">
	const insertNickname = () => {
		document.getElementById("nickname").value = localStorage.getItem("currentUser");
	}
</script>
<body class="justify-content-center align-middle d-flex">
	<div id="post">
		<div class="justify-content-between d-flex">
			<h2>${post.title}</h2>
			<button type="button" class="btn btn-light" id="viewed">
				조회수 <span class="badge bg-secondary">${post.viewed}</span>
			</button>
		</div>
		<div class = "card mb-3">
			<div class="card-body p-2">
	<%--			<h4 class="card-title">${post.title}</h4>--%>
				<p class ="card-text mb-2 text-muted text-end">작성자 : ${post.nickname}</p>
				<p class="card-text">${post.content}</p>
				<p class ="card-footer mb-2 text-muted text-end fs-6 fw-light p-1">작성일 : ${post.created_at}</p>
			</div>
		</div>
		<div class="d-flex justify-content-end mb-4">
			<button type="button" class="btn btn-light mx-1 modify" id="modify" onclick="location.href='modifyPost.do?seq=${post.seq}'">
				수정
			</button>
			<button class = "btn btn-light mx-1 delete" type="button" id="delete" onclick="location.href='deletePost.do?seq=${post.seq}'">
				삭제
			</button>
			<button type="button" class ="btn btn-secondary ms-1 list" onclick="location.href='getPostList.do'">
				목록
			</button>
		</div>
		<h4>댓글 (${commentCount})</h4>
		<hr>
		<form action="/insertComment.do" method="get">
			<input class="d-none" name="post_id" value="${post.seq}" />
			<input class="d-none" name="nickname" id="nickname" />
			<div class="d-inline-flex" id="comment-div">
				<textarea class="form-control d-inline-block me-3" rows="3" name="content" id="comment-text"></textarea>
				<button class = "btn btn-secondary d-inline-block" type="submit" onclick="insertNickname()" id="comment-btn">등록</button>
			</div>
		</form>
		<table class = "table align-middle">

		<c:choose>
			<c:when test="${message eq 'success'}">
				<c:forEach items="${clist}" var="comment">
					<tr>
						<td>${comment.nickname}</td>
						<td>${comment.content}</td>
						<td>${comment.created_at}</td>
						<td><button class="btn btn-secondary deleteComment" id="deleteComment" type="button" value="${comment.nickname}"
									onclick="location.href='deleteComment.do?seq=${comment.seq}'">X</button></td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td><p>아직 댓글이 없습니다. 댓글을 달아보세요!</p></td>
				</tr>
			</c:otherwise>
		</c:choose>

		</table>


	</div>
</body>
<script type="text/javascript">
	const user = localStorage.getItem("currentUser");

	if (user === null || user === undefined) {
		alert("로그인 해주세요");
		window.location.href="/login.do";
	}

	if(user !== "${post.nickname}") {
		console.log("no");
		document.getElementById("modify").style.display='none';
		document.getElementById("delete").style.display='none';
	}
	const deleteButtons = document.getElementsByClassName("deleteComment");
	for(let i = 0; i < deleteButtons.length; i++) {
		if (deleteButtons[i].value !== user) {
			deleteButtons[i].style.display = "none";
		}
	}
</script>
</html>