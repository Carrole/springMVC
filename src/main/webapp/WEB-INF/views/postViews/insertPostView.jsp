<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Add Post</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
		rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
		<style>
			html, body {
				height: 100%;
			}

			body {
				background-color: rgb(53, 63, 79);
			}
			#insert-form {
				margin: auto;
				width: 80%;
				height: 90%;
				background-color: white;
				border-radius: 1rem;
				/*box-shadow: ;*/
				padding: 1rem;
			}
			.add:hover {
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
	</head>
<script type="text/javascript">
	const user = localStorage.getItem("currentUser");

	if (user === null || user === undefined) {
		alert("로그인 해주세요");
		window.location.href="/login.do";
	}

	const userId = () => {
		document.getElementById("nickname").value = user;
	}
</script>
<body class="justify-content-center align-middle d-flex">
	<div id="insert-form">
		<h2>글 쓰기</h2>
		<form action="insertProcPost.do" method="get">
			<label class="form-label">글 제목</label>
			<input type="text" class="form-control" name="title">

			<label class="form-label">글 내용</label>
			<textarea class="form-control mb-3" rows="5" name="content"></textarea>

			<input name="nickname" id="nickname" class="d-none" />

			<div class="d-flex justify-content-end mb-4">
				<button class="btn btn-light mx-1 add" type="submit" onclick="userId()">등록</button>
				<button class="btn btn-secondary ms-1 list" type="button" onclick="location.href='/getPostList.do'">목록</button>
			</div>
		</form>
	</div>
</body>
</html>