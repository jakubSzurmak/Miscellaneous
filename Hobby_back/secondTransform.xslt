<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">

        <html>
            <head>
                <meta charset="UTF-8"/>
                <title>Hypertext hypermedia</title>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <link rel="stylesheet" href="stylesheet.css"/>
            </head>
            <body>
                <nav class="menubar">
                    <div class="big_menu_buttons">
                        <xsl:apply-templates select="mainHobbySite/links/link"/>
                        <a id="jump"/>
                    </div>
                </nav>

                <div class="content_icons2">
                    <xsl:for-each select="/descendant::*">
                        <xsl:apply-templates select="picture"/>
                    </xsl:for-each>
                    <hr/>
                </div>
                <footer>
                    <xsl:call-template name="initFooter"/>
                </footer>
            </body>
        </html>

    </xsl:template>

    <xsl:template match="link">
        <xsl:number value="position()" format="a) " />
        <a href="{@source}" target="_self">
            <xsl:value-of select="."/>
        </a>
    </xsl:template>

    <xsl:template match="picture">

        <img src="{@source}">
            <xsl:attribute name="id">
                <xsl:value-of select="@id"/>
            </xsl:attribute>

            <xsl:attribute name="format">
                <xsl:value-of select="@format"/>
            </xsl:attribute>

            <xsl:attribute name="source">
                <xsl:value-of select="@source"/>
            </xsl:attribute>

        </img>
    </xsl:template>

    <xsl:template name="initFooter">
        <span id="footerSpan">Are you lost Get back</span>
        <a class="footer1" href="#jump">!UP!</a>
    </xsl:template>

</xsl:stylesheet>