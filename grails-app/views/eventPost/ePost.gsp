
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title></title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Blinker|Libre+Caslon+Text&display=swap" rel="stylesheet">
</head>
<style>
    button:focus {outline:0 !important;}
</style>
<body style="font-family: 'Blinker', sans-serif;">
<div class="row shadow-lg p-3 mb-5 bg-white rounded" style="">
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
                            <p  readonly class="form-control-plaintext" value="">${post.description}</p>
                        </div>
                    </div>

                    <hr>
                    <small>Etkinlik ${post.startDate} - ${post.endDate} tarihleri arasında gerçekleşecektir.</small>
                    <hr>
                    <h6>
                        <g:if test="${userAvatar.photo}">

                            <img class="card-img-top mt-2 img-fluid img-thumbnail" style="border-radius: 50%;width:80px; height:80px; object-fit: cover;" src="data:image/png;base64,${userAvatar.avatar.encodeBase64()}" alt="Card image cap">

                        </g:if>
                        <g:if test="${userAvatar.photo==false}">

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

                <button class="btn btn-outline-primary" data-toggle="modal" data-target="#createPostModal">Post Ekle</button>
                <g:if test="${status==false}">
                        <g:link class="btn btn-outline-success" controller="post" action="join" params="[postId: post.id]">
                        Katıl</g:link>
                </g:if>
                <g:if test="${status==true}">
                    <g:link class="btn btn-outline-danger" controller="post" action="notJoin" params="[postId: post.id]">
                        Çık</g:link>
                </g:if>

            </div>
        </div>
    </div>
</div>


<div class="row shadow-lg p-3 mb-2 bg-white rounded" style="font-family: 'Blinker', sans-serif; font-weight: bold">
<div class="col-md-8" id="posts" style="margin-left: auto; margin-right: auto;">
<g:each var="eventPost" in="${eventPosts}">
<div class="col-md-12 mt-1">
    <div class="col-md-12">
        <div class="card mb-3">
            <div class="card-header p-2" style="background-color: #fff">
                <div class="col-md-12">

                     <img  style="width: 40px; border-radius: 50%;" username="${eventPost.username}" class="mr-3 imgAvatar" src="https://raw.githubusercontent.com/azouaoui-med/pro-sidebar-template/gh-pages/src/img/user.jpg" alt="Generic placeholder image">
                    <strong>${eventPost.username}</strong> bir güncelleme paylaştı.



                </div>
            </div>
            <div class="card-body pb-1">

             <!--   <h5 class="card-title">${eventPost.title}</h5>
                -->
                <div class="row">
                <div class="col-md-11" style="font-weight: normal;">
                <g:if test="${eventPost.text}">
                <p class="card-text" style="padding:0px 20px;">${eventPost.text}</p>
                </g:if>
                    <g:each var="image" in="${images}">
                        <g:if test="${image.eventPostId == eventPost.id}">
                            <a href="data:image/png;base64,${image.image.encodeBase64()}"  data-toggle="lightbox"  data-gallery="${eventPost.username}photos">
                                <img style="width:50px; height: 50px; padding-left: 10px; object-fit: contain;" src="data:image/png;base64,${image.image.encodeBase64()}"/>
                            </a>

                        </g:if>
                    </g:each>
            </div>
                <g:if test="${eventPost.username==currentUser.username}">

                    <div class="col-md-1 col-sm-3 col-3 text-right">
                        <div class="btn-group dropleft">
                            <button class="btn btn-sm btn-outline-success"  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="fas fa-ellipsis-v fa-x"></span></button>
                            <div class="dropdown-menu">
                                <a class="dropdown-item deleteEventPost" href="#">Postu Sil</a>

                                <g:form action="deleteEventPost" controller="eventPost" style="display:none">
                                    <g:hiddenField name="eventPostId" value="${eventPost.id}" />
                                    <g:hiddenField name="postId" value="${post.id}" />
                                    <button type="submit" class="btn btn-success mt-1"></button>
                                </g:form>

                                <a class="dropdown-item" href="#">Postu Düzenle</a>
                                <a class="dropdown-item addPhoto" id="addPhoto${eventPost.id}" >Fotoğraf Ekle</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#">Separated link</a>
                                <!-- Dropdown menu links -->
                            </div>
                        </div>
                    </div>
                </g:if>
            </div>
              <!--  <p class="card-text mb-1"><small class="text-muted"></small></p>
                -->
                <g:if test="${false}">

                <div class="row">
                    <g:each var="image" in="${images}">
                        <g:if test="${image.eventPostId == eventPost.id}">
                            <a href="data:image/png;base64,${image.image.encodeBase64()}"  data-toggle="lightbox"  data-gallery="${eventPost.username}photos">
                                <img style="width:50px; height: 50px; padding-left: 10px; object-fit: contain;" src="data:image/png;base64,${image.image.encodeBase64()}"/>
                            </a>

                        </g:if>
                    </g:each>

                </div>
            </g:if>

                <g:uploadForm controller="eventPost" action="uploadPhoto" style="display: none;" >
                    <g:hiddenField name="eventId" value="${post.id}" />
                    <g:hiddenField name="postId" value="${eventPost.id}" />
                    <!-- Photo ekleme için gerekli olan input...-->
                        Photo: <input class="inputPhotoPost" name="photo" type="file" id="addPhoto${eventPost.id}Btn" multiple/>
                    <g:submitButton name="uploadPhotoSubmit" value="Upload"/>
                </g:uploadForm>
            </div>
            <div class="card-footer"  style="background: #fff; padding-bottom: 0px; ">
                <g:if test="${eventPost.comments==true}">


              <h6 class="commentBtn" style="   cursor:pointer;" > Yorumları Göster <span class="fa fa-comment"></span></h6>
                <g:each var="comment" in="${comments}">
                    <g:if test="${comment.eventPostId == eventPost.id}">
                    <div class="media" style="display: none;">
                        <img  style="width: 40px; border-radius: 10%;" class="mr-3 imgAvatar" username="${comment.username}" src="https://raw.githubusercontent.com/azouaoui-med/pro-sidebar-template/gh-pages/src/img/user.jpg" alt="Generic placeholder image">
                        <div class="media-body">
                            <h6 style="font-weight: bold;" class="mt-0">${comment.username}</h6>
                            ${comment.text}
                            <div class="row mt-2 pl-4"><a style="cursor: pointer" class="text-primary replyBtn">Cevapla</a></div>
                            <g:each var="reply" in="${replies}">
                                <g:if test="${reply.commentId== comment.id}">
                            <div class="media mt-1">
                                <a class="pr-3" href="#">
                                    <img class="imgAvatar" username="${reply.username}" style="width: 40px; border-radius: 10%;" src="https://raw.githubusercontent.com/azouaoui-med/pro-sidebar-template/gh-pages/src/img/user.jpg" alt="Generic placeholder image">
                                </a>
                                <div class="media-body">
                                    <h6 style="font-weight: bold;" class="mt-0">${reply.username}</h6>
                                    ${reply.text}
                                </div>

                            </div>
                                </g:if>
                            </g:each>
                            <div class="row">
                                <div class="form-group mt-1  col-md-12 replyForm" style="display:none">
                                    <g:form action="newReply" controller="eventPost" >
                                        <g:hiddenField name="postId" value="${post.id}" />
                                        <g:hiddenField name="eventPostId" value="${eventPost.id}" />
                                        <g:hiddenField name="commentId" value="${comment.id}" />
                                        <textarea name="text" class="form-control col-md-10" style="margin-right:0px; margin-left: auto;" rows="1"></textarea>
                                        <div class="col-md-12 text-right">
                                            <button type="submit" class="btn btn-success mt-1"><span class="fas fa-comments"></span>  Cevapla</button>
                                        </div>
                                    </g:form>
                                </div>
                            </div>
                        </div>
                    </div>
                    </g:if>

                </g:each>

                    <g:form  class="col-md-12 col-sm-12" style="margin:auto; display: none;  padding:50px; padding-top:0px; padding-bottom:10px;" action="newComment" controller="eventPost" >
                    <g:hiddenField name="postId" value="${post.id}" />
                    <g:hiddenField name="eventPostId" value="${eventPost.id}" />
                    <div class="form-group mt-1" >
                        <label style="font-weight:bold">Bir fikrin mi var? Hemen Paylaş!</label>
                        <textarea class="form-control" name="text"  rows="1"></textarea>
                    </div>
                    <div class="col-md-12 text-right">
                        <button type="submit" class="btn btn-sm btn-success"><span class="fas fa-comments"></span>  Yorum Yap</button>
                    </div>
                </g:form>
                </g:if>
                <g:if test="${eventPost.comments == false}">
                    <small class="text-danger" style="font-weight: bold">Yorumlar post oluşturan kişi tarafından kapatıldı.</small>
                </g:if>


           <!-- </div> -->
        </div>

        </div>

    </div>


