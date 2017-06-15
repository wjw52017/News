<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri='/struts-tags' prefix='s' %>
<jsp:include page="console_element/top.jsp" />
<script language="javascript">
	function clickdel(){
		return confirm("删除后，主题下的文章也会删除，确认删除吗？");
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
    <ul class="classlist">  
    	<s:iterator id="topic" value="#request.topicList">
    		<li> &#160;&#160;&#160;&#160; ${topic.name}&#160;&#160;&#160;&#160; <a href='toTopicModify?topic.id=${topic.id}'>修改</a> &#160;&#160;&#160;&#160; <a href='deletetopic?topic.id=${topic.id}'  onclick='return clickdel()'>删除</a> </li>
    	</s:iterator>
    	
    </ul>
  </div>
</div>

