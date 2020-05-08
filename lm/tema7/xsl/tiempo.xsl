<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html>
    <head>
        <style>
            table, th, td {
                border: 1px solid black;
            }
        </style>
    </head>
    <body>
        <h2>TIEMPO EN CORDOBA</h2>
        <table>
        <tr >
        <th>Dia</th>
        <th>Estado del Cielo</th>
        <th>Temp MIN</th>
        <th>Temp MAX</th>
        </tr>
        <xsl:for-each select="root/prediccion/dia">
            <tr>
                <td><xsl:value-of select="@fecha"/></td>
                <td><xsl:value-of select="estado_cielo/@descripcion"/></td>
                <td bgcolor="blue"><xsl:value-of select="temperatura/minima"/></td>
                <td bgcolor="orange"><xsl:value-of select="temperatura/maxima"/></td>
            </tr>
        </xsl:for-each>
        </table>
   </body>
</html>
</xsl:template>
</xsl:stylesheet>