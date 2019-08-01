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
                        <button class="btn btn-success"  data-toggle="modal" data-target="#exampleModalCenter">New Post</button>
                    </sec:ifAllGranted>
                </div>
</div>
</div>
</div>
</div>




<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">

                <g:form action="createPost" controller="post" name="recipeForm">
                    <fieldset class="form">
                        <div class="form-group">
                        <label for="title">Title</label>
                        <g:field type="text" name="title" class="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="Description">Description</label>
                            <g:field type="text" name="description" class="form-control" />
                        </div>

                        <div class="form-group">
                            <label for="username">Username</label>
                            <g:field type="text" name="username" class="form-control" />
                        </div>
                    </fieldset>

                    <fieldset class="buttons">
                        <g:submitButton name="create" value="Oluştur" class="btn btn-success form-control" />
                    </fieldset>


                </g:form>



                <!--

                <g:form name="createPost" action="createPost" id="1">
                    <div class="form-group">
                        <label for="title">Title</label>
                        <input type="text" class="form-control" name="title" id="title" placeholder="Enter title">

                    </div>
                    <div class="form-group">
                        <label for="Description">Description</label>
                        <input type="text" class="form-control" name="description" id="description" placeholder="Enter description">

                    </div>
                    <div class="form-group">
                        <label for="username">Username</label>
                        <input type="text" class="form-control" id="username" name="username" placeholder="Enter username">

                    </div>
                    <div class="col-md-12 text-center">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-success">Submit</button>
                    </div>
                </g:form>

                -->
            </div>

        </div>
    </div>
</div>
</body>
</html>