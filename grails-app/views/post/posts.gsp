<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 31-Jul-19
  Time: 14:48
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title></title>
</head>

<body>
<div class="container">

    <sec:ifAllGranted roles="ROLE_USER">
        secure stu
    </sec:ifAllGranted>


    <div class="row mt-5">
        <div class="card shadow-lg p-3 mb-5 bg-white rounded" style="width: 75rem; margin:0px auto;">
            <div class="card-body">
                <h3 style="text-align:center">Etkinlikler</h3>
<table class="table table-dark">
    <thead>
    <tr>
        <th scope="col">#</th>
        <th scope="col">Title</th>
        <th scope="col">Description</th>
        <th scope="col">Username</th>
        <sec:ifAllGranted roles="ROLE_USER">
        <th scope="col">Durum</th>
        </sec:ifAllGranted>
        <sec:ifAllGranted roles="ROLE_ADMIN">
            <th scope="col">Katılım</th>

        </sec:ifAllGranted>
    </tr>
    </thead>
    <tbody>




    <g:each var="post" in="${allposts}">

        <tr>
            <th scope="row">3</th>

            <td>${post.title}</td>
            <td> ${post.description}</td>
            <td>${post.username}</td>
            <sec:ifAllGranted roles="ROLE_USER">
                <td><button class="btn btn-success">Katıl</button></td>
            </sec:ifAllGranted>
            <sec:ifAllGranted roles="ROLE_ADMIN">
                <td>${post.number}</td>
            </sec:ifAllGranted>

        </tr>
    </g:each>



    </tbody>
</table>
                <div class="col-md-12 text-center mt-3 mb-0">
                    <sec:ifAllGranted roles="ROLE_ADMIN">
                        <button class="btn btn-success">New Post</button>
                    </sec:ifAllGranted>
                </div>
</div>
</div>
</div>
</div>





</body>
</html>