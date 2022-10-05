<%--
  Created by IntelliJ IDEA.
  User: nisrinekane
  Date: 10/4/22
  Time: 5:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: nisrinekane
  Date: 10/4/22
  Time: 2:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page isErrorPage="true" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
  <title>Edit Languages</title>
</head>
<body>
<h1>Edit languages</h1>

<div class="d-flex justify-content-around">
    <form action="/languages/${language.id}" method="post">
      <input type="hidden" name="_method" value="delete">
      <input type="submit" value="Delete" class="btn btn-danger">
    </form>
  <a class="btn btn-primary" href="/languages">Dashboard</a>
</div>

<form:form action="/languages/${language.id}" method="post" modelAttribute="language" class="form">
  <input type="hidden" name="_method" value="put">
  <p class="form-group">
    <form:label path="name">Name of Language</form:label>
    <form:errors path="name"/>
    <form:input path="name"/>
  </p>
  <p class="form-group">
    <form:label path="creator">Creator</form:label>
    <form:errors path="creator"/>
    <form:textarea path="creator"/>
  </p>
  <p class="form-group">
    <form:label path="version">Version</form:label>
    <form:errors path="version"/>
    <form:input path="version"/>
  </p>
  <input type="submit" value="Submit" class="btn btn-dark"/>
</form:form>
</body>
</html>

