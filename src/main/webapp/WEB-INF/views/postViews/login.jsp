<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
  <meta name="generator" content="Hugo 0.88.1">
  <title>Login</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  <meta name="theme-color" content="#7952b3">


  <style>
      html,
      body {
          height: 100%;
      }

      .body-style {
          display: flex;
          align-items: center;
          padding-top: 40px;
          padding-bottom: 40px;
          background-color: #f5f5f5;
      }

      .form-signin {
          width: 35%;
          max-width: 400px;
          padding: 15px;
          min-width: 300px;
      }

      .form-signin .form-floating:focus-within {
          z-index: 2;
      }

      .form-signin input[type="text"] {
          margin-bottom: -1px;
          border-bottom-right-radius: 0;
          border-bottom-left-radius: 0;
      }

      .form-signin input[type="password"] {
          margin-bottom: 10px;
          border-top-left-radius: 0;
          border-top-right-radius: 0;
      }

      .btn {
          background-color: rgb(53, 63, 79) !important;
      }
      .btn-primary {
          border: none !important;
      }

      a {
          color: rgb(53, 63, 79) !important;
      }

      .brand {
          font-size: 5rem;
      }
  </style>
</head>
<body class="text-center body-style justify-content-center align-middle flex-column">
<h1 class="mb-5 brand">{ Syntax Sugar }</h1>
<main class="form-signin">
    <div class="container">
        <form action="/loginProc.do" method="get">
            <h1 class="h3 mb-3 fw-normal">로그인</h1>

            <c:if test="${message eq 'invalid'}">
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    잘못된 비밀번호입니다.
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </c:if>

            <c:if test="${message eq 'none'}">
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    존재하지 않는 닉네임입니다.
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </c:if>

            <div class="form-floating">
                <input type="text" class="form-control" id="floatingInput" placeholder="Your Nickname" name="nickname">
                <label for="floatingInput">Nickname</label>
            </div>
            <div class="form-floating">
                <input type="password" class="form-control" id="floatingPassword" placeholder="Your Password" name="password" minlength="8">
                <label for="floatingPassword">Password</label>
            </div>

            <button class="w-100 btn btn-lg btn-primary mb-3" type="submit">Login</button>
            <p>아직 회원이 아니라면? </p>
            <a href="/signup.do ">회원가입하기</a>
        </form>
    </div>
</main>
</body>
</html>

