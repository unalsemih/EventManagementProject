<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 20-Aug-19
  Time: 11:38
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title></title>
</head>

<body>
<table class="table table-dark">
    <thead>
    <tr>
        <th scope="col">#</th>
        <th scope="col">Grup İsmi </th>
        <th scope="col">Kullanıcı Adı</th>
        <th scope="col">Durum</th>
    </tr>
    </thead>
    <tbody>
    <g:each var="${request}" in="${requests}">
        <tr>
            <th scope="row">1</th>
            <td>${request.groupname}</td>
            <td>${request.username}</td>

            <td>
                <g:link class="btn btn-sm btn-success" controller="community" action="join"  params="[groupId:request.requests.userId]">
                Onayla</g:link>
                <g:link class="btn btn-sm btn-danger" controller="community" action="deleteRequest" params="[groupId:0]">
                    Sil</g:link>
            </td>
        </tr>
    </g:each>


    </tbody>
</table>
</body>
</html>