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
    <asset:stylesheet src="fullcalendar.css"/>
    <asset:stylesheet src="fullcalendar.print.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">

    <style>
    button:focus {
        outline: none;
        border: none;
    }
    .fc-header-center{
        visibility: hidden;
    }
    </style>
</head>

<body>
<div class="container">



    <div class="col-md-12 text-center">
        <div class="btn-group btn-group-justified" data-toggle="buttons" role="group" aria-label="Basic example" >
            <a href="#listView" id="listViewLink" class="btn btn-outline-primary " data-toggle="tab">Liste Görünümü</a>

            <a href="#calendarView" id="calendarBtn" class="btn btn-primary" data-toggle="tab">Takvim Görünümü</a>
        </div>
    </div>

    <div class="row mt-5">
        <div class="card shadow-lg p-3 mb-5 bg-white rounded" style="width: 75rem; margin:0px auto;">
            <div class="card-body">

                <h3 class="animated  bounce delay-1s" style="text-align:center">Etkinlikler</h3>

                <div class="col-md-12" >
                    <div class="tab-content">


                        <div class="tab-pane " id="listView">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label style="font-weight: bold;">Event Type</label>
                                        <select class="form-control" id="comboboxType" onchange="changeEventType()">

                                            <option  value="all">Tümünü Listele</option>
                                            <option value="fun">Eğlence</option>
                                            <option value="education">Eğitim</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <g:if test="${categoryList}">
                                            <label style="font-weight: bold;">Category</label>
                                            <select class="form-control" id="comboboxCategory" onchange="changeCategory()">
                                                <option value="0">Tümü</option>
                                                <g:each var="category" in="${categoryList}">
                                                    <option value="${category.id}">${category.name}</option>
                                                </g:each>
                                            </select>
                                        </g:if>
                                    </div>
                                </div>
                            </div>
                            <table class="table table-dark">
                                <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Title</th>
                                    <th scope="col">Date (Start - End)</th>
                                    <th scope="col">Username</th>
                                    <th style="text-align:center" scope="col">Kontenjan</th>

                                    <th scope="col">Durum</th>

                                    <sec:ifAllGranted roles="ROLE_ADMIN">
                                        <th scope="col">Katılım</th>

                                    </sec:ifAllGranted>
                                </tr>
                                </thead>
                                <tbody>




                                <g:each var="post" in="${listPost}">

                                    <tr>
                                        <th scope="row">${post.post.id}</th>

                                        <td><a href="/eventPost?id=${post.post.id}"  style="color:#d1ecf1;">${post.post.title}</a></td>
                                        <td> ${post.post.startDate} <br> ${post.post.endDate}</td>
                                        <td>${post.post.username}</td>
                                        <td style="text-align:center">${post.post.number}/${post.post.quota}</td>
                                        <g:if test="${post.status==false}">
                                            <g:if test="${post.post.quota<=post.post.number}">
                                                <td><span class="text-warning" style="font-weight: bold"> DOLU </span></td>
                                            </g:if>
                                            <g:if test="${post.post.quota>post.post.number}">

                                                <td><g:link class="btn btn-sm btn-success" controller="post" action="join" params="[postId: post.post.id]">
                                                    Katıl</g:link></td>
                                            </g:if>
                                        </g:if>
                                        <g:if test="${post.status==true}">
                                            <td><g:link class="btn btn-sm btn-danger" controller="post" action="notJoin" params="[postId: post.post.id]">Çık</g:link></td>
                                        </g:if>
                                        <sec:ifAllGranted roles="ROLE_ADMIN">
                                            <td><button onclick="userList(${post.post.id})"  class="btn btn-sm btn-info " data-toggle="modal" data-target=".bd-example-modal-sm"> ${post.post.number}  kişi</button>
                                                <g:if test="${currentUser.username==post.post.username}">
                                                    <g:link class="btn btn-sm btn-danger" controller="post" action="deletePost" params="[postId: post.post.id]">Sil</g:link>
                                                </g:if></td>

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
                        <div class="tab-pane active" id="calendarView">
                            <div class="col-md-12" id="tabCalendar">

                                <div id='wrap'>

                                    <div id='calendar'></div>

                                    <div style='clear:both'></div>
                                </div>


                            </div>
                        </div>



                    </div>
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
                <h5 class="modal-title" id="exampleModalLongTitle">Event Oluştur</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">

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

        </div>
    </div>

