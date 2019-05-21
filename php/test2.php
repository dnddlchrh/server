<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title></title>
    <link rel="stylesheet" href="test2.css">
  </head>
  <body>
    <span id="a" onclick="cc()">파란글씨</span>
    <script type="text/javascript">
    var aa=document.getElementById('a');
      function cc() {
        alert("바보");
        console.log(aa);
        console.log(aa.getAttribute("Id"));
      }
    </script>
  </body>
</html>
