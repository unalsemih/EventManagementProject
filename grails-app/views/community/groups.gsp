<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 19-Aug-19
  Time: 15:20
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title></title>
</head>

<body>
<div class="row">
    <button class="btn btn-info" data-toggle="modal" data-target="#createGroup">Yeni Post Oluştur</button>
</div>
<g:each var="group" in="${groups}">
<div class="card">
    <h5 class="card-header">${group.name}</h5>
    <div class="card-body">

        <p class="card-text">${group.description} Lorem ipsum dolor sit amet, consectetur adipisicing elit. Adipisci, cum earum est explicabo facilis nam necessitatibus praesentium quae quis reprehenderit veritatis vero vitae voluptatem. Earum est exercitationem nihil ullam velit?</p>
        <div class="row">
            <div class="col-md-9">Bu grupta ${group.number} üye bulunmaktadır.</div>
        <div class="col-md-3 text-right">
        <a href="#" class="btn btn-success">Katıl</a>
        </div>
        </div>
    </div>
</div>
</g:each>

<div class="modal" tabindex="-1" role="dialog" id="createGroup">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Grup Adı</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <g:form action="createGroup" controller="community" >
                    <g:hiddenField name="userId" value="${currentUser.id}" />
                    <div class="form-group">
                        <label>Grup Adı</label>
                        <input type="text" class="form-control" name="name"  placeholder="Grup Adı">
                    </div>
                    <div class="form-group">
                        <label>Grup Açıklaması</label>
                        <input type="text" class="form-control" name="description" id="exampleInputPassword1" placeholder="Açıklama">
                    </div>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">İptal</button>

                    <button type="submit" class="btn btn-primary">Oluştur</button>
                </g:form>
            </div>
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>


</body>
</html>