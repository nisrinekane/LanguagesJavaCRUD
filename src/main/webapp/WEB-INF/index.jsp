<%--
  Created by IntelliJ IDEA.
  User: nisrinekane
  Date: 10/4/22
  Time: 5:15 PM
  To change this template use File | Settings | File Templates.
--%>
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
  <title>languages</title>
</head>
<body>
<h1>All Languages</h1>
<table class="table table-striped">
  <thead>
  <tr>
    <th scope="col">Language</th>
    <th scope="col">Creator</th>
    <th scope="col">Version</th>
  </tr>
  </thead>
  <tbody>
  <!-- loop over all the languages to show the details as in the wireframe! -->
  <c:forEach items="${languages}" var="language">
    <tr>
      <td><a href="/languages/${language.id}"><c:out value="${language.name}" /></a></td>
      <td><c:out value="${language.creator}" /></td>
      <td><c:out value="${language.version}" /></td>
      <td><a class="btn btn-warning" href="/languages/${language.id}/edit" >edit</a> </td>
      <td>
        <form action="/languages/${language.id}" method="post">
          <input type="hidden" name="_method" value="delete">
          <input type="submit" value="Delete" class="btn btn-danger">
        </form>
      </td>
    </tr>
  </c:forEach>
  </tbody>
</table>

<%--add form: to expose all form attributes to data binding--%>
<form:form action="/language" method="POST" modelAttribute="language">
  <div class="form-group">
    <form:label path="name">Language Name</form:label>
    <form:input path="name" />
  </div>
  <div><form:errors path="name" class="text-danger" /></div>
  <div class="form-group">
    <form:label path="creator">Language Creator</form:label>
    <form:input path="creator" />
  </div>
  <div><form:errors path="creator" class="text-danger" /></div>
  <div class="form-group">
    <form:label path="version">Language Version</form:label>
    <form:input type="text" path="version" />
  </div>
  <div><form:errors path="version" class="text-danger" /></div>
  <input type="submit" value="Submit" class="btn btn-dark" />
</form:form>
</body>
</html>