</div>

<!-- calendar modal begin -->
<!-- Modal -->
<div class="modal fade" id="eventCreateModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" >Etkinlik Oluştur</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">


                <div class="form-group">
                    <label >Event Type</label>
                    <select class="form-control" name="type" id="comboboxTypeModalCalendar" onchange="changeEventTypeCalendar()">


                        <option value="fun">Eğlence</option>
                        <option value="education">Eğitim</option>
                    </select>
                </div>
                <div class="form-group">
                    <label >Category</label>
                    <select class="form-control" name="categoryId" id="comboboxCategoryModalCalendar">
                    </select>
                </div>
                <div class="form-group">
                    <label for="title">Title</label>
                    <input type="text" name="titleCalendar" id="titleCalendar" required class="form-control" />
                </div>
                <div class="form-group">
                    <label for="Description">Description</label>
                    <input type="text" name="descriptionCalendar" id="descriptionCalendar" required class="form-control" />
                </div>

                <div class="form-group">
                    <label for="quota">Kontenjan</label>
                    <input type="number" name="quotaCalendar" id="quotaCalendar" class="form-control" required value="10" />
                </div>
                <div class="form-group">
                    <label for="startDate">Start</label>
                    <input type="datetime-local"  name="startDateCalendar" id="startDateCalendar" class="form-control" />
                </div>
                <div class="form-group">
                    <label for="endDate">End</label>
                    <input type="datetime-local" name="endDateCalendar" id="endDateCalendar" class="form-control" />
                </div>

                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" name="usernameCalendar" id="usernameCalendar" readonly class="form-control" value="${currentUser.username}" />
                </div>
                <div class="col-md-12 text-center">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                    <button id="createEventBtn" class="btn btn-success " >Eventi Oluştur</button>

                </div>

            </div>

        </div>
    </div>

</div>

<!-- calendar modal end -->




<!-- info modal begin -->

<!-- Modal -->
<div class="modal fade " id="eventInfoModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" >Event Hakkında</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">



                <div class="form-group">
                    <label for="title">Title</label>
                    <input type="text" name="titleCalendar" id="titleInfo" readonly class="form-control" />
                </div>
                <div class="form-group">
                    <label for="Description">Description</label>
                    <input type="text" name="descriptionCalendar" id="descriptionInfo" readonly class="form-control" />
                </div>

                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" name="usernameInfo" id="usernameInfo" readonly class="form-control" value="${currentUser.username}" />
                </div>
                <div class="row">
                    <div class="form-group col-md-6">
                        <label for="quota">Kontenjan</label>
                        <input type="number" name="quotaInfo" readonly id="quotaInfo" class="form-control" value="10" />
                    </div>
                    <div class="form-group col-md-6">
                        <label for="quota">Doluluk</label>
                        <input type="text" name="quotaInfo" readonly id="numberInfo" class="form-control" value="10" />
                    </div>
                </div>
                <div class="form-group">
                    <label for="startDate">Start</label>
                    <input type="datetime-local"  name="startDateInfo" readonly id="startDateInfo" class="form-control" />
                </div>
                <div class="form-group">
                    <label for="endDate">End</label>
                    <input type="datetime-local" name="endDateInfo" readonly id="endDateInfo" class="form-control" />
                </div>

                <div class="col-md-12 text-center">
                    <button type="button" class="btn btn-info" readonly data-dismiss="modal">Tamam</button>

                </div>

            </div>

        </div>
    </div>

</div>

<!-- info modal end -->





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
                <h6 style="" id="messageText"> ${messageText} </h6>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success btn-sm" data-dismiss="modal">Tamam</button>
            </div>

        </div>

    </div>
</div>
<!--message modal end-->



