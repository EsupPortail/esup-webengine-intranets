<@extends src="base.ftl">
<@block name="content">
<link rel="stylesheet" href="${skinPath}/css/intranets.css" type="text/css" media="screen" charset="utf-8">

<#include "includes/menu.ftl">
<#function get_path doc>
    <#assign rootPath = Context.getProperty("sectionPath")>
    <#assign rootPath = rootPath?substring(0, rootPath?length - 1)>
    <#if doc.path != rootPath>
		<#local section_path = doc.path>
		<#local section_path = section_path?substring(rootPath?length, section_path?length)>
		<#return get_path(doc.parent) + "> <a href='" + Context.baseURL + Context.modulePath + "/repository/" + index + section_path + "'>" + doc.title + "</a>     " + doc.dublincore.description>
    <#else>
		<#return " <a href='" + Context.baseURL + Context.modulePath + "/repository/" + index + "/'>" + doc.title + "</a>     " + doc.dublincore.description>
    </#if>
</#function>

<#function get_date doc modified_date>
    <#list doc.children as child>
		<#if modified_date < child.dublincore.modified>
		    <#local modified_date = child.dublincore.modified>
		</#if>
		<#if doc.isFolder>
		    <#local modified_date = get_date(child, modified_date)>
		</#if>
    </#list>
    <#return modified_date>
</#function>

<div class="fil_ariane">${get_path(Document)}</div>
<#assign flag_row = true>
<table class="dataOutput">
    <thead>
	<tr>
	    <th></th>
	    <th>Titre</th>
	    <th>Derni&egrave;re modification</th>
	    <th>Auteur</th>
	     <th>Description</th>
	</tr>
    </thead>
    <#list Document.children as child>
	    <#if flag_row>
		<#assign flag_row = false>
	    <tr class="dataRowEven">
	    <#else>
		<#assign flag_row = true>
	    <tr class="dataRowOdd">
	    </#if>
		<#if child.isFolder>
		    <td class="iconColumn"><img src="${Context.baseURL}/${contextPath}${child["common:icon"]}"></td>
		    <td><a href="${Context.URL}/${child.name}">${child.title}</a></td>
		<#else>
		    <#if child.type = "Picture">
		    	<#assign file = child["picture:views"][0]["content"]>
		    	<#assign filename = child["picture:views"][0]["filename"]>
			<#else>
			    <#assign file = child["file:content"]>
			    <#assign filename = file.filename>
	   		</#if>
		    <#assign section_path = child.path>
		    <#assign section_path = section_path?substring(Context.getProperty("sectionPath")?length, section_path?length)>
            <td class="iconColumn"><a href="${Context.getProperty("nuxeoUrl")}${Context.getProperty("sectionPath")}${section_path}${Context.getProperty("fileUserAction")}"><img src="${Context.baseURL}/${contextPath}${child["common:icon"]}"></a></td>
		    <td><a href="${Context.baseURL}${Context.modulePath}/file/${index}/${section_path}">${child.title}</a>
			<#if file.length &gt;1024>(${(file.length / 1024)?int} Ko)</#if>
			<#if file.length &lt;1024>(${file.length} B)</#if>
		    </td>
		</#if>
		<td>${get_date(child, child.dublincore.modified)}</td>
		<td>${child.dublincore.creator}</td>
		<td>${child.dublincore.description}</td>		
	    </tr>
    </#list>
</table>

</@block>
</@extends>
