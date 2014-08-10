<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fil="http://cactusventuresinc.com/20130930"
                xmlns:link="http://www.xbrl.org/2003/linkbase"
                xmlns:xbrldi="http://xbrl.org/2006/xbrldi"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:xbrli="http://www.xbrl.org/2003/instance"
                xmlns:iso4217="http://www.xbrl.org/2003/iso4217"
                xmlns:country="http://xbrl.sec.gov/country/2013-01-31"
                xmlns:currency="http://xbrl.sec.gov/currency/2012-01-31"
                xmlns:dei="http://xbrl.sec.gov/dei/2013-01-31"
                xmlns:deprecated="http://www.xbrl.org/2009/arcrole/fact-explanatoryFact"
                xmlns:exch="http://xbrl.sec.gov/exch/2013-01-31"
                xmlns:invest="http://xbrl.sec.gov/invest/2013-01-31"
                xmlns:naics="http://xbrl.sec.gov/naics/2011-01-31"
                xmlns:net="http://www.xbrl.org/2009/role/net"
                xmlns:nonnum="http://www.xbrl.org/dtr/type/non-numeric"
                xmlns:num="http://www.xbrl.org/dtr/type/numeric"
                xmlns:ref="http://www.xbrl.org/2006/ref"
                xmlns:sic="http://xbrl.sec.gov/sic/2011-01-31"
                xmlns:stpr="http://xbrl.sec.gov/stpr/2011-01-31"
                xmlns:us-gaap="http://fasb.org/us-gaap/2013-01-31"
                xmlns:us-gaap-att="http://fasb.org/us-gaap/attributes"
                xmlns:us-types="http://fasb.org/us-types/2013-01-31"
                xmlns:utr="http://www.xbrl.org/2009/utr"
                xmlns:xbrldt="http://xbrl.org/2005/xbrldt"
                xmlns:xl="http://www.xbrl.org/2003/XLink">

    <xsl:template match="/xbrli:xbrl">
        <filings>
            <org.technologyhatchery.edgar.Filing>
            <infoMap>
            </infoMap>
            <itemsMap>
                <xsl:for-each select="./*[starts-with(name(),'us-gaap') and not(@nil) and @decimals]">
                    <entry>
                        <string><xsl:value-of select="name()" /></string>
                        <float><xsl:value-of select="." /></float>
                    </entry>
                </xsl:for-each>
            </itemsMap>
            </org.technologyhatchery.edgar.Filing>
        </filings>
    </xsl:template>

</xsl:stylesheet>