<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <!-- Define output as JSON -->
    <xsl:output method="text" />

    <!-- Top-level JSON object -->
    <xsl:template match="englishCourses">
        <xsl:text>{"englishCourses": {</xsl:text>
        <xsl:apply-templates />
        <xsl:text>}}</xsl:text>
    </xsl:template>

    <!-- Transform courses -->
    <xsl:template match="courses">
        <xsl:text>"courses": [</xsl:text>
        <xsl:apply-templates select="course" />
        <xsl:text>],</xsl:text>
    </xsl:template>

    <!-- Transform teachers -->
    <xsl:template match="teachers">
        <xsl:text>"teachers": {</xsl:text>
        <xsl:apply-templates select="male" />
        <xsl:text>,</xsl:text>
        <xsl:apply-templates
            select="female" />
        <xsl:text>},</xsl:text>
    </xsl:template>

    <!-- Transform male teachers -->
    <xsl:template match="male">
        <xsl:text>"male": [</xsl:text>
        <xsl:apply-templates select="t:teacher" />
        <xsl:text>],</xsl:text>
    </xsl:template>

    <!-- Transform female teachers -->
    <xsl:template match="female">
        <xsl:text>"female": [</xsl:text>
        <xsl:apply-templates select="t:teacher" />
        <xsl:text>]</xsl:text>
    </xsl:template>

    <!-- Transform course -->
    <xsl:template match="course">
        <xsl:text>{"id": "</xsl:text>
        <xsl:value-of select="@id" />
        <xsl:text>",</xsl:text>
        <xsl:text>"level": "</xsl:text>
        <xsl:value-of
            select="@level" />
        <xsl:text>",</xsl:text>
        <xsl:text>"c:name": "</xsl:text>
        <xsl:value-of
            select="c:name" />
        <xsl:text>",</xsl:text>
        <xsl:text>"c:subscriptiontype": "</xsl:text>
        <xsl:value-of
            select="c:subscriptiontype" />
        <xsl:text>",</xsl:text>
        <xsl:text>"c:description": "</xsl:text>
        <xsl:value-of
            select="c:description" />
        <xsl:text>",</xsl:text>
        <xsl:text>"c:price": "</xsl:text>
        <xsl:value-of
            select="c:price" />
        <xsl:text>",</xsl:text>
        <xsl:text>"c:duration": "</xsl:text>
        <xsl:value-of
            select="c:duration" />
        <xsl:text>",</xsl:text>
        
        <xsl:text>"c:schedule": {"day": "</xsl:text>
        <xsl:value-of
            select="c:schedule/@day" />
        <xsl:text>", "time": "</xsl:text>
        <xsl:value-of select="c:schedule/@time" />
        <xsl:text>", "length": "</xsl:text>
        <xsl:value-of
            select="c:schedule/@length" />
        <xsl:text>"},</xsl:text>
        <xsl:text>"c:image": {"src": "</xsl:text>
        <xsl:value-of
            select="c:image/@src" />
        <xsl:text>", "alt": "</xsl:text>
        <xsl:value-of select="c:image/@alt" />
        <xsl:text>"},</xsl:text>
        <xsl:text>"c:teacher": {"name": "</xsl:text>
        <xsl:value-of
            select="c:teacher/@name" />
        <xsl:text>", "email": "</xsl:text>
        <xsl:value-of select="c:teacher/@email" />
        <xsl:text>"}}</xsl:text>
        <xsl:if
            test="position() != last()">,</xsl:if>
    </xsl:template>



    <!-- transform teacher-->
    <xsl:template match="male">
        <xsl:text>{"id": "</xsl:text>
        <xsl:value-of select="@id" />
        <xsl:text>"t:name": "</xsl:text>
        <xsl:value-of
            select="t:name" />
        <xsl:text>"t:email": "</xsl:text>
        <xsl:value-of
            select="t:email" />
        <xsl:text>"t:education": "</xsl:text>
        <xsl:value-of
            select="t:education" />}        
    </xsl:template>
</xsl:stylesheet>