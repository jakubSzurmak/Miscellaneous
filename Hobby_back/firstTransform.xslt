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
                <div class="content_introduction">
                    <h1>
                        <em>
                            <strong>Basketball</strong>
                        </em>
                    </h1>
                    <xsl:apply-templates select="mainHobbySite/mainContent/facts/bBallStory"/>

                    <div class="introduction_pics">
                        <xsl:apply-templates select="mainHobbySite/mainContent/facts/pictures/picture"/>
                    </div>
                    <hr/>
                </div>

                <div class="content_icons">

                    <xsl:for-each select="mainHobbySite/players/player">
                        <xsl:sort select="name"/>
                        <h1>
                            <xsl:number value="round(number(position()))" format="1. "/>
                            <xsl:value-of select="name"/>
                        </h1>
                        <br/>
                        <p><xsl:value-of select="story"/></p>
                        <br/>
                        <xsl:apply-templates select="picture"/>
                        <br/>
                        <br/>
                        <p><xsl:apply-templates select="link"/></p>
                        <hr/>
                    </xsl:for-each>

                </div>
                <div class="ruleBox">
                    <br/>
                    <xsl:apply-templates select="mainHobbySite/rules/rule[1]"/>
                    <hr/>
                    <xsl:apply-templates select="mainHobbySite/rules/rule[2]"/>
                    <hr/>
                    <xsl:apply-templates select="mainHobbySite/rules/rule[3]"/>
                    <hr/>
                </div>

                <div class="content_contact">
                    <h1><em><strong>Contact Us</strong></em></h1>
                    <p>
                        If you would like to join our basketball community, find a crew to play,
                        watch games or just discuss basketball related topics, don't be afraid!
                        Fill the form, and we will reach out to you! There are no requirements to join,
                        other than love for basketball and your will to meet new people.
                    </p>
                    <form method="post">
                        <xsl:call-template name="initContact"/>
                        <button type="submit" name="send">SEND</button>
                        <button type="reset">CLEAR</button>
                    </form>
                </div>
                <hr/>
                    <xsl:apply-templates select="mainHobbySite/groundBar"/>
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

    <xsl:template match="mainHobbySite/mainContent/facts/bBallStory">
        <p>
            <xsl:value-of select="."/>
        </p>
    </xsl:template>

    <xsl:template match="mainHobbySite/rules/rule[@about = 'description']">
        <xsl:choose>
            <xsl:when test="@about = 'description'">
                <p><xsl:value-of select="."/></p>
            </xsl:when>
            <xsl:when test="@about = 'offence'">
                <p><xsl:value-of select="."/></p>
            </xsl:when>
            <xsl:when test="@about = 'defence'">
                <p><xsl:value-of select="."/></p>
            </xsl:when>
        </xsl:choose>

    </xsl:template>

    <xsl:template match="mainHobbySite/rules/rule[@about = 'offence']">
        <xsl:choose>
            <xsl:when test="@about = 'description'">
                <xsl:value-of select="."/>
            </xsl:when>
            <xsl:when test="@about = 'offence'">
                <xsl:value-of select="."/>
            </xsl:when>
            <xsl:when test="@about = 'defence'">
                <xsl:value-of select="."/>
            </xsl:when>
        </xsl:choose>

    </xsl:template>

    <xsl:template match="mainHobbySite/rules/rule[@about = 'defence']">
        <xsl:choose>
            <xsl:when test="@about = 'description'">
                <xsl:value-of select="."/>
            </xsl:when>
            <xsl:when test="@about = 'offence'">
                <xsl:value-of select="."/>
            </xsl:when>
            <xsl:when test="@about = 'defence'">
                <xsl:value-of select="."/>
            </xsl:when>
        </xsl:choose>

    </xsl:template>

    <xsl:template name="initContact">

        <xsl:apply-templates select="mainHobbySite/contact/content/questions/question[1]"/>
        <xsl:apply-templates select="mainHobbySite/contact/content/questions/question[2]"/>
        <xsl:apply-templates select="mainHobbySite/contact/content/questions/question[3]"/>
        <br/>

    </xsl:template>

    <xsl:template match="mainHobbySite/contact/content/questions/question">

        <xsl:if test="contains(@type, 'number')" >
            <input id="form_pnum" type="number" placeholder="Phone Number"/>
        </xsl:if>

        <xsl:if test="string(@type) = 'text'">
            <xsl:value-of select="mainHobbySite/contact/content/questions/question"/>
            <input id="form_fname" type="text" placeholder="{@placeholder}"/>
            <br/>
            <br/>
        </xsl:if>

    </xsl:template>

    <xsl:template match="mainHobbySite/groundBar">
        <footer>
            <span id="footerSpan">Are you lost Get back</span>
            <a class="footer1" href="#jump">!UP!</a>
        </footer>
    </xsl:template>

</xsl:stylesheet>