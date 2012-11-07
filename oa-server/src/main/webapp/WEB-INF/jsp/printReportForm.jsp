<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>打印报审表</title>
<style type="text/css" media="screen">

body,div,span,th,td,input,button,a,select {
	padding: 0px;
	color: #333333;
	font-family: Calibri, Verdana, Arial;
	font-size: 14px;
}
p {
	margin: 0;
	-webkit-margin-before: 0em;
	-webkit-margin-after: 0em;
}
table {      
      border-spacing:0px;
      margin:2px 0 2px 0;
      text-align:center;
      border-collapse:separate;
      table-layout: fixed;  
      empty-cells: show;  
}
td,th {      
      padding:3px;
      font-size:12px;
      border:1px solid #000;
      border-width:1px 1px 1px 1px;
      margin:2px 0 2px 0;
      text-align:left;
      word-wrap:break-word;
      word-break:break-all; 
      page-break-inside:avoid;
}
th {
      text-align:center;
      font-weight:600;
      background-color:#F4F4F4;
}
td {
     border-width:0px 1px 1px 0px;
}

td:first-child{
	border-left:1px solid black;
	
}

tr:first-child td{
	border-top:1px solid black;
}

.titlefont {
	font-size:24px;
}
.fangsong {
	font-family:FangSong_GB2312;
	font-size:13px;
}
.fangsongSmall {
	font-family:FangSong_GB2312;
	font-size:12px;
}
</style>
<style media="print" type="text/css">
body,div,span,th,td,input,button,a,select {
	padding: 0px;
	color: #333333;
	font-family: Calibri, Verdana, Arial;
	font-size: 14px;
}
p {
	margin: 0;
	-webkit-margin-before: 0em;
	-webkit-margin-after: 0em;
}
table {
     
      border-spacing:0px;
      margin:2px 0 2px 0;
      text-align:center;
      border-collapse:separate;
      table-layout: fixed;  
      empty-cells: show;    
      
}
td,th {
      padding:3px;
      font-size:12px;
      border:1px solid #000;
      border-width:1px 1px 1px 1px;
      margin:2px 0 2px 0;
      text-align:left;
      word-wrap:break-word;
      word-break:break-all; 
      page-break-inside:avoid;
}
th {
      text-align:center;
      font-weight:600;
      background-color:#F4F4F4;
}
.titlefont {
	font-size:24px;
}
.fangsong {
	font-family:FangSong_GB2312;
	font-size:13px;
}
.fangsongSmall {
	font-family:FangSong_GB2312;
	font-size:12px;
}

td{
     border-width:0px 1px 1px 0px;
}

td:first-child{
	border-left:1px solid black;
	
}

tr:first-child td{
	border-top:1px solid black;
}

tr.pagebreak td{
	border-top:1px solid black;
	
}
</style>

