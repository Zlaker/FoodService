<%@ page import="com.kpi.education.security.CustomUserDetails" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<c:set var="root" value="${pageContext.request.contextPath}" />
<%@page session="true"%>
<head>
    <meta charset="utf-8">
    <title>Manager profile</title>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.1/jquery.min.js" type="text/javascript"></script>
    <script src="${root}/view/res/js/load/REST_client.js"></script>
    <script>
        function onLoadBody() {
            managerID = <%= ((CustomUserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getId()%>
                    shops = ShopsByManagerUserID(managerID);
                    ManagerUserByID(managerID);

            $.each(results, function() {
                $("#shopContainer").append($('<option></option>').text(this.name).val(this.location.country));
            });
        }

    </script>
</head>
<body id="body" onload="onLoadBody()">

<%--include header--%>
<%@ include file="/view/public/common/header.jsp" %>

<div id="content">
    <div id="leftBar">
        <p>Leftbar</p>
    </div>
    <div id="centralBar">
        <h2><p>Profile</p></h2>
        <br>
        <div id="profileImage">
            <img height="150px" src="${root}/view/res/images/photo.jpg"/>
        </div>
        <div id="profileText">
            <div id="profileTextKey">
                <p>First name : </p>
                <br>
                <p>Last name : </p>
                <br>
                <p>E-mail : </p>
                <br>
                <p>About you : </p>
            </div>
            <div id="profileTextValue">
                <p id="profileFName"></p>
                <br>
                <p id="profileLName"></p>
                <br>
                <p id="profileEmail"></p>
                <br>
                <p id="profileInfo"></p>
            </div>
            <div id="profileMenu">
                <form>
                    <button formaction="${root}/view/private/ROLE_MANAGER/add_shop.jsp" class="imageButton" onmousemove="moveImage(this)" onmouseout="outImage(this)">
                        <img src="${root}/view/res/images/ic_store_white_48dp.png"/>
                    </button>
                    <button formaction="${root}/view/private/messages.jsp" class="imageButton" onmousemove="moveImage(this)" onmouseout="outImage(this)">
                        <img src="${root}/view/res/images/ic_action_mail.png"/>
                    </button>
                </form>
            </div>
        </div>
    </div>
    <div id="rightBar">
        <div id="shopContainer"></div>
    </div>
</div>
</body>
</html>