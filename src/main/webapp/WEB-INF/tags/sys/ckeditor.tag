<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="replace" type="java.lang.String" required="true"
	description="需要替换的textarea编号"%>
<%@ attribute name="uploadPath" type="java.lang.String" required="false"
	description="文件上传路径，路径后自动添加年份。若不指定，则编辑器不可上传文件"%>
<%@ attribute name="height" type="java.lang.String" required="false"
	description="编辑器高度"%>
<script type="text/javascript">include('ckeditor_lib','${ctxStatic}/ckeditor/',['ckeditor.js']);</script>
<script type="text/javascript" charset="utf-8"
	src="${ctxStatic}/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
	src="${ctxStatic}/ueditor/ueditor.all.js"> </script>
<script type="text/javascript" charset="utf-8"
	src="${ctxStatic}/ueditor/lang/zh-cn/zh-cn.js"></script>
<div id="${replace}uecontent" style="width: 70%; height: 400px;"></div>
<script type="text/javascript">
    $(function(){
      
        var cwidth = $("#${replace}uecontent").parent().width()*0.95;
        var ${replace}ue = UE.getEditor('${replace}uecontent', {
            toolbars: [[
                'fullscreen', 'undo', 'redo', '|',
                'bold', 'italic', 'underline', 'fontborder', 'strikethrough', 'superscript', 'subscript', 'removeformat', 'formatmatch', 'autotypeset', 'blockquote', 'pasteplain', '|', 'forecolor', 'backcolor', 'insertorderedlist', 'insertunorderedlist', 'selectall', 'cleardoc', '|',
                'rowspacingtop', 'rowspacingbottom', 'lineheight', '|',
                'customstyle', 'paragraph', 'fontfamily', 'fontsize', '|',
                'directionalityltr', 'directionalityrtl', 'indent', '|',
                'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify', '|', 'touppercase', 'tolowercase', '|',
                'link', 'unlink', 'anchor', '|', 'imagenone', 'imageleft', 'imageright', 'imagecenter', '|',
                'simpleupload',  'emotion', 'map', 'insertframe', 'insertcode',  'pagebreak', 'template', 'background', '|',
                'horizontal', 'date', 'time', 'spechars',  '|',
                'inserttable', 'deletetable', 'insertparagraphbeforetable', 'insertrow', 'deleterow', 'insertcol', 'deletecol', 'mergecells', 'mergeright', 'mergedown', 'splittocells', 'splittorows', 'splittocols', 'charts', '|',
                'print', 'preview', 'searchreplace', 'help'
            ]],
            initialFrameWidth : cwidth,
            initialFrameHeight: 600,
            wordCount:false,
            elementPathEnabled:false
        });
        ${replace}ue.ready(function() {
            UE.getEditor('${replace}uecontent').setContent($("#${replace}").text());  //赋值给UEditor
        });
        ${replace}ue.addListener("contentchange",function(${replace}){
            $("#${replace}").val(UE.getEditor('${replace}uecontent').getContent());
        })
    })

</script>