<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="org.apache.commons.fileupload.FileItem" %>
<%@ page import="java.util.List" %>
<%@ page import="java.io.File" %>
<%@ page import="org.apache.commons.fileupload.FileItemFactory" %>
<%@ page import="java.util.Iterator" %>

Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019-11-17
  Time: 12:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%

    request.setCharacterEncoding("utf-8");
    String uploadFileName = ""; //上传的文件名
    String fieldName = "";  //表单字段元素的name属性值
    //请求信息中的内容是否是multipart类型
    boolean isMultipart = ServletFileUpload.isMultipartContent(request);
    //上传文件的存储路径（服务器文件系统上的绝对文件路径）
    String uploadFilePath = request.getSession().getServletContext().getRealPath("upload/" );
    //打印当前路径
    out.print(uploadFilePath);
    if (isMultipart) {
        FileItemFactory factory = new DiskFileItemFactory();

        ServletFileUpload upload = new ServletFileUpload(factory);
        try {
            //解析form表单中所有文件
            List<FileItem> items = upload.parseRequest(request);
            Iterator<FileItem> iter = items.iterator();
            while (iter.hasNext()) {   //依次处理每个文件
                FileItem item = (FileItem) iter.next();
                out.print(item.getFieldName());
                if (item.isFormField()){  //普通表单字段
                    fieldName = item.getFieldName();   //表单字段的name属性值
                    if (fieldName.equals("user")){
                        //输出表单字段的值
                        out.print(item.getString("UTF-8")+"上传了文件。<br/>");
                    }
                }else{  //文件表单字段
                    String fileName = item.getName();
                    if (fileName != null && !fileName.equals("")) {
                        File fullFile = new File(item.getName());
                        File saveFile = new File(uploadFilePath, fullFile.getName());
                        item.write(saveFile);
                        uploadFileName = fullFile.getName();
                        out.print("上传成功后的文件名是："+uploadFileName);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>
</body>
</html>
