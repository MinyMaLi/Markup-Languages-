<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text"/>

    <xsl:template match="/">
        {
            "EnglishCourses": {
                "Courses": [
                    <xsl:apply-templates select="EnglishCourses/Course">
                        <xsl:sort select="Name"/>
                    </xsl:apply-templates>
                ]
            }
        }
    </xsl:template>

    <xsl:template match="Course">
        {
            "Name": "<xsl:value-of select="Name"/>",
            "SubscriptionType": "<xsl:value-of select="SubscriptionType"/>",
            "Description": "<xsl:value-of select="Description"/>",
            "Price": "<xsl:value-of select="Price"/>",
            "Duration": "<xsl:value-of select="Duration"/>",
            "Schedule": {
                "Day": "<xsl:value-of select="Schedule/Day"/>",
                "Time": "<xsl:value-of select="Schedule/Time"/>"
            }
        }
        <xsl:if test="position() != last()">,</xsl:if>
    </xsl:template>

</xsl:stylesheet>
