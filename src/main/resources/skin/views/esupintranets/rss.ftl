<?xml version="1.0"?>
<rss version="2.0">
    <channel>
            <title>Intranets</title>
            <link>${Context.baseURL}${Context.modulePath}/rss</link>
            <description>Liste des documents récemment modifiés dans les intranets</description>

            <#list result as child>
                <item>
                    <#assign section_path = child.path>
                    <#assign section_path = section_path?substring(Context.getProperty("sectionPath")?length, section_path?length)>
                    <title>${child.title}</title>
                    <link>${Context.baseURL}${Context.modulePath}/file/${section_path}</link>
                    <description>${child.description}</description>
                    <pubDate>${child.dublincore.modified}</pubDate>
                </item>
            </#list>

    </channel>
</rss>