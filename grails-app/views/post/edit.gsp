<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 21-Aug-19
  Time: 13:51
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title></title>
</head>

<body>
    <div class="card">
        <g:form action="createPost" controller="post">
            <fieldset class="form">
                <div class="form-group">
                    <label >Event Type</label>
                    <select class="form-control" name="type" id="comboboxTypeModal">


                        <option value="fun">Eğlence</option>
                        <option value="education">Eğitim</option>
                    </select>
                </div>
                <div class="form-group">
                    <label >Category</label>
                    <select class="form-control" name="categoryId" id="categoryModal">
                    </select>
                </div>
                <div class="form-group">
                    <label for="title">Title</label>
                    <g:field required type="text" name="title" class="form-control" />
                </div>
                <div class="form-group">
                    <label for="Description">Description</label>
                    <g:field required type="text" name="description" class="form-control" />
                </div>


                <div class="form-group">
                    <label for="quota">Kontenjan</label>
                    <g:field required type="number" name="quota" class="form-control" value="10" />
                </div>
                <div class="form-group">
                    <label for="startDate">Start</label>
                    <g:field type="datetime-local" value="2019-08-06T00:00:00" name="startDate" id="modalStartDate" class="form-control" />
                </div>
                <div class="form-group">
                    <label for="endDate">End</label>
                    <g:field type="datetime-local" value="2011-08-06T00:00:00"  id="modalEndDate" name="endDate" class="form-control" />
                </div>
                <div class="form-group">
                    <label for="username">Username</label>
                    <g:field type="text" name="username" readonly class="form-control" value="${currentUser.username}" />
                </div>
            </fieldset>
            <div class="col-md-12 text-center">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                <g:submitButton name="create" value="Oluştur" class="btn btn-success " />

            </div>
        </g:form>
    </div>
</body>
</html>