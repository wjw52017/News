<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<jsp:include page="console_element/top.jsp" />
<%@ taglib uri='/struts-tags' prefix='s' %>
<script type="text/javascript">
	function check(){
		var name = document.getElementById("name");

		if(name.value == ""){
			alert("请输入主题名称！！");
			name.focus();
			return false;
		}		
		return true;
	}
</script>
<div id="main">
  <div id="opt_list">
    <ul>
      <li><a href="/News/toNewsAdd">添加新闻</a></li>
      <li><a href="/News/admin">编辑新闻</a></li>
      <li><a href="newspages/topic_add.jsp">添加主题</a></li>
      <li><a href="/News/topiclist">编辑主题</a></li>
    </ul>
  </div>
  <div id="opt_area">
    <h1 id="opt_type">修改主题： </h1>
    <s:form action="/doTopicModify" method="post" onsubmit="return check()">
      <s:hidden name="topic.id" value="%{#request.modifyTopic.id}" />
      <p>
        <s:textfield label="主题名称" id="name" name="topic.name" value="%{#request.modifyTopic.name }" cssClass="opt_input" />
      </p> 
       
      <p>
        <s:submit value="提交" cssClass="opt_sub" />
      </p>     
    </s:form>
  </div>
</div>
