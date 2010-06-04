<@extends src="base.ftl">
<@block name="content">
<link rel="stylesheet" href="${skinPath}/css/intranets.css" type="text/css" media="screen" charset="utf-8">
<#include "includes/menu.ftl">
<form action="${This.path}/@search" method="get" accept-charset="utf-8">
	<input type="search" name="fullText" id="query" results="5" value="Search">
	<input type="hidden" name="orderBy" value="dc:modified">
	<input type="submit" value="Rechercher">
</form>
</@block>
</@extends>
