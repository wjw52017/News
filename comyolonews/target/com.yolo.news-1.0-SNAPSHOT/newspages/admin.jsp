<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri='/struts-tags' prefix='s' %>
<jsp:include page="console_element/top.jsp" />
<script language="javascript">
	function clickdel(){
		return confirm("删除请点击确认");
	}	
</script>

<div id="main">
	<div id="opt_list">
		<ul>
			<li><a href="/News/toNewsAdd">添加新闻</a></li>
			<li><a href="/News/admin">编辑新闻</a></li>
			<li><a href="${pageContext.request.contextPath}/newspages/topic_add.jsp">添加主题</a></li>
			<li><a href="/News/topiclist">编辑主题</a></li>
            <li><a href="${pageContext.request.contextPath}/newspages/ModifyPwd.jsp">修改密码</a> </li>
		</ul>
	</div>
  <div id="opt_area">
	  <s:action name="admin" namespace="/" executeResult="true" />
                      主题：<s:select name="newsinfo.tid" list="#request.topicList" listKey="id" listValue="name" cssClass="opt_input" />
         &nbsp;&nbsp; &nbsp;新闻标题：<s:textfield name="newsinfo.title" />


    <ul class="classlist"> 
    	<s:iterator id="news" value="#request.newsinfoList">
    	 	<li>${news.title}<span> 作者：${news.author}&#160;&#160;&#160;&#160; <a href='${pageContext.request.contextPath}\toNewsModify?id=${news.id}'>修改</a> &#160;&#160;&#160;&#160; <a href='${pageContext.request.contextPath}\deleteNews?id=${news.id}' onclick='return clickdel()'>删除</a> </span> </li>
    	</s:iterator>        
        <s:if test="pager.curPage>1">
            <p align="center">
			    <a href='admin?pager.curPage=1&newsinfo.Tid=${requestScope.newsinfo.tid}&newsinfo.title=${requestScope.newsinfo.title}'>首页</a>
			    <a href='admin?pager.curPage=${pager.curPage-1 }&newsinfo.Tid=${requestScope.newsinfo.tid}&newsinfo.title=${requestScope.newsinfo.title}'>上一页</a>
		    </p>
		</s:if>		
		
		<s:if test="pager.curPage < pager.pageCount">
		  <p align="center">
			<a href='admin?pager.curPage=${pager.curPage+1}&newsinfo.Tid=${requestScope.newsinfo.tid}&newsinfo.title=${requestScope.newsinfo.title}'>下一页</a>
			<a href='admin?pager.curPage=${pager.pageCount }&newsinfo.Tid=${requestScope.newsinfo.tid}&newsinfo.title=${requestScope.newsinfo.title}'>尾页</a>
		  </p>
		</s:if>
    </ul>
  </div>
</div>

