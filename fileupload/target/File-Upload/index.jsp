<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019-11-17
  Time: 12:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>上传页面</title>
</head>
<body>
<form action="util/do_upload.jsp" enctype="multipart/form-data" method="post">
        <h1>不限制上传属性</h1>
        <p>姓名：<input type="text" name="user"></p>
        <p>选择图片：<input type="file" name="userFile"></p>
        <p><input type="submit" value="提交"></p>
</form>
<form action="util/do_upload_02.jsp" enctype="multipart/form-data" method="post">
    <h1>限制上传属性</h1>
    <p>姓名：<input type="text" name="user"></p>
    <p>选择图片：<input type="file" name="userFile"></p>
    <p><input type="submit" value="提交"></p>
</form>
</body>
</html>
