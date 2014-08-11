<?xml version="1.0"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns="http://www.w3.org/1999/xhtml">

<xsl:import href="resource:templates/reST.xsl" />

<xsl:template match="/" name="main">
<html>
  <head>
    <title><xsl:value-of select="/document/@title"/></title>
    <meta name="generator" content="Hovercraft! 1.0 http://regebro.github.com/hovercraft"/>
    <xsl:if test="/document/author"> <!-- Author is a child to the document, everything else become attributes -->
      <meta name="author">
        <xsl:attribute name="content">
          <xsl:value-of select="/document/author" />
        </xsl:attribute>
      </meta>
    </xsl:if>
    <xsl:if test="/document/@description">
      <meta name="description">
        <xsl:attribute name="content">
          <xsl:value-of select="/document/@description" />
        </xsl:attribute>
      </meta>
    </xsl:if>
    <xsl:if test="/document/@keywords">
      <meta name="keywords">
        <xsl:attribute name="content">
          <xsl:value-of select="/document/@keywords" />
        </xsl:attribute>
      </meta>
    </xsl:if>
    
    <xsl:for-each select="/document/templateinfo/header/css">
      <link rel="stylesheet">
        <xsl:copy-of select="@*"/>
      </link>
    </xsl:for-each>
    
    <xsl:if test="/document/@pygments">
        <link rel="stylesheet" media="all">
            <xsl:attribute name="href">css/pygments/<xsl:value-of select="/document/@pygments" />.css</xsl:attribute>
        </link>
    </xsl:if>

    <xsl:for-each select="/document/templateinfo/header/js">
      <script type="text/javascript">
        <xsl:copy-of select="@*"/>
      </script>
    </xsl:for-each>

  </head>
  <body class="impress-not-supported">
  
    <xsl:for-each select="/document">
      <div id="impress">
        <xsl:if test="@data-transition-duration">
          <xsl:attribute name="data-transition-duration">
            <xsl:value-of select="@data-transition-duration" />
          </xsl:attribute>
        </xsl:if>
        <xsl:if test="@auto-console">
          <xsl:attribute name="auto-console">
            <xsl:value-of select="@auto-console" />
          </xsl:attribute>
        </xsl:if>
        <xsl:for-each select="step">
          <div class="step">
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates />
          </div>
        </xsl:for-each>
      </div> 
    </xsl:for-each>
    
    <div id="footer">
        <img class="screen" width="203" height="41" title="" alt="Swedwise Logo" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAMsAAAApCAYAAACbd926AAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAfTSURBVHja7Fz9ldo4EFd4+f98FcSp4EwFOBWst4JABWsqiFMBmwogFcBWgKkAUgGkAnwVcPa90UXxaT4kGxbv07w3Lxss2/LM/DRftt5dLhcVKNCAKap5WvNDzanl+KHmsubv8Lc3vQtgCTRgKmp+AsBIqAHN3Bc0ASyBhkhxzeuaE8/zZzWvAlgCvXVqALJ18CYYrQA0YhoF2QcaWH6y7AEoCvKcpcsJ74P8Aw2IvghCrxJykgTCtZgBjJJ6mBCGBRoCZQCAIzHma83PNVet33MAWdQ1JAtgCXTv1Kz+EwBBjox5rHnTMc9hAfOeuYG+eKU61qgD3S21Q5XyzoCyBDAsCI+yYa7T2O4nBjB8SNZ4FuCo5qLm/QWnY82LmmPjvIYTy9isNcbkheW62NjmXmdj7Bnup+97vrjR2XKPs/C8bc3Lmqcgr/Z1css5CfFsbVmvibGpRQ76WGaZL3XfKTwLpeelRc8mHy/uRM3JNkdNsYMuKZbYyxI7X3ka3RkehgILpXgbpcjY3DI2MgzIhyTzcZVBW8GaCkJxNsIMdEksMIVQnhGzGF4c5u9DqQdQzoSel45g6QSYEbgl17q1LuElhptrJ1Ypcq7r7xOLS63uqIw5ZUKYSU9ySC1VH1fyaeR9gQT71qGXqW+MfnpcX4dklWtZeQQHbEA5gUJKYsJPhPIiRDFSUPRpJCb1DbSFIb8TcJfnnQjyioZ2jvNMkLlUAj0vepIVJ/vUYqQUuP/wnIcXYEaIcpoS3Ee4YMNjJPFJGeWlHVfaxAJkzkiahO8dwX8KhFlazhvDtW0eJmPAnHb0LCkyR9fya5s2Fj2PLUYUe8qszQeBp7b9fnJ4pr4BU5hgsXmVOVJaOxBClIYgKbOycGM36nXoAIJ7RlZ+l0UjIcJemxeZWLz+qYdn+mYxlgMi4/TK8s0JUMaIUcc3AMwX/eyur7tUzI25vIV7sJQxknsoa74IVlhu0Ugd5ZDeWA4/X0GuT8SxB2KRXAo9XxfALCiwFMjv3434trSsslzeMmEmzhnVTt0/SfIWFzn0ka9g9JkAvMmrKwM0ZQpMP8D2sPBt39HzcYD5N98bIXFk43qOAJq4FYp9MnguUGJKGA3liWyhSqmGQaWjHFzHbjxBbIvJz7ByJq35m3qeXVlelDxmBlhLAjBbAE0BEUwBz8cBUQqYz4po+Ji0h35HJKhhY/2WyHJsS9Tic0F/JEUaaluCM0HPYMs0B7leBNVvwWSE9VuWFl205yTps0SC/sIRrhUL+hVY0xbjgrjWGpnPlmlQu5DUhqeYbLgBF0SxVHPpjHRZM6TLjxnVWmDAPk3J4gZgiYhrFhYDtS0MU6RTvvAEi2vzeW9punZpSlIyxd4msN0/u3SjI/N2Cfpso1Z4JQlzMnB5C2EIovOWibDqMkGKATs1HLK9S5cSRQtMDn3nKwcoDUvCuASS57Xq5/sR1VPo2Mz9Ufn3y2J4pgUjp//RyBKnfoR+AleazJX9LdAXJCbFKjqlYGyf+cqtuv+lUA47pCiQXEkOJzC2P5Xse/QMcthryr0iDFshgBl3lEWu8I+/Eg4spjALAM0YvE5F1KAlynywTGBHrJRPHYyEa0o+3wgsO0d5lRaFXfNVnwpkMQZdPxMLZC4oz5aM3B+ZapdLtU7bqS5A+Pbepur315WU5f+/gSUHcGhOWsqZGd7GVoWIPUqnpnFsBMgeShWMm3NCyGqHKLMvOWQtPWetecxBz3PHVb4P2hBVslwg50cApFmlfYR/V8z55utKCRGend4jBw+WVagR8F+WXCK2gKOkENpaIfXfEaGY3QDBovOWpLW4YMYvAUIXOayFuVLjYT4IjLRPOoANxYgxV0q2Gwvmpb9CyJUiC37j8b8p+oXi0rWD/6NDCEKtkKXj+CF7F0xOJ0GeeCs5/P0KsvpKHFsyi68kT6PCtSmAhCpkvNjA8oE44cMVjIQDV3VnYHnomLf4Lhp9f5oQqfuiFVNs6AoYBSlFhciCemGz+X0zQlCWIjHvVBCySVZJFyO5F6CkoLAceV7XudtktLuiHE6W/ClH8qqnV5LxjFkQugKGCudSAqxzneDbBjSx2xH+1X+vEQVUjsotlf1N16qnOL2JPy8M5wJgtM/ZIoqqCPdO7V1QOgKia95WIvnA2dDzHjgSLoqczNrM7dOlC0qKAUyX72teHNOMldbviIgVY/WrLxBTiHNU7s4DXH1TnyHInFkNSwc5nDy9lDQnwEIQrefE8VxXigVjJE3HXDlukNdhgfkPvCOY3MxDGDNF17fLHoznnneVOYFSuSrNjjAKF49T9TDfTx7XaapjxY1lu1Gen/72uFCuYA6/qPWSGre7yx7Z3UUJN1nYMru4HIWbJfhutKHfVcs8dirZw/wXgneLuHefXHdx4e6XOewqE8G7aJLdXZKed3fJb7kbi9AmzbltqWtSm+yZ36LcyyYRga5XvJAUZl6Detkgz7jWHjk2hvtssGuFHSkDDYH6AIz+5iVBQtQm93ygrhF20Q80BHLZjSVCjh2JAobei4D0TsGzBHprHkYXRPSrRgkzvvEqHyU3D2AJ9FYBI6WxElZcQxgW6C2GZFKaKYfWRABLoCED5uR5fgM0SY8sgCXQmwGM3iXUxcuslPzT6pCzBHpzpLfQ1V/kxhZgNUn/tw7eSP0jwADgkPyDCokmIgAAAABJRU5ErkJggg=="/>


        <p>
            <xsl:value-of select="/document/@title"/>
            <xsl:if test="/document/author">
                -
                <xsl:value-of select="/document/author" />
            </xsl:if>
            <xsl:if test="/document/@event">
                 - <xsl:value-of select="/document/@event" />
            </xsl:if>
        </p>
    </div>
  
    <div id="hovercraft-help">
      <xsl:if test="/document/@skip-help">
        <xsl:attribute name="class">hide</xsl:attribute>
      </xsl:if>
      <table>
        <tr><th>Space</th><td>Forward</td></tr>
        <tr><th>Right, Down, Page Down</th><td>Next slide</td></tr>
        <tr><th>Left, Up, Page Up</th><td>Previous slide</td></tr>
        <tr><th>P</th><td>Open presenter console</td></tr>
        <tr><th>H</th><td>Toggle this help</td></tr>
      </table>
    </div>
    <xsl:for-each select="/document/templateinfo/body/js">
      <script type="text/javascript">
        <xsl:copy-of select="@*"/>
      </script>
    </xsl:for-each>
  
</body>
</html>
</xsl:template>

</xsl:stylesheet>
