<@extends src="base.ftl">
  <@block name="title">Index</@block>
  <@block name="header">
    Beginning with Webengine !
  </@block>
  <@block name="content">
    This is the <i>index</i> of your module.
    <div>
      <a href="${This.path}/repository">Acc&egrave;der aux Intranets de l'UVHC</a>
    </div>

  </@block>
  <@block name="footer">
    <div class="tip">
      Your web root is <pre>${env.installDir}</pre>
    </div>
  </@block>
</@extends>
