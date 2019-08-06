<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title></title>
    <link href="https://fonts.googleapis.com/css?family=Quicksand&display=swap" rel="stylesheet">
</head>

<body>
<style>
    main{
        padding-top:0px !important;
        background-color: #1178BA;
    }
</style>
<div class="row">
    <table class="w-100" style=" height: 300px; color:white; ">
        <tbody>
        <tr style="font-family: 'Quicksand', sans-serif;">
            <td class="align-middle text-center">
                <g:if test="${ person.avatar == null}">

                    <img class="img-responsive img-rounded" style="width: 200px; height:200px; border-radius: 50%;" src="https://raw.githubusercontent.com/azouaoui-med/pro-sidebar-template/gh-pages/src/img/user.jpg"
                         alt="User picture">
                </g:if>
                <g:if test="${ person.avatar != null}">
                    <img class="img-responsive img-rounded"  style="width: 200px; height:200px; border-radius: 50%;"  src="http://localhost:8089/signUp/displayAvatarForCurrentUser"
                         alt="User picture">

                </g:if>
                <h5 class="mt-4" style="font-weight: bold; font-size: 26pt;">Semih ÜNAL</h5>
            </td>
        </tr>
        </tbody>
    </table>
</div>
<div class="row pt-5 pb-4" >
<div class="col-md-4">
    <div class="card p-3" style="">
        <ul class="list-group list-group-flush" style="border:1px solid #abc;">
            <li class="list-group-item">Profil</li>
            <li class="list-group-item">Hakkında</li>
            <li class="list-group-item">Fotoğraflar</li>
            <li class="list-group-item">Profil Düzenle</li>

        </ul>
    </div>

</div>
<div class="col-md-8">
<div class="card text-center">

    <div class="card-body">

        <textarea style="width: 100%;"></textarea>


        <div class="col-md-12 text-right">
            <button style="" class="btn btn-success mt-2">Post</button>
        </div>

    </div>

</div>
    <div class="card mb-3 mt-4">
        <img src="https://image.shutterstock.com/image-photo/designers-desk-responsive-web-design-600w-295217774.jpg" class="card-img-top" alt="...">
        <div class="card-body">
            <h5 class="card-title">Card title</h5>
            <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
            <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
        </div>
    </div>
</div>
</div>
<div class="card-columns">
    <div class="card">
        <g:if test="${ person.avatar == null}">

            <img class="card-img-top img-responsive img-rounded" src="https://raw.githubusercontent.com/azouaoui-med/pro-sidebar-template/gh-pages/src/img/user.jpg"
                 alt="User picture">
        </g:if>
        <g:if test="${ person.avatar != null}">
            <img class="card-img-top img-responsive img-rounded" src="http://localhost:8089/signUp/displayAvatarForCurrentUser"
                 alt="User picture">

        </g:if>
        <div class="card-body">
            <h5 class="card-title">Card title that wraps to a new line</h5>
            <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
        </div>
    </div>
    <div class="card p-3">
        <blockquote class="blockquote mb-0 card-body">
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>
            <footer class="blockquote-footer">
                <small class="text-muted">
                    Someone famous in <cite title="Source Title">Source Title</cite>
                </small>
            </footer>
        </blockquote>
    </div>
    <div class="card">
        <img src="..." class="card-img-top" alt="...">
        <div class="card-body">
            <h5 class="card-title">Card title</h5>
            <p class="card-text">This card has supporting text below as a natural lead-in to additional content.</p>
            <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
        </div>
    </div>
    <div class="card bg-primary text-white text-center p-3">
        <blockquote class="blockquote mb-0">
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat.</p>
            <footer class="blockquote-footer text-white">
                <small>
                    Someone famous in <cite title="Source Title">Source Title</cite>
                </small>
            </footer>
        </blockquote>
    </div>
    <div class="card text-center">
        <div class="card-body">
            <h5 class="card-title">Card title</h5>
            <p class="card-text">This card has a regular title and short paragraphy of text below it.</p>
            <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
        </div>
    </div>
    <div class="card">
        <img src="..." class="card-img-top" alt="...">
    </div>
    <div class="card p-3 text-right">
        <blockquote class="blockquote mb-0">
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>
            <footer class="blockquote-footer">
                <small class="text-muted">
                    Someone famous in <cite title="Source Title">Source Title</cite>
                </small>
            </footer>
        </blockquote>
    </div>
    <div class="card">
        <div class="card-body">
            <h5 class="card-title">Card title</h5>
            <p class="card-text">This is another card with title and supporting text below. This card has some additional content to make it slightly taller overall.</p>
            <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
        </div>
    </div>
</div>
</body>
</html>