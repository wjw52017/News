<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="gbk"%>
<%@ taglib uri='/struts-tags' prefix='s' %>
<jsp:include page="console_element/top.jsp" />

<script type="text/javascript">
	function check(){
		var title = document.getElementById("title");
		var author = document.getElementById("author");
		var summary = document.getElementById("summary");
		var content = document.getElementById("content");		
		if(title.value == ""){
			alert("���ⲻ��Ϊ�գ���");
			title.focus();
			return false;
		}else if(author.value == ""){
			alert("���߲���Ϊ�գ���");
			author.focus();
			return false;
		}else if(summary.value == ""){
			alert("ժҪ����Ϊ�գ���");
			summary.focus();
			return false;
		}else if(content.value == ""){
			alert("���ݲ���Ϊ�գ���");
			content.focus();
			return false;
		}		
		return true;
	}
</script>
<div id="main">
  <div id="opt_list">
    <ul>
      <li><a href="/News/toNewsAdd">��������</a></li>
      <li><a href="/News/admin">�༭����</a></li>
      <li><a href="newspages/topic_add.jsp">��������</a></li>
      <li><a href="/News/topiclist">�༭����</a></li>
    </ul>
  </div>
  <div id="opt_area">
    <h1 id="opt_type"> �������ţ� </h1>
    <s:form action="doNewsAdd" method="post" onsubmit="return check()">
      <p>        
        <s:select name="newsinfo.tid" label="����" list="#request.topicList" listKey="id" listValue="name" cssClass="opt_input" />
      </p>
      <p>
        <s:textfield label="����" name="newsinfo.title" cssClass="opt_input"  />
      </p>      
      <p>
        <s:textarea label="ժҪ" name="newsinfo.summary" cols="40" rows="3" />
      </p>
      <p>
         <s:textarea label="����" name="newsinfo.content" cols="70" rows="10" />        
      </p>   
      <br>
     <p>
         <s:submit value="�ύ" cssClass="opt_sub" align="center" />  
      </p> 
    </s:form>
  </div>
</div>
