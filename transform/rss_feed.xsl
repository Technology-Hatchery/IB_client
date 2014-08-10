<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/rss/channel">
        <org.technologyhatchery.edgar.RSS>
            <infoMap>
                <xsl:for-each select="./*[not(name()='item')]">
                    <entry>
                        <string>
                            <xsl:value-of select="name()"/>
                        </string>
                        <string>
                            <xsl:value-of select="."/>
                        </string>
                    </entry>
                </xsl:for-each>
            </infoMap>
            <items>
                <xsl:for-each select="./*[name()='item']">
                    <org.technologyhatchery.edgar.Item>
                        <itemsMap>
                            <xsl:for-each select="./*[not(name()='xbrlFiling')]">
                                <entry>
                                    <string>
                                        <xsl:value-of select="name()"/>
                                    </string>
                                    <string>
                                        <xsl:value-of select="."/>
                                    </string>
                                </entry>
                            </xsl:for-each>
                            <xsl:for-each select="./xbrlFiling/*[not(name()='xbrlFiles')]">
                                <entry>
                                    <string>
                                        <xsl:value-of select="name()"/>
                                    </string>
                                    <string>
                                        <xsl:value-of select="."/>
                                    </string>
                                </entry>
                            </xsl:for-each>
                            <xsl:for-each select="./*[name()='enclosure']">
                                <entry>
                                    <string>
                                        <xsl:value-of select="name()"/>
                                    </string>
                                    <string>
                                        <xsl:value-of select="@url"/>
                                    </string>
                                </entry>
                            </xsl:for-each>
                        </itemsMap>
                    </org.technologyhatchery.edgar.Item>
                </xsl:for-each>
            </items>
        </org.technologyhatchery.edgar.RSS>
    </xsl:template>


</xsl:stylesheet>