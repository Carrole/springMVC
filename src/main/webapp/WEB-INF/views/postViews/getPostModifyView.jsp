<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Post</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	  rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style>
	html, body {
		height: 100%;
	}

	body {
		background-color: rgb(53, 63, 79);
	}

	#modify-form {
		margin: auto;
		width: 80%;
		height: 90%;
		background-color: white;
		border-radius: 1rem;
		/*box-shadow: ;*/
		padding: 1rem;
	}

	.modify:hover {
		background-color: rgb(53, 63, 79);
		color: white;
	}

	.list {
		background-color: rgb(53, 63, 79);
	}

	.list:hover {
		background-color: black;
	}
</style>
<body class="justify-content-center align-middle d-flex">

<div id="modify-form">
	<h2>게시글 수정</h2>
	<form action="modifyProcPost.do?seq=${post.seq}" method="post">
	<div class = "card mb-3">
		<div class="card-body">
			<label for="title" class="form-label">제목</label>
			<input type="text" class="form-control" name="title" value="${post.title}" id="title">
			<label for="content" class="form-label">내용</label>
			<textarea class="form-control summernote" rows="5" name="content" id="content">${post.content}</textarea>
		</div>
	</div>
	<div class="d-flex justify-content-end mb-4">
		<button type="submit" class="btn btn-light mx-1 modify">수정</button>
		<button type="button" class ="btn btn-secondary ms-1 list" onclick="location.href='getPostList.do'">목록</button></td>
	</div>
	</form>
</div>
</body>
<script type="text/javascript">
	const user = localStorage.getItem("currentUser");

	if (user === null || user === undefined) {
		alert("로그인 해주세요");
		window.location.href="/login.do";
	}
</script>
</html>