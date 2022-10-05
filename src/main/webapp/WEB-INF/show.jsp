<%--
  Created by IntelliJ IDEA.
  User: nisrinekane
  Date: 10/4/22
  Time: 6:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/styles.css"/>
<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<html>
<head>
  <title>Show Language</title>
</head>
<body>
<button><a href="/languages">Dashboard</a></button>
<div class="card">
  <div class="title">
    <h1>Language: ${languages.name}</h1>
  </div>
  <div class="body">
    <p>Creator: ${languages.creator} </p>
    <p>version: ${languages.version}</p>
  </div>
</div>
<div  class="d-flex justify-content-around">
  <a class="btn btn-warning" href="/languages/${language.id}/edit" >edit</a>
  <form action="/languages/${language.id}" method="post">
    <input type="hidden" name="_method" value="delete">
    <input type="submit" value="Delete" class="btn btn-danger">
  </form>
</div>
</body>
</html>
