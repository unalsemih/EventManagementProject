<%--
  Created by IntelliJ IDEA.
  User: Semih
  Date: 3.08.2019
  Time: 01:25
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>
<div class="row">
    <sec:ifLoggedIn>Merhaba
        <img src="http://localhost:8089/signUp/displayAvatarForCurrentUser"/>
    </sec:ifLoggedIn>
</div>
<div class="row" style="background-color: #0f6674;">

    <img src="/${createLink(action:'displayAvatarForCurrentUser')}" />

<g:uploadForm action="upload">

    Photo: <input name="photo" type="file" />
    <g:submitButton name="upload" value="Upload"/>
</g:uploadForm>


</div>
<g:form action="newPerson" controller="signUp">
    <fieldset class="form">
        <div class="form-group">
            <label for="username">Username</label>
            <g:field type="text" name="username" class="form-control" />
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <g:field type="text" name="password" class="form-control" />
        </div>

        <div class="form-group">
            <label for="username">Username</label>
            <g:field type="text" name="username" class="form-control" />
        </div>
    </fieldset>
    <div class="col-md-12 text-center">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>


    </div>

</g:form>

</body>
</html>