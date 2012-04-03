<@extends src="base.ftl">
<@block name="content">
<link rel="stylesheet" href="${skinPath}/css/intranets.css" type="text/css" media="screen" charset="utf-8">
<#include "includes/menu.ftl">

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
    <#list result as child>
		<#assign section_path = child.path>
		<#assign section_path = section_path?substring(Context.getProperty("sectionPath")?length, section_path?length)>
	    <#if child.type = "Picture">
	    	<#assign file = child["picture:views"][0]["content"]>
	    	<#assign filename = child["picture:views"][0]["filename"]>
	    <#else>
		    <#assign file = child["file:content"]>
		    <#assign filename = file.filename>
	    </#if>
		<tr class="dataRowEven">
	    	    <#if child.isFolder>
	    	        <td class="iconColumn"><img src="${Context.baseURL}/${contextPath}${child["common:icon"]}"></td>
	    	    	<td><a href="${Context.baseURL}${Context.modulePath}/repository/${index}/${section_path}">${child.title}</a></td>
	    	    <#else>
                <td class="iconColumn"><a href="${nuxeoUrl}${Context.getProperty("sectionPath")}${section_path}${fileUserAction}"><img src="${Context.baseURL}/${contextPath}${child["common:icon"]}"></a></td>
		    	    <td>
			    	    <a href="${Context.baseURL}${Context.modulePath}/file/${index}/${section_path}">${child.title}</a>
			        	<#if file.length &gt;999>(${(file.length / 1024)?int} Ko)</#if>
			        	<#if file.length &lt;999>(${file.length} B)</#if>
		    	    </td>
	    	    </#if>
	    	    <td>${child.dublincore.modified}</td>
	    	    <td>${child.dublincore.creator}</td>
	    	    <td>${child.dublincore.description}</td>	    	    
		</tr>
    </#list>
</table>

</@block>
</@extends>
