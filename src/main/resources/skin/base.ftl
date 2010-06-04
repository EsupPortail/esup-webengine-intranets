<html>
<head>
  <title>
     <@block name="title">
     WebEngine
     </@block>
  </title>
  <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
</head>

<body>
  <div id="wrap">
    <div id="main-wrapper">
      <div id="main">
        <div class="main-content">
          <div id="message"><@block name="message">${Context.getProperty('msg')}</@block></div>
          <div id="content"><@block name="content" /></div>
        </div>
      </div>
    </div>
  </div>
</body>
</html>