</div>
</g:each>
</div>
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

                <g:form action="newEventPost" controller="eventPost" enctype="multipart/form-data">
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
                        <div class="custom-control custom-switch">
                            <input type="file" name="photo" type="file" multiple >
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


<!--message modal begin-->
<div class="modal fade bd-example-modal-lg" id="messageModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h6 class="modal-title text-danger">Bilgilendirme</h6>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body text-center">
            <h6 style=""> ${messageText} </h6>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success btn-sm" data-dismiss="modal">Tamam</button>
            </div>

        </div>

    </div>
</div>
<!--message modal end-->

<!-- Modal CreatePost End-->
<asset:javascript src="jquery-2.2.0.min.js"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>

<script>
    $( document ).ready(function() {

        <g:if test="${messageText}" >
        $("#messageModal").modal("show");
        </g:if>


        var images = $('.imgAvatar').map(function(){
            //return $(this).attr('src')
            return $(this)
        }).get()
        console.log(images);
        $.each( images, function( key, value ) {
            console.log($(value).attr('src'));
         getUserAvatar($(value));
          //console.log(element.attr("src"));

        });


    });
</script>
<script>
    $(".commentBtn").click(function () {
        $(this).nextAll().slideToggle(400);
    });

    $(".deleteEventPost").click(function () {
       $(this).next().children("button").click();
    });

    $(".addPhoto").click(function () {
        $("#"+$(this).attr("id")+"Btn").click();

    });
    $(".inputPhotoPost").change(function(){
        //submit the form here
        $(this).next().click();

    });

    $(".replyBtn").click(function () {
        $(".replyForm").css("display","none");
        $(this).parent().parent().children(".row").children(".replyForm").css("display","block");
    });

    $(document).on('click', '[data-toggle="lightbox"]', function(event) {
        event.preventDefault();
        $(this).ekkoLightbox();
    });
</script>
<asset:javascript src="ekko-lightbox.js"></asset:javascript>
<script src="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.js.map"></script>

</body>
</html>