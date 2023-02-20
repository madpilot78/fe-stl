<?xml version="1.0"?>
<xsl:stylesheet
  version="1.1"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:a="http://ivaservizi.agenziaentrate.gov.it/docs/xsd/fatture/v1.2">
  <xsl:output method="html" />

  <xsl:template name="FormatDate">
    <xsl:param name="DateTime" />

    <xsl:variable name="year" select="substring($DateTime,1,4)" />
    <xsl:variable name="month" select="substring($DateTime,6,2)" />
    <xsl:variable name="day" select="substring($DateTime,9,2)" />

    <xsl:value-of select="' ('" />
    <xsl:value-of select="$day" />
    <xsl:value-of select="' '" />
    <xsl:choose>
      <xsl:when test="$month = '1' or $month = '01'">
        Gennaio
      </xsl:when>
      <xsl:when test="$month = '2' or $month = '02'">
        Febbraio
      </xsl:when>
      <xsl:when test="$month = '3' or $month = '03'">
        Marzo
      </xsl:when>
      <xsl:when test="$month = '4' or $month = '04'">
        Aprile
      </xsl:when>
      <xsl:when test="$month = '5' or $month = '05'">
        Maggio
      </xsl:when>
      <xsl:when test="$month = '6' or $month = '06'">
        Giugno
      </xsl:when>
      <xsl:when test="$month = '7' or $month = '07'">
        Luglio
      </xsl:when>
      <xsl:when test="$month = '8' or $month = '08'">
        Agosto
      </xsl:when>
      <xsl:when test="$month = '9' or $month = '09'">
        Settembre
      </xsl:when>
      <xsl:when test="$month = '10'">
        Ottobre
      </xsl:when>
      <xsl:when test="$month = '11'">
        Novembre
      </xsl:when>
      <xsl:when test="$month = '12'">
        Dicembre
      </xsl:when>
      <xsl:otherwise>
        Mese non riconosciuto
      </xsl:otherwise>
    </xsl:choose>
    <xsl:value-of select="' '" />
    <xsl:value-of select="$year" />

    <xsl:variable name="time" select="substring($DateTime,12)" />
    <xsl:if test="$time != ''">
      <xsl:variable name="hh" select="substring($time,1,2)" />
      <xsl:variable name="mm" select="substring($time,4,2)" />
      <xsl:variable name="ss" select="substring($time,7,2)" />

      <xsl:value-of select="' '" />
      <xsl:value-of select="$hh" />
      <xsl:value-of select="':'" />
      <xsl:value-of select="$mm" />
      <xsl:value-of select="':'" />
      <xsl:value-of select="$ss" />
    </xsl:if>
    <xsl:value-of select="')'" />
  </xsl:template>

  <xsl:template match="/">
    <html>
      <head>
      </head>
      <body>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
