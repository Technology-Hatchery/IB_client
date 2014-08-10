<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:us-gaap="http://xbrl.us/us-gaap/2008-03-31"
                >


    <xsl:template match="/*[local-name()='xbrl']">
        <org.technologyhatchery.edgar.Filing>
        <infoMap>
        </infoMap>
        <itemsMap>
            <!--xsl:for-each select="./*"-->
            <xsl:for-each select="./us-gaap:*[not(@nil) and @decimals]">
                <entry>
                    <string><xsl:value-of select="local-name()" /></string>
                    <float><xsl:value-of select="." /></float>
                    <!--float><xsl:value-of select="node-name()" /></float>
                    <string><xsl:value-of select="base-uri()" /></string>
                    <string><xsl:value-of select="root()" /></string-->
                </entry>
            </xsl:for-each>
        </itemsMap>
        </org.technologyhatchery.edgar.Filing>
    </xsl:template>

</xsl:stylesheet>