</head>
<body>
	
	<p align=center ><span class="titlefont">${printedReportForm.reportFormType.name}</span></p>
	<p align=center style="margin:10px 0 10px 0"><span>报审单名称：${printedReportForm.title}</span>&nbsp;
	<span>编号：${printedReportForm.formId}</span>&nbsp;&nbsp;&nbsp; <span>日期：${printedReportForm.sendTime}</span></p>
	
	<div align=center>	
	<table>
	 <tr>
	  <td width=45 valign=top >
	  <p><span>现土地使用者</span></p>
	  </td>
	  <td width=45 valign=top >
	  <p><span >原土地使用者</span></p>
	  </td>
	  <td width=45 valign=top>
	  <p><span>土地座落</span></p>
	  </td>
	  <td width=45 valign=top>
	  <p ><span >用地面积</span></p>
	  </td>
	  <td width=45 valign=top>
	  <p ><span >原用途</span></p>
	  </td>
	  <td width=45 valign=top>
	  <p ><span >现用途</span></p>
	  </td>
	  <td width=45 valign=top>
	  <p ><span >报审事项</span></p>
	  </td>
	  <td width=280 valign=top>
	  <p ><span >报审事项及说明</span></p>
	  </td>
	  <td width=90 colspan=2 valign=top>
	  <p ><b><span >办理依据</span></b></p>
	  </td>
	  <td width=114 valign=top>
	  <p ><b><span >报审单位意见</span></b></p>
	  </td>
	 </tr>
	 <tr>
	  <td width=45 valign=top >
	  <p ><span class="fangsong">${printedReportForm.landUser}</span></p>
	  </td>
	  <td width=45 valign=top>
	  <p ><span class="fangsong">${printedReportForm.originalLandUser}</span></p>
	  </td>
	  <td width=45 valign=top>
	  <p ><span class="fangsong">${printedReportForm.landLocation}</span></p>
	  </td>
	  <td width=45 valign=top>
	  <p ><span class="fangsong">${printedReportForm.landArea}
	  <c:choose>
				<c:when test="${printedReportForm.landAreaMeasure == 'MU'}">亩</c:when>
				<c:when test="${printedReportForm.landAreaMeasure == 'SQUARE_METER'}">平方米</c:when>
				<c:when test="${printedReportForm.landAreaMeasure == 'HECTARE'}">公顷</c:when>
				<c:otherwise>平方公里</c:otherwise>
	</c:choose>
	  </span></p>
	  </td>
	  <td width=45 valign=top>
	  <p ><span class="fangsong">${printedReportForm.originalLandUse}</span></p>
	  </td>
	  <td width=45 valign=top>
	  <p ><span class="fangsong">${printedReportForm.landUse}</span></p>
	  </td>
	  <td width=45 valign=top>
	  <p ><span class="fangsong">${printedReportForm.matter}</span></p>
	  </td>	   
	  <td width=280 valign=top>
	  <p ><span class="fangsongSmall">${printedReportForm.matterDetail}</span></p>
	  </td>
	  <td width=90 colspan=2 valign=top>
	  <p ><span class="fangsong">${printedReportForm.policyBasis}</span></p>
	  </td>
	  <td width=114 valign=top>
	  <p ><span class="fangsong">${printedReportForm.comment}</span></p>
	  </td>
	   
	 </tr>
	 <tr>
	  <td width=799 colspan=11 valign=top>
	  <p ><span >单位主要负责人：</span><span class="fangsong"
	     >${printedReportForm.responsiblePerson}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  <span >审核人：</span><span  
	class="fangsong">${printedReportForm.auditor}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  <span >制表人：</span><span  class="fangsong"
	   >${printedReportForm.tabulator}</span>
	   </p>
	  </td>
	 </tr>
	 <c:forEach var="feedback" items="${feedbackFromOrgUnits}">
	 <tr>
	  <td width=102 colspan=2 valign=top>
	  <p ><span >${feedback.owner}</span></p>
	  </td>
	  <td width=500 colspan=7 valign=top>
	  <p ><span class="fangsong">${feedback.content}</span></p>
	  </td>
	  <td width=197 colspan=2 valign=top>
	  <p ><span class="fangsong" >签名：${feedback.signature}</span></p>
	  <p ><span class="fangsong">日期：${feedback.feedbackTime}</span></p>
	  </td>
	 </tr>
	 </c:forEach>

	  <tr>
	  <td width=102 colspan=2 valign=top>
	  <p ><span >市局分管领导</span></p>
	  </td>
	  <td width=516 colspan=7 valign=top>
	  <p ><span class="fangsong">${feedbackFromLeader1.content}</span></p>
	  </td>
	  <td width=181 colspan=2 valign=top>
	  <p ><span class="fangsong" >签名：${feedbackFromLeader1.signature}</span></p>
	  <p ><span class="fangsong">日期：${feedbackFromLeader1.feedbackTime}</span></p>
	  </td>
	 </tr>
	   <tr>
	  <td width=102 colspan=2 valign=top>
	  <p ><span >市局主要领导</span></p>
	  
	  </td>
	  <td width=516 colspan=7 valign=top>
	  <p ><span class="fangsong">${feedbackFromLeader2.content}</span></p>
	  </td>
	  <td width=181 colspan=2 valign=top>
	  <p ><span class="fangsong" >签名：${feedbackFromLeader2.signature}</span></p>
	  <p ><span class="fangsong">日期：${feedbackFromLeader2.feedbackTime}</span></p>
	  </td>
	 </tr>
	   <tr>
	  <td width=102 colspan=2 valign=top>
	  <p ><span >市局意见</span></p>
	  </td>
	  <td width=697 colspan=9 valign=top>
	  <p ><span class="fangsong">${feedbackFromOffice.content}</span></p>
	  </td>
	 </tr>
	</table>
	</div>	
	<script>
	$(
		function(){
			var hasFirst = false;
			// the height of a page to print, it is not a constant value
			var pageHeight = 671;
			var previous = 0;
			$("tr").each(
				function(){
					
					var trHeight = $(this).offset().top +$(this).height();
					var trTop = $(this).offset().top;
					if( trTop <= pageHeight && trHeight > pageHeight && !hasFirst){
						hasFirst = true;
						$(this).addClass("pagebreak");
						previous = trTop;
					}
					
					if(previous > 0 ){
						var all = pageHeight + previous;
						if( trTop <= all && trHeight > all ){
							$(this).addClass("pagebreak");
							previous = trTop;
						}
					}
					
				}
			);
		}
	);
</script>
</body>
</html>