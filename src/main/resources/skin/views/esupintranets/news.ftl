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
        </tr>
    </thead>
    <#list result as child>
        <#assign section_path = child.path>
        <#assign section_path = section_path?substring(Context.getProperty("sectionPath")?length, section_path?length)>
        <#assign file = child["file:content"]>
        <tr class="dataRowEven">
            <td class="iconColumn"><img src="${Context.baseURL}/${contextPath}${child["common:icon"]}"></td>
            <#if child.isFolder>
            <td><a href="${Context.baseURL}${Context.modulePath}/repository/${section_path}">${child.title}</a></td>
            <#else>
            <td><a href="${Context.baseURL}${Context.modulePath}/file/${section_path}">${file.filename}</a>
                <#if file.length &gt;999>(${file.length} Ko)</#if>
                <#if file.length &lt;999>(${file.length} B)</#if>
            </td>
            </#if>
            <td>${child.dublincore.modified}</td>
            <td>${child.dublincore.creator}</td>
        </tr>
    </#list>
</table>

</@block>
</@extends>