<!-- User List Modal -->
<div class="modal fade bd-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="">Katılanlar</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body"  id="userList">

            </div>
        </div>
    </div>

    <!-- User List Modal -->

    <asset:javascript src="fullcalendar.js"/>

    <asset:javascript src="calendarScript.js"/>
    <asset:javascript src="jquery-2.2.0.min.js"/>
    <asset:javascript src="jquery-ui.custom.min.js"/>

    <script>

        $(document).ready(function() {
            <g:if test="${messageText}" >
            $("#messageModal").modal("show");
            </g:if>



            $("#comboboxTypeModal").change(function () {


                var selectedValue = document.getElementById("comboboxTypeModal").options[document.getElementById("comboboxTypeModal").selectedIndex].value;

                $.ajax({
                    url: "/category/getCategory?type="+selectedValue,
                    type: 'GET',
                    dataType: 'json', // added data type
                    success: function(res) {
                        console.log(res);
                        $("#categoryModal option").remove();

                        $.each(res, function (item, val) {
                            $("#categoryModal").append("<option value='"+val.id+"'>" + val.name + "</option>");
                        });

                    }
                });
            });


            /*Full Calendar Begin*/
            $("#createEventBtn").click(function () {

                if(new Date($("#startDateCalendar").val())>=new Date() && new Date($("#endDateCalendar").val())>=new Date()) {
                    $.ajax({
                        type: "POST",
                        url: "/post/jsCreatePost/",
                        data: {
                            title: $("#titleCalendar").val(),
                            username: "",
                            type: document.getElementById("comboboxTypeModalCalendar").options[document.getElementById("comboboxTypeModalCalendar").selectedIndex].value,
                            categoryId: document.getElementById("comboboxCategoryModalCalendar").options[document.getElementById("comboboxCategoryModalCalendar").selectedIndex].value,

                            description: $("#descriptionCalendar").val(),
                            quota: $("#quotaCalendar").val(),
                            startDate: $("#startDateCalendar").val(),
                            endDate: $("#endDateCalendar").val()
                        },
                        success: function (data) {
                            //  alert("Post Ekleme Başarılı");
                            durum = 0;
                            $('#calendar').fullCalendar('removeEvents');
                            getEvents();
                            $('#eventCreateModal').modal('hide');
                            $('#messageText').text("Etkinlik başarılı bir şekilde oluşturuldu!");

                            $('#messageModal').modal('show');

                        },
                        error: function () {
                            $('#eventCreateModal').modal('hide');
                            $('#messageModal').modal('show');
                            $('#messageText').text("Etkinlik oluşturulamadı!");

                        }
                    });
                }
                else
                    alert("Önceki tarihe etkinlik oluşturulamaz!");
            });


            /*Full Calendar End*/
            function getEvents() {
                var postList = [];
                var eventList = [];
                $.getJSON("/post/postsJson/", function (data) {
                    var items = [];
                    $.each(data, function (item, val) {

                        postList.push(val);
                        console.log(postList.length);
                    });

                    //Converting...

                    for (var i = 0; i < postList.length; i++) {
                        //  eventList.push({title:postList[i].title,start:new Date(postList[i].startDate),end:new Date(postList[i].endDate),allDay:true,className:"important",allDay:true,url:"www.google.com",reelId:postList[i].id});
                        if(postList[i].number>=postList[i].quota)
                            var evnt =  {eventId: i ,title:postList[i].title,start:new Date(postList[i].startDate),end:new Date(postList[i].endDate),allDay:true,className:"important",allDay:true,url:"www.google.com",reelId:postList[i].id,username:postList[i].username,description:postList[i].description,quota:postList[i].quota,number:postList[i].number};

                        else if(postList[i].type=="fun")
                            var evnt =  {eventId: i ,title:postList[i].title,start:new Date(postList[i].startDate),end:new Date(postList[i].endDate),allDay:true,className:"info",allDay:true,url:"www.google.com",reelId:postList[i].id,username:postList[i].username,description:postList[i].description,quota:postList[i].quota,number:postList[i].number};
                        if(postList[i].type=="education")
                            var evnt =  {eventId: i ,title:postList[i].title,start:new Date(postList[i].startDate),end:new Date(postList[i].endDate),allDay:true,className:"success",allDay:true,url:"www.google.com",reelId:postList[i].id,username:postList[i].username,description:postList[i].description,quota:postList[i].quota,number:postList[i].number};

                        console.log(evnt);
                        $('#calendar').fullCalendar('renderEvent', evnt);
                    }
                    console.log(eventList);


                });
            }


            $("#listViewLink").click(function () {
                $("#listViewLink").removeClass("btn-outline-primary");
                $("#listViewLink").addClass("btn-primary");

                $("#calendarBtn").removeClass("btn-primary");
                $("#calendarBtn").addClass("btn-outline-primary");

                if(durum!=1)
                    location.reload();
            });
            $("#calendarBtn").click(function () {
                $(this).addClass("btn-primary");
                $(this).removeClass("btn-outline-primary");
                $("#listViewLink").removeClass("btn-primary");
                $("#listViewLink").addClass("btn-outline-primary");
                $(".fc-header-center").css("visibility","hidden");

                $("span.fc-button-today").click();
            });


            var today = new Date();

            document.getElementById("modalStartDate").setAttribute("value",""+convertMyDate(today));
            document.getElementById("modalEndDate").setAttribute("value",""+convertMyDate(today));
            document.getElementById("modalStartDate").setAttribute("min",""+convertMyDate(today));
            document.getElementById("modalEndDate").setAttribute("min",""+convertMyDate(today));

            document.getElementById("startDateCalendar").setAttribute("value",""+convertMyDate(today));
            document.getElementById("endDateCalendar").setAttribute("value",""+convertMyDate(today));
            document.getElementById("startDateCalendar").setAttribute("min",""+convertMyDate(today));
            document.getElementById("endDateCalendar").setAttribute("min",""+convertMyDate(today));




        });
        function changeEventTypeCalendar(){
            var selectedValue = document.getElementById("comboboxTypeModalCalendar").options[document.getElementById("comboboxTypeModalCalendar").selectedIndex].value;

            $.ajax({
                url: "/category/getCategory?type="+selectedValue,
                type: 'GET',
                dataType: 'json', // added data type
                success: function(res) {
                    console.log(res);
                    $("#comboboxCategoryModalCalendar option").remove();

                    $.each(res, function (item, val) {
                        $("#comboboxCategoryModalCalendar").append("<option value='"+val.id+"'>" + val.name + "</option>");
                    });

                }
            });
        }


        function changeEventType() {
            var base = document.getElementsByTagName('base')[0];
            if (base && base.href && (base.href.length > 0)) {
                base = base.href;
            } else {
                base = document.URL;
            }
            var url =  base.substr(0,
                base.indexOf("/", base.indexOf("/", base.indexOf("//") + 2) + 1));
            url += "?eventType="+document.getElementById("comboboxType").options[document.getElementById("comboboxType").selectedIndex].value;
            document.location = url;
        }

        function changeCategory() {
            var base = document.getElementsByTagName('base')[0];
            if (base && base.href && (base.href.length > 0)) {
                base = base.href;
            } else {
                base = document.URL;
            }
            var url =  base.substr(0,
                base.indexOf("/", base.indexOf("/", base.indexOf("//") + 2) + 1));
            url += "?categoryId="+document.getElementById("comboboxCategory").options[document.getElementById("comboboxCategory").selectedIndex].value;
            url += "&eventType="+document.getElementById("comboboxType").options[document.getElementById("comboboxType").selectedIndex].value;
            document.location = url;
        }

        var getUrlParameter = function getUrlParameter(sParam) {
            var sPageURL = window.location.search.substring(1),
                sURLVariables = sPageURL.split('&'),
                sParameterName,
                i;

            for (i = 0; i < sURLVariables.length; i++) {
                sParameterName = sURLVariables[i].split('=');

                if (sParameterName[0] === sParam) {
                    return sParameterName[1] === undefined ? true : decodeURIComponent(sParameterName[1]);
                }
            }
        };

        var selectedType = getUrlParameter("eventType");
        console.log(selectedType);
        function getInputsByValue(value)
        {
            var allInputs = document.getElementsByTagName("option");
            var results = [];
            for(var x=0;x<allInputs.length;x++)
                if(allInputs[x].value == value)
                    results.push(allInputs[x]);
            return results;
        }
        var selectedOption = getInputsByValue(selectedType)[0].setAttribute("selected","selected");


        var selectedCategory = getUrlParameter("categoryId");
        getInputsByValue(selectedCategory)[0].setAttribute("selected","selected");
    </script>

</body>
</html>


