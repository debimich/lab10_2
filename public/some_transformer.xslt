<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
        <table border="1">
          <tr>
            <th>Итерация</th>
            <th>Результат вычисления</th>
          </tr>
          <xsl:for-each select="guesses/guess">
            <tr>
              <td>
                <xsl:value-of select="position()" />
              </td>
              <td>
                <xsl:value-of select="." />
              </td>
            </tr>
          </xsl:for-each>
        </table>
        <a href="/sqrt/input">Повторить вычисления</a>
  </xsl:template>
</xsl:stylesheet>