<html>
<head>
<!-- this is a comment -->
  <title>Welcome!</title>
</head>
<body>
  <h1>
    Welcome ${user}<#if user == "Big Joe">, our beloved leader</#if>!
  </h1>
  <p>Our latest product:
  <a href="${latestProduct.url}">${latestProduct.name}</a>!

  <#if x == 1>
    x is 1
  <#elseif x == 2>
    x is 2
  <#elseif x == 3>
    x is 3
  <#elseif x == 4>
    x is 4
  <#else>
    x is not 1 nor 2 nor 3 nor 4
  </#if>

   <#switch being.size>
     <#case "small">
        This will be processed if it is small
        <#break>
     <#case "medium">
        This will be processed if it is medium
        <#break>
     <#case "large">
        This will be processed if it is large
        <#break>
     <#default>
        This will be processed if it is neither
   </#switch>


<#list seq as x>
  ${x}
  <#if x = "spring"><#break></#if>
</#list>

</body>
</html>