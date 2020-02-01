<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Asp.net_Framework.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <link href="Assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="Assets/css/bootstrap-rtl.min.css" rel="stylesheet" />



</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
            <a class="navbar-brand" href="#">دانشجویان </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarColor01">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="Https://www.Google.com">گوگل <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="https://fa.wiktionary.org/wiki/%D8%A7%D9%85%DA%A9%D8%A7%D9%86%D8%A7%D8%AA">امکانات</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="https://shatelmobile.ir/%D8%AA%D9%85%D8%A7%D8%B3-%D8%A8%D8%A7-%D9%85%D8%A7/">تماس با ما</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="https://www.portal.ir/how-write-about-us-page">درباره ما</a>
                    </li>
                </ul>
                <div class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2" type="text" placeholder="جستجو" />
                    <button class="btn btn-secondary my-2 my-sm-0" type="submit">جستجو</button>
                </div>
            </div>
        </nav>
        <div class="container" style="text-align: right">



            <fieldset id="MAINPOSTERGETER">
                <legend>فرم ثبت نام</legend>
                <div class="form-group row">
                </div>
                <div class="form-group">
                    <label>نام </label>
                    <input type="text" class="form-control" aria-describedby="نام " placeholder="نام" id="FirstName"  name="tshp-FirstName" />
                    <small class="form-text text-muted">لطفا از وارد کردن اعداد و نشانه ها خودداری نمایید.</small>
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail1">نام خانوادگی</label>
                    <input type="text" class="form-control" aria-describedby="نام خانوادگی" placeholder="نام خانوادگی" id="LastName"  name="tshp-LastName" value="" />
                    <small class="form-text text-muted">لطفا از وارد کردن اعداد و نشانه ها خودداری نمایید.</small>
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail1">نام کاربری </label>
                    <input type="text" class="form-control" aria-describedby="نام کاربری" id="UserName" name="tshp-UserName" placeholder="  نام کاربری" />
                    <small class="form-text text-muted"></small>نام خانوادگی
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail1">آدرس ایمیل </label>
                    <input type="email" class="form-control" id="Email" name="tshp-Email"   aria-describedby="emailHelp"  placeholder="آدرس ایمیل" />
                    <small id="emailHelp" class="form-text text-muted">لطفا آدرس ایمیل خود را به اشتراک نگذارید</small>
                </div>

                <div class="form-group">
                    <label for="exampleInputPassword1">رمز عبور</label>
                    <input type="password" class="form-control" id="Password" name="tshp-Password" placeholder="رمز عبور" />
                </div>
                <div class="form-group">
                </div>
                <div class="form-group">
                </div>
                <div class="form-group">
                </div>
                <img id="imgcaptcha" runat="server" />

                             <div class="form-group">
                    <label for="exampleInputEmail1">عبارت را بدرستی وارد کنید </label>
                    <input type="text" class="form-control" aria-describedby="متن را بدرستی وارد کنید" id="Captcha" name="tshp-Captcha" placeholder="  متن را بدرستی وارد کنید" />
                    <%--<small class="form-text text-muted"></small>متن را بدرستی وارد کنید--%>
                </div>

                <button type="submit" onclick="return BottonClick()" class="btn btn-primary">ثبت </button>




            </fieldset>
        </div>

    </form>

    <script src="Assets/js/bootstrap.min.js"></script>
    <script src="Assets/js/jquery-3.4.1.min.js"></script>
    
        <script>
            $(document).ready(function () {
                $.ajax({
                    url: "./Controllers/captcha.aspx",
                    type: "GET",
                    success: function (res) {
                        $("#imgcaptcha").replaceWith(' <img  class="form-control"  style="width: 50%;height: 176px;" src="data:image/png;base64,' + res + '" />');
                    }
                });
            });
    </script>

    <script>
        function BottonClick() {
            var AddressToSend = "Controllers/MainController.aspx/GetAdminPagePost";
            var JsonRequest = objectifyForm();
            var PostJson = { 'Posted': JsonRequest };

            $.ajax({
                url: AddressToSend,
                type: "post",
                data: JSON.stringify(PostJson),
                contentType: "application/json; charset=utf-8",
                success: function (responce) {
                    alert(responce.d);
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert(textStatus);
                }
            });
            return false; 
        }
        function objectifyForm() {
            var inp = $("#MAINPOSTERGETER :input");
            var rObject = {};
            for (var i = 0; i < inp.length; i++) {

                if (inp[i]['name'].substr(inp[i]['name'].length - 2) == "[]") {
                    var tmp = inp[i]['name'].substr(0, inp[i]['name'].length - 2);
                    if (Array.isArray(rObject[tmp])) {
                        if (inp[i]['name'].includes("tshp-"))
                            rObject[tmp].push(inp[i]['value']);
                    } else {

                        rObject[tmp] = [];
                        rObject[tmp].push(inp[i]['value']);
                    }
                } else {
                    if (inp[i]['name'].includes("tshp-"))
                        rObject[inp[i]['name'].replace("tshp-", "")] = inp[i]['value'];
                }
            }


            return JSON.stringify(rObject);
        }
    </script>
</body>
</html>
