<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri='/struts-tags' prefix='s' %>
<jsp:include page="console_element/top.jsp" />
<script language="javascript">
	function clickdel(){
		return confirm("ɾ������ȷ��");
	}	
</script>

<div id="main">
	<div id="opt_list">
		<ul>
			<li><a href="/News/toNewsAdd">�������</a></li>
			<li><a href="/News/admin">�༭����</a></li>
			<li><a href="${pageContext.request.contextPath}/newspages/topic_add.jsp">�������</a></li>
			<li><a href="/News/topiclist">�༭����</a></li>
            <li><a href="${pageContext.request.contextPath}/newspages/ModifyPwd.jsp">�޸�����</a> </li>
		</ul>
	</div>
  <div id="opt_area">
	  <s:action name="admin" namespace="/" executeResult="true" />
                      ���⣺<s:select name="newsinfo.tid" list="#request.topicList" listKey="id" listValue="name" cssClass="opt_input" />
         &nbsp;&nbsp; &nbsp;���ű��⣺<s:textfield name="newsinfo.title" />


    <ul class="classlist"> 
    	<s:iterator id="news" value="#request.newsinfoList">
    	 	<li>${news.title}<span> ���ߣ�${news.author}&#160;&#160;&#160;&#160; <a href='${pageContext.request.contextPath}\toNewsModify?id=${news.id}'>�޸�</a> &#160;&#160;&#160;&#160; <a href='${pageContext.request.contextPath}\deleteNews?id=${news.id}' onclick='return clickdel()'>ɾ��</a> </span> </li>
    	</s:iterator>        
        <s:if test="pager.curPage>1">
            <p align="center">
			    <a href='admin?pager.curPage=1&newsinfo.Tid=${requestScope.newsinfo.tid}&newsinfo.title=${requestScope.newsinfo.title}'>��ҳ</a>
			    <a href='admin?pager.curPage=${pager.curPage-1 }&newsinfo.Tid=${requestScope.newsinfo.tid}&newsinfo.title=${requestScope.newsinfo.title}'>��һҳ</a>
		    </p>
		</s:if>		
		
		<s:if test="pager.curPage < pager.pageCount">
		  <p align="center">
			<a href='admin?pager.curPage=${pager.curPage+1}&newsinfo.Tid=${requestScope.newsinfo.tid}&newsinfo.title=${requestScope.newsinfo.title}'>��һҳ</a>
			<a href='admin?pager.curPage=${pager.pageCount }&newsinfo.Tid=${requestScope.newsinfo.tid}&newsinfo.title=${requestScope.newsinfo.title}'>βҳ</a>
		  </p>
		</s:if>
    </ul>
  </div>
</div>

