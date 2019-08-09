
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title></title>
</head>

<body>
<div class="row shadow-lg p-3 mb-5 bg-white rounded">
    <div class="col-md-6">
        <table class="w-100 " style=" height: 350px; color:black; background-color: white; ">
            <tbody>
            <tr style="font-family: 'Quicksand', sans-serif;">
                <td class="align-middle text-center">
                    <h5 style="font-weight:bold">${post.title}</h5>

                    <hr style="width: 70%; ">
                    <g:if test="true">

                        <img class="img-responsive img-rounded" style="width: 200px;" src="https://seeklogo.com/images/H/havelsan-logo-2606D75C51-seeklogo.com.png"
                             alt="User picture">
                    </g:if>
                    <hr style="width: 70%; ">
                    <h5 style="font-weight:bold">${post.title}</h5>

                </td>
            </tr>
            </tbody>
        </table>
    </div>

    <div class="col-md-6">
        <table class="w-100 " style=" height: 350px; color:black; background-color: white; ">
            <tbody>
            <tr style="font-family: 'Quicksand', sans-serif;">
                <td class="align-middle text-center">
                    <div class="form-group row" style="font-size: 15pt; ">
                        <label class="col-sm-4 col-form-label"  style="font-weight: bold; text-align:left">Etkinlik Adı</label>
                        <div class="col-sm-6">
                            <input type="text" readonly class="form-control-plaintext" value="${post.title}">
                        </div>
                    </div>

                    <div class="form-group row"  style="font-size: 14pt; ">
                        <label   r="staticEmail" class="col-sm-4 col-form-label"  style="font-weight: bold; text-align:left">Katılım</label>
                        <div class="col-sm-6">
                            <input type="text" readonly class="form-control-plaintext" value="${post.number}/${post.quota}">
                        </div>
                    </div>
                    <div class="form-group row" style="font-size: 14pt; ">
                        <label  class="col-sm-4 col-form-label"   style="font-weight: bold; text-align:left">Kontenjan</label>
                        <div class="col-sm-6">
                            <input type="text" readonly class="form-control-plaintext" value="${post.quota}">
                        </div>
                    </div>
                    <div class="form-group row" style="font-size: 14pt; ">
                        <label class="col-sm-4 col-form-label"  style="font-weight: bold; text-align:left">Detaylar</label>
                        <div class="col-sm-6">
                            <input type="text" readonly class="form-control-plaintext" value="${post.description}">
                        </div>
                    </div>
                    <hr>
                    <h6>
                        <g:if test="${user.photo}">

                            <img class="card-img-top mt-2 img-fluid img-thumbnail" style="border-radius: 50%;width:80px; height:80px; object-fit: cover;" src="http://localhost:8089/signUp/displayAvatarForCurrentUser" alt="Card image cap">

                        </g:if>
                        <g:if test="${user.photo==false}">

                            <img class="card-img-top mt-2 img-fluid img-thumbnail" style="border-radius: 50%;width:80px; height:80px; object-fit: cover;" src="https://raw.githubusercontent.com/azouaoui-med/pro-sidebar-template/gh-pages/src/img/user.jpg" alt="Card image cap">

                        </g:if>
                        <a href="../person/profile?username=${post.username}"> ${post.username}</a> tarafından oluşturuldu</h6>
                </td>
            </tr>
            </tbody>
        </table>

    </div>
    <div class="col-md-12">
        <div class="row ">
            <div style="margin-left:auto; margin-right: auto;">
                <button class="btn btn-primary">Fotoğraf Ekle</button>
                <button class="btn btn-primary" data-toggle="modal" data-target="#createPostModal">Post Ekle</button>
                <button class="btn btn-primary">Etkinlik Ayarları</button>
            </div>
        </div>
    </div>
</div>

<div class="row">

    <div class="col-md-12 h-100">
        <div class="card">
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="d-block w-100" style="height:350px;  object-fit: cover;" src="https://cdn.pixabay.com/photo/2019/08/06/12/15/panama-4388225_960_720.jpg" alt="First slide">
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100 " style="height:350px;  object-fit: cover;" src="https://cdn.pixabay.com/photo/2019/08/07/06/31/lake-4389964_960_720.jpg" alt="Second slide">
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" style="height:350px;  object-fit: cover;" src="https://cdn.pixabay.com/photo/2018/01/21/17/43/lisbon-3097112_960_720.jpg" alt="Third slide">
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>
    </div>

