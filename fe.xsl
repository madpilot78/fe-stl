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
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link href="fe.css" rel="stylesheet" />
      </head>
      <body class="font-sans">
        <div class="max-w-5xl min-w-[56rem] mx-auto p-0">
          <xsl:if test="a:FatturaElettronica/FatturaElettronicaHeader/CedentePrestatore">
            <div>
              <img src="logo.png" class="w-24 h-24"/>
              <xsl:for-each select="a:FatturaElettronica/FatturaElettronicaHeader/CedentePrestatore/DatiAnagrafici">
                <div>
                  <xsl:if test="Anagrafica/Denominazione">
                    <span>
                      <xsl:value-of select="Anagrafica/Denominazione" />
                    </span>
                  </xsl:if>
                  <xsl:if test="Anagrafica/Nome">
                    <span>
                      <xsl:value-of select="Anagrafica/Nome" />
                    </span>
                  </xsl:if>
                  <xsl:if test="Anagrafica/Cognome">
                    <span>
                      <xsl:value-of select="Anagrafica/Cognome" />
                    </span>
                  </xsl:if>
                  <xsl:if test="Anagrafica/Titolo">
                    <span>
                      <xsl:value-of select="Anagrafica/Titolo" />
                    </span>
                  </xsl:if>
                </div>
              </xsl:for-each>
              <xsl:for-each select="a:FatturaElettronica/FatturaElettronicaHeader/CedentePrestatore/Sede">
                <div>
                  <xsl:if test="Indirizzo">
                    <span>
                      <xsl:value-of select="Indirizzo" />
                    </span>
                  </xsl:if>
                  <xsl:if test="NumeroCivico">
                    <span>
                      <xsl:value-of select="NumeroCivico" />
                    </span>
                  </xsl:if>
                  <xsl:if test="CAP">
                    <span>
                      <xsl:value-of select="CAP" />
                    </span>
                  </xsl:if>
                  <xsl:if test="Comune">
                    <span>
                      <xsl:value-of select="Comune" />
                    </span>
                  </xsl:if>
                  <xsl:if test="Provincia">
                    <span>
                      <xsl:value-of select="Provincia" />
                    </span>
                  </xsl:if>
                  <xsl:if test="Nazione">
                    <span>
                      <xsl:value-of select="Nazione" />
                    </span>
                  </xsl:if>
                </div>
              </xsl:for-each>
              <xsl:for-each select="a:FatturaElettronica/FatturaElettronicaHeader/CedentePrestatore/DatiAnagrafici">
                <div>
                  <xsl:if test="IdFiscaleIVA">
                    <span>
                      Partita IVA:
                    </span>
                    <span>
                      <xsl:value-of select="IdFiscaleIVA/IdPaese" />
                      <xsl:value-of select="IdFiscaleIVA/IdCodice" />
                    </span>
                  </xsl:if>
                  <xsl:if test="CodiceFiscale">
                    <span>
                      Codice fiscale:
                    </span>
                    <span>
                      <xsl:value-of select="CodiceFiscale" />
                    </span>
                  </xsl:if>
                  <xsl:if test="RegimeFiscale">
                    <span>
                      <xsl:value-of select="RegimeFiscale" />
                    </span>
                    <xsl:variable name="RF">
                      <xsl:value-of select="RegimeFiscale" />
                    </xsl:variable>
                    <xsl:choose>
                      <xsl:when test="$RF='RF01'">
                        (ordinario)
                      </xsl:when>
                      <xsl:when test="$RF='RF02'">
                        (contribuenti minimi)
                      </xsl:when>
                      <xsl:when test="$RF='RF03'">
                        (nuove iniziative produttive) - Non più valido in quanto abrogato dalla legge di stabilità 2015
                      </xsl:when>
                      <xsl:when test="$RF='RF04'">
                        (agricoltura e attività connesse e pesca)
                      </xsl:when>
                      <xsl:when test="$RF='RF05'">
                        (vendita sali e tabacchi)
                      </xsl:when>
                      <xsl:when test="$RF='RF06'">
                        (commercio fiammiferi)
                      </xsl:when>
                      <xsl:when test="$RF='RF07'">
                        (editoria)
                      </xsl:when>
                      <xsl:when test="$RF='RF08'">
                        (gestione servizi telefonia pubblica)
                      </xsl:when>
                      <xsl:when test="$RF='RF09'">
                        (rivendita documenti di trasporto pubblico e di sosta)
                      </xsl:when>
                      <xsl:when test="$RF='RF10'">
                        (intrattenimenti, giochi e altre attività di cui alla tariffa allegata al DPR 640/72)
                      </xsl:when>
                      <xsl:when test="$RF='RF11'">
                        (agenzie viaggi e turismo)
                      </xsl:when>
                      <xsl:when test="$RF='RF12'">
                        (agriturismo)
                      </xsl:when>
                      <xsl:when test="$RF='RF13'">
                        (vendite a domicilio)
                      </xsl:when>
                      <xsl:when test="$RF='RF14'">
                        (rivendita beni usati, oggetti d’arte,
                        d’antiquariato o da collezione)
                      </xsl:when>
                      <xsl:when test="$RF='RF15'">
                        (agenzie di vendite all’asta di oggetti d’arte,
                        antiquariato o da collezione)
                      </xsl:when>
                      <xsl:when test="$RF='RF16'">
                        (IVA per cassa P.A.)
                      </xsl:when>
                      <xsl:when test="$RF='RF17'">
                        (IVA per cassa - art. 32-bis, D.L. 83/2012)
                      </xsl:when>
                      <xsl:when test="$RF='RF19'">
                        (Regime forfettario)
                      </xsl:when>
                      <xsl:when test="$RF='RF18'">
                        (altro)
                      </xsl:when>
                      <xsl:when test="$RF=''">
                      </xsl:when>
                      <xsl:otherwise>
                        <span>(!!! codice non previsto !!!)</span>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:if>
                </div>
              </xsl:for-each>
            </div>
          </xsl:if>
          <xsl:if test="a:FatturaElettronica/FatturaElettronicaHeader/CessionarioCommittente">
            <div>
              <xsl:for-each select="a:FatturaElettronica/FatturaElettronicaHeader/CessionarioCommittente/DatiAnagrafici">
                <div>
                  <xsl:if test="Anagrafica/Denominazione">
                    <span>
                      <xsl:value-of select="Anagrafica/Denominazione" />
                    </span>
                  </xsl:if>
                  <xsl:if test="Anagrafica/Nome">
                    <span>
                      <xsl:value-of select="Anagrafica/Nome" />
                    </span>
                  </xsl:if>
                  <xsl:if test="Anagrafica/Cognome">
                    <span>
                      <xsl:value-of select="Anagrafica/Cognome" />
                    </span>
                  </xsl:if>
                  <xsl:if test="Anagrafica/Titolo">
                    <span>
                      <xsl:value-of select="Anagrafica/Titolo" />
                    </span>
                  </xsl:if>
                </div>
              </xsl:for-each>
              <xsl:for-each select="a:FatturaElettronica/FatturaElettronicaHeader/CessionarioCommittente/Sede">
                <div>
                  <xsl:if test="Indirizzo">
                    <span>
                      <xsl:value-of select="Indirizzo" />
                    </span>
                  </xsl:if>
                  <xsl:if test="NumeroCivico">
                    <span>
                      <xsl:value-of select="NumeroCivico" />
                    </span>
                  </xsl:if>
                  <xsl:if test="CAP">
                    <span>
                      <xsl:value-of select="CAP" />
                    </span>
                  </xsl:if>
                  <xsl:if test="Comune">
                    <span>
                      <xsl:value-of select="Comune" />
                    </span>
                  </xsl:if>
                  <xsl:if test="Provincia">
                    <span>
                      <xsl:value-of select="Provincia" />
                    </span>
                  </xsl:if>
                  <xsl:if test="Nazione">
                    <span>
                      <xsl:value-of select="Nazione" />
                    </span>
                  </xsl:if>
                </div>
              </xsl:for-each>
              <xsl:for-each select="a:FatturaElettronica/FatturaElettronicaHeader/CessionarioCommittente/DatiAnagrafici">
                <div>
                  <xsl:if test="IdFiscaleIVA">
                    <span>
                      Partita IVA:
                    </span>
                    <span>
                      <xsl:value-of select="IdFiscaleIVA/IdPaese" />
                      <xsl:value-of select="IdFiscaleIVA/IdCodice" />
                    </span>
                  </xsl:if>
                  <xsl:if test="CodiceFiscale">
                    <span>
                      Codice fiscale:
                    </span>
                    <span>
                      <xsl:value-of select="CodiceFiscale" />
                    </span>
                  </xsl:if>
                </div>
              </xsl:for-each>
            </div>
          </xsl:if>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
