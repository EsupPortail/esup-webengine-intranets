<#assign index = Context.getProperty("index")>
<div class="menu">
    <div class="menu_button">
        <div class="menu_image"><img src="${Context.baseURL}${skinPath}/image/icon_directory.png"></div>
        <div class="menu_text"><a href="${Context.baseURL}${Context.modulePath}/tree/${index}">plan</a></div>
        <div class="clearer"></div>
    </div>
    <div class="menu_button">
        <div class="menu_image"><img src="${Context.baseURL}${skinPath}/image/icon_search.png"></div>
        <div class="menu_text"><a href="${Context.baseURL}${Context.modulePath}/form/${index}">recherche</a></div>
        <div class="clearer"></div>
    </div>
    <div class="menu_button">
        <div class="menu_image"><img src="${Context.baseURL}${skinPath}/image/icon_tree.png"></div>
        <div class="menu_text"><a href="${Context.baseURL}${Context.modulePath}/repository/${index}">intranets</a></div>
        <div class="clearer"></div>
    </div>
    <div class="menu_button">
        <div class="menu_image"><img src="${Context.baseURL}${skinPath}/image/icon_info.png"></div>
        <div class="menu_text"><a href="${Context.baseURL}${Context.modulePath}/news/${index}">nouveaut&eacute;s</a></div>
        <div class="clearer"></div>
    </div>
    <div class="clearer"></div>
</div>