</div>
<div class="row mt-4 shadow-lg p-3 mb-2 bg-white rounded">
    <div class="col-md-12">
        <div class="card mb-3">
            <div class="card-body">
                <h5 class="card-title">Etkinliğe kesinlikle katılmanızı öneririz!</h5>
                <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.
                This content is a little bit longer. This content is a little bit longer. This content is a little bit longer. This content is a little bit longer.</p>
                <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
            </div>
        </div>
        <h4 class="" style="font-weight: bold"><span class="fa fa-plus"></span> Yorumlar</h4>
        <div class="media">
            <img  style="width: 80px; border-radius: 50%;" class="mr-3 img-thumbnail" src="https://raw.githubusercontent.com/azouaoui-med/pro-sidebar-template/gh-pages/src/img/user.jpg" alt="Generic placeholder image">
            <div class="media-body">
                <h5 class="mt-0">Media heading</h5>
                Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
                <div class="row mt-2 pl-4"><button class="btn btn-sm btn-primary">Cevapla</button></div>
                <div class="media mt-3">
                    <a class="pr-3" href="#">
                        <img class="img-thumbnail" style="width: 80px; border-radius: 50%;" src="https://raw.githubusercontent.com/azouaoui-med/pro-sidebar-template/gh-pages/src/img/user.jpg" alt="Generic placeholder image">
                    </a>
                    <div class="media-body">
                        <h5 class="mt-0">Media heading</h5>
                        Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
                    </div>
                </div>
            </div>
        </div>
        <div class="media mt-4">
            <img class="mr-3 img-thumbnail" style="width: 80px; border-radius: 50%;" src="https://raw.githubusercontent.com/azouaoui-med/pro-sidebar-template/gh-pages/src/img/user.jpg" alt="Generic placeholder image">
            <div class="media-body">
                <h5 class="mt-0">Media heading</h5>
                Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
                <div class="row mt-2 pl-4"><button class="btn btn-sm btn-primary">Cevapla</button></div>

                <div class="media mt-3">
                    <a class="pr-3" href="#">
                        <img class="img-thumbnail"  style="width: 80px; border-radius: 50%;" src="https://raw.githubusercontent.com/azouaoui-med/pro-sidebar-template/gh-pages/src/img/user.jpg" alt="Generic placeholder image">
                    </a>
                    <div class="media-body">
                        <h5 class="mt-0">Media heading</h5>
                        Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
                        <div class="row" id="formReply">
                        <div class="form-group mt-4  col-md-12">

                            <textarea class="form-control"  rows="2"></textarea>
                            <div class="col-md-12 text-right">
                                <button type="submit" class="btn btn-success mt-1"><span class="fas fa-comments"></span>  Cevapla</button>
                            </div>
                        </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

    </div>
    <form class="col-md-12 col-sm-12" style="margin:auto;  padding:50px; padding-top:0px; padding-bottom:10px;">

        <div class="form-group mt-4">
            <label style="font-weight:bold">Bir fikrin mi var? Hemen Paylaş!</label>
            <textarea class="form-control"  rows="3"></textarea>
        </div>
        <div class="col-md-12 text-right">
            <button type="submit" class="btn btn-success"><span class="fas fa-comments"></span>  Yorum Yap</button>
        </div>
    </form>

</div>




<!-- Modal CreatePost Begin-->


<!-- Modal -->
<div class="modal fade" id="createPostModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">Yeni Post</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">

                <g:form action="newEventPost" controller="eventPost" >
                    <fieldset class="form">
                        <div class="form-group">
                            <label for="title">Post Başlığı</label>
                            <g:field type="text" name="title" class="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="Text">Post Metini</label>
                            <g:field type="text" name="text" class="form-control" />
                        </div>


                        <div class="custom-control custom-switch">
                            <input type="checkbox" name="comments" class="custom-control-input custom-switch-lg" id="customSwitch1">
                            <label class="custom-control-label" for="customSwitch1">Post yorumları</label>
                        </div>
                        <g:hiddenField name="postId" value="${post.id}" />
                    </fieldset>
                    <div class="col-md-12 text-center">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                        <g:submitButton name="create" value="Oluştur" class="btn btn-success " />

                    </div>
                </g:form>
            </div>

        </div>
    </div>

</div>
<!-- Modal CreatePost End-->



</body>
</html>