<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>用户登录</title>
<link href="${cssRootPath}/login.css" rel="stylesheet" type="text/css" />
<style type="text/css">
body{margin:0; padding:0; font-size:9pt;}
#login{margin:auto; width:975px; height:368px; margin-top:120px;}
#top_left{width:691px; height:89px; float:left;}
#top_left img {margin-left:33px;}
#top_center{width:248px; height:89px; background:url(${imagesRootPath}/login_05.gif); float:left;}

#center_left{width:691px; height:190px; background:url(${imagesRootPath}/login_09.jpg); float:left;}
#center_middle{width:248px; height:190px; float:left; background:url(${imagesRootPath}/login_13.gif) repeat-y;}
#center_right{width:36px; height:190px; float:right; background:url(${imagesRootPath}/login_11.gif);}

#down_left{width:691px; height:89px; float:left; margin-top:15px;}
#down_center{width:248px; height:89px; background:url(${imagesRootPath}/login_16.gif); float:left;}
#inf{width:691px; height:38px; background:url(${imagesRootPath}/login_18.gif) no-repeat; }
.inf_text{display:block; width:100px; height:20px; font-size:16px; font-weight:bolder; color:#fff; margin-left:17px; margin-top:12px; float:left;}
.copyright{display:block; float:left; margin-left:17px; margin-top:15px;}

#user{ margin-left:40px; margin-top:45px; height:25px;}
#password{margin-left:40px; margin-top:25px; height:25px;}
input{width:120px; height:18px; border:solid 1px #aca7a7; font-size:9pt;}
#btn{margin-left:30px; margin-top:40px;height:25px; margin-right:28px; text-align:center;}
#btn a{display:block; line-height:25px; background: url(${imagesRootPath}/bt_bg.gif); border: solid 1px #b6b6b6; width:65px; float:left; margin-left:15px; text-decoration:none; color:#000;}

</style>
</head>
<script type="text/javascript">
	function buttonsubmit(){
		this.form= document.getElementById("loginForm");
	 	this.form.submit();
		
	}
	function enterSubmit(e){
		var keypressed;
       if(window.event)
           keyPressed = window.event.keyCode; // IE
       else
           keyPressed = e.which; // Firefox
       if(keyPressed==13)
         { 
    	   buttonsubmit();            
           return false;
        }
    }
	function clearInfo(){
		$("#usernameClear").val("");
		$("#passwordClear").val("");
		$("#usernameClear").focus();
	}
	
</script>


<body>
    <div id="login">
	
	     <div id="top">
		      <div id="top_left"><img src="${imagesRootPath}/login_03.gif" /></div>
			  <div id="top_center"></div>
		 </div>
		 
		 <div id="center">
		      <div id="center_left"></div>
			  <div id="center_middle">
			  <form  onkeydown="javascript:enterSubmit(event);" action="${contextPath}/account/login" id="loginForm" method="post">
			       <div id="user">用  户
			        <input id="usernameClear" type="text" name="username" maxlength="20"/>
			       </div>
				   <div id="password">密  码
				    <input id="passwordClear" type="password" name="password" maxlength="20"/>
				   </div>
				   <div id="btn"><a href="javascript:buttonsubmit();">登  录</a><a href="javascript:clearInfo();">清  空</a></div>
			  </form>
			  </div>
			  <c:if test="${not empty flag}">
				<span style="color:red">登录失败</span>
			</c:if>
			  <div id="center_right"></div>		 
		 </div>
		 <div id="down">
		      <div id="down_left">
			      <div id="inf">
                       <span class="inf_text">版本信息</span>
					   <span class="copyright">管理系统 2012 v1.0</span>
			      </div>
			  </div>
			  <div id="down_center"></div>		 
		 </div>

	</div>
</body>
</html>
