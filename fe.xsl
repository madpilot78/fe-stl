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
        <div class="relative max-w-5xl min-w-[56rem] mx-auto mt-6 p-0">

          <xsl:if test="a:FatturaElettronica/FatturaElettronicaHeader/CedentePrestatore">
            <div class="flex flex-row gap-x-2">

              <img src="logo.png" class="w-24 h-24 flex-none" />

              <div>
                <xsl:for-each select="a:FatturaElettronica/FatturaElettronicaHeader/CedentePrestatore/DatiAnagrafici">
                  <xsl:if test="Anagrafica/Denominazione">
                    <span class="block font-bold">
                      <xsl:value-of select="Anagrafica/Denominazione" />
                    </span>
                  </xsl:if>
                  <div class="font-bold">
                    <xsl:if test="Anagrafica/Nome">
                      <span>
                        <xsl:value-of select="Anagrafica/Nome" />
                      </span>
                    </xsl:if>
                    <xsl:if test="Anagrafica/Cognome">
                      <span class="ml-2">
                        <xsl:value-of select="Anagrafica/Cognome" />
                      </span>
                    </xsl:if>
                  </div>
                  <xsl:if test="Anagrafica/Titolo">
                    <span class="block">
                      <xsl:value-of select="Anagrafica/Titolo" />
                    </span>
                  </xsl:if>
                </xsl:for-each>
                <xsl:for-each select="a:FatturaElettronica/FatturaElettronicaHeader/CedentePrestatore/Sede">
                  <div>
                    <xsl:if test="Indirizzo">
                      <span>
                        <xsl:value-of select="Indirizzo" />
                      </span>
                    </xsl:if>
                    <xsl:if test="NumeroCivico">
                      <span class="ml-2">
                        <xsl:value-of select="NumeroCivico" />
                      </span>
                    </xsl:if>
                  </div>
                  <div>
                    <xsl:if test="CAP">
                      <span>
                        <xsl:value-of select="CAP" />
                      </span>
                    </xsl:if>
                    <xsl:if test="Comune">
                      <span class="ml-2">
                        <xsl:value-of select="Comune" />
                      </span>
                    </xsl:if>
                    <xsl:if test="Provincia">
                      <span class="ml-2">
                        (<xsl:value-of select="Provincia" />)
                      </span>
                    </xsl:if>
                  </div>
                  <xsl:if test="Nazione">
                    <span>
                      <xsl:value-of select="Nazione" />
                    </span>
                  </xsl:if>
                </xsl:for-each>
              </div>

              <div class="grid grid-cols-2 gap-y-0.5 gap-x-2 my-4 mx-auto">
                <xsl:for-each select="a:FatturaElettronica/FatturaElettronicaHeader/CedentePrestatore/DatiAnagrafici">
                  <xsl:if test="IdFiscaleIVA">
                    <span class="text-right">
                      Partita IVA:
                    </span>
                    <span class="font-mono">
                      <xsl:value-of select="IdFiscaleIVA/IdPaese" />
                      <xsl:value-of select="IdFiscaleIVA/IdCodice" />
                    </span>
                  </xsl:if>
                  <xsl:if test="CodiceFiscale">
                    <span class="text-right">
                      Codice fiscale:
                    </span>
                    <span class="font-mono">
                      <xsl:value-of select="CodiceFiscale" />
                    </span>
                  </xsl:if>
                  <xsl:if test="RegimeFiscale">
                    <span class="text-xs text-right">
                      Regime fiscale:
                    </span>
                    <div class="text-xs">
                      <span>
                        <xsl:value-of select="RegimeFiscale" />
                      </span>
                      <span class="mx-1">—</span>
                      <span>
                        <xsl:variable name="RF">
                          <xsl:value-of select="RegimeFiscale" />
                        </xsl:variable>
                        <xsl:choose>
                          <xsl:when test="$RF='RF01'">
                            ordinario
                          </xsl:when>
                          <xsl:when test="$RF='RF02'">
                            contribuenti minimi
                          </xsl:when>
                          <xsl:when test="$RF='RF03'">
                            nuove iniziative produttive — Non più valido in quanto abrogato dalla legge di stabilità 2015
                          </xsl:when>
                          <xsl:when test="$RF='RF04'">
                            agricoltura e attività connesse e pesca
                          </xsl:when>
                          <xsl:when test="$RF='RF05'">
                            vendita sali e tabacchi
                          </xsl:when>
                          <xsl:when test="$RF='RF06'">
                            commercio fiammiferi
                          </xsl:when>
                          <xsl:when test="$RF='RF07'">
                            editoria
                          </xsl:when>
                          <xsl:when test="$RF='RF08'">
                            gestione servizi telefonia pubblica
                          </xsl:when>
                          <xsl:when test="$RF='RF09'">
                            rivendita documenti di trasporto pubblico e di sosta
                          </xsl:when>
                          <xsl:when test="$RF='RF10'">
                            intrattenimenti, giochi e altre attività di cui alla tariffa allegata al DPR 640/72
                          </xsl:when>
                          <xsl:when test="$RF='RF11'">
                            agenzie viaggi e turismo
                          </xsl:when>
                          <xsl:when test="$RF='RF12'">
                            agriturismo
                          </xsl:when>
                          <xsl:when test="$RF='RF13'">
                            vendite a domicilio
                          </xsl:when>
                          <xsl:when test="$RF='RF14'">
                            rivendita beni usati, oggetti d’arte,
                            d’antiquariato o da collezione
                          </xsl:when>
                          <xsl:when test="$RF='RF15'">
                            agenzie di vendite all’asta di oggetti d’arte,
                            antiquariato o da collezione
                          </xsl:when>
                          <xsl:when test="$RF='RF16'">
                            IVA per cassa P.A.
                          </xsl:when>
                          <xsl:when test="$RF='RF17'">
                            IVA per cassa — art. 32-bis, D.L. 83/2012
                          </xsl:when>
                          <xsl:when test="$RF='RF19'">
                            Regime forfettario
                          </xsl:when>
                          <xsl:when test="$RF='RF18'">
                            altro
                          </xsl:when>
                          <xsl:when test="$RF=''">
                          </xsl:when>
                          <xsl:otherwise>
                            <span>(!!! codice non previsto !!!)</span>
                          </xsl:otherwise>
                        </xsl:choose>
                      </span>
                    </div>
                  </xsl:if>
                </xsl:for-each>
              </div>

              <xsl:for-each select="a:FatturaElettronica/FatturaElettronicaHeader/CedentePrestatore/Contatti">
                <div class="h-min grid grid-cols-2 gap-y-0.5 gap-x-2">
                  <xsl:if test="Telefono">
                    <span class="text-right">
                      Tel.:
                    </span>
                    <span>
                      <xsl:value-of select="Telefono" />
                    </span>
                  </xsl:if>
                  <xsl:if test="Fax">
                    <span class="text-right">
                      Fax:
                    </span>
                    <span>
                      <xsl:value-of select="Fax" />
                    </span>
                  </xsl:if>
                  <xsl:if test="Email">
                    <span class="text-right">
                      E-mail:
                    </span>
                    <span>
                      <xsl:value-of select="Email" />
                    </span>
                  </xsl:if>
                </div>
              </xsl:for-each>
            </div>
          </xsl:if>

          <div class="flex flex-row gap-x-2">

            <xsl:if test="a:FatturaElettronica/FatturaElettronicaHeader/DatiTrasmissione">
              <div class="h-min grid grid-cols-2 gap-y-0.5 gap-x-2 pt-8">
                <xsl:for-each select="a:FatturaElettronica/FatturaElettronicaHeader/DatiTrasmissione">
                  <xsl:if test="IdTrasmittente">
                      <span class="text-right">
                        Identificativo del trasmittente:
                      </span>
                      <span class="font-mono">
                        <xsl:value-of select="IdTrasmittente/IdPaese" />
                        <xsl:value-of select="IdTrasmittente/IdCodice" />
                      </span>
                  </xsl:if>
                  <xsl:if test="ProgressivoInvio">
                      <span class="text-right">
                        Progressivo di invio:
                      </span>
                      <span class="font-mono">
                        <xsl:value-of select="ProgressivoInvio" />
                      </span>
                  </xsl:if>
                  <xsl:if test="FormatoTrasmissione">
                      <span class="text-right">
                        Formato Trasmissione:
                      </span>
                      <span class="font-mono">
                        <xsl:value-of select="FormatoTrasmissione" />
                      </span>
                  </xsl:if>
                  <xsl:if test="CodiceDestinatario">
                      <span class="text-right">
                        Codice identificativo destinatario:
                      </span>
                      <span class="font-mono">
                        <xsl:value-of select="CodiceDestinatario" />
                      </span>
                  </xsl:if>
                  <xsl:if test="ContattiTrasmittente/Telefono">
                      <span class="text-right">
                        Telefono del trasmittente:
                      </span>
                      <span class="font-mono">
                        <xsl:value-of select="ContattiTrasmittente/Telefono" />
                      </span>
                  </xsl:if>
                  <xsl:if test="ContattiTrasmittente/Email">
                      <span class="text-right">
                        E-mail del trasmittente:
                      </span>
                      <span class="font-mono">
                        <xsl:value-of select="ContattiTrasmittente/Email" />
                      </span>
                  </xsl:if>
                  <xsl:if test="PECDestinatario">
                      <span class="text-right">
                        Destinatario PEC:
                      </span>
                      <span class="font-mono">
                        <xsl:value-of select="PECDestinatario" />
                      </span>
                  </xsl:if>
                </xsl:for-each>
              </div>
            </xsl:if>

            <xsl:if test="a:FatturaElettronica/FatturaElettronicaHeader/CessionarioCommittente">
              <div class="ml-auto">
                <h3 class="text-lg text-amber-600 font-bold">
                  Cliente:
                </h3>
                <div class="shadow border-2 border-black rounded-lg p-4">
                  <xsl:for-each select="a:FatturaElettronica/FatturaElettronicaHeader/CessionarioCommittente/DatiAnagrafici">
                    <xsl:if test="Anagrafica/Denominazione">
                      <span class="block font-bold">
                        <xsl:value-of select="Anagrafica/Denominazione" />
                      </span>
                    </xsl:if>
                    <div class="font-bold">
                      <xsl:if test="Anagrafica/Nome">
                        <span>
                          <xsl:value-of select="Anagrafica/Nome" />
                        </span>
                      </xsl:if>
                      <xsl:if test="Anagrafica/Cognome">
                        <span class="ml-2">
                          <xsl:value-of select="Anagrafica/Cognome" />
                        </span>
                      </xsl:if>
                    </div>
                    <xsl:if test="Anagrafica/Titolo">
                      <span class="block">
                        <xsl:value-of select="Anagrafica/Titolo" />
                      </span>
                    </xsl:if>
                  </xsl:for-each>
                  <xsl:for-each select="a:FatturaElettronica/FatturaElettronicaHeader/CessionarioCommittente/Sede">
                    <div>
                      <xsl:if test="Indirizzo">
                        <span>
                          <xsl:value-of select="Indirizzo" />
                        </span>
                      </xsl:if>
                      <xsl:if test="NumeroCivico">
                        <span class="ml-2">
                          <xsl:value-of select="NumeroCivico" />
                        </span>
                      </xsl:if>
                    </div>
                    <div>
                      <xsl:if test="CAP">
                        <span>
                          <xsl:value-of select="CAP" />
                        </span>
                      </xsl:if>
                      <xsl:if test="Comune">
                        <span class="ml-2">
                          <xsl:value-of select="Comune" />
                        </span>
                      </xsl:if>
                      <xsl:if test="Provincia">
                        <span class="ml-2">
                          (<xsl:value-of select="Provincia" />)
                        </span>
                      </xsl:if>
                    </div>
                    <xsl:if test="Nazione">
                      <span>
                        <xsl:value-of select="Nazione" />
                      </span>
                    </xsl:if>
                  </xsl:for-each>
                  <xsl:for-each select="a:FatturaElettronica/FatturaElettronicaHeader/CessionarioCommittente/DatiAnagrafici">
                    <div class="grid grid-cols-2 gap-y-0.5 gap-x-2 mt-4">
                      <xsl:if test="IdFiscaleIVA">
                        <span>
                          Partita IVA:
                        </span>
                        <span class="font-mono">
                          <xsl:value-of select="IdFiscaleIVA/IdPaese" />
                          <xsl:value-of select="IdFiscaleIVA/IdCodice" />
                        </span>
                      </xsl:if>
                      <xsl:if test="CodiceFiscale">
                        <span>
                          Codice fiscale:
                        </span>
                        <span class="font-mono">
                          <xsl:value-of select="CodiceFiscale" />
                        </span>
                      </xsl:if>
                    </div>
                  </xsl:for-each>
                </div>
              </div>
            </xsl:if>

          </div>

          <xsl:variable name="TOTALBODY">
            <xsl:value-of select="count(a:FatturaElettronica/FatturaElettronicaBody)" />
          </xsl:variable>

          <xsl:for-each select="a:FatturaElettronica/FatturaElettronicaBody">
            <xsl:if test="$TOTALBODY>1">
              <h2 class="text-lg text-amber-600 font-bold bg-slate-600 px-2 py-0.5 mt-4">
                Documento:
                <span class="font-mono"><xsl:value-of select="position()" /></span>
                di
                <span class="font-mono"><xsl:value-of select="$TOTALBODY" /></span>
              </h2>
            </xsl:if>

            <table class="table-fixed w-full border border-slate-600 mt-4">
              <thead>
                <tr>
                  <th colspan="3" class="border border-slate-600 bg-slate-500 text-amber-600">Dati documento</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td class="relative border border-slate-600">
                    <span class="text-2xs absolute left-0 top-0 p-0.5">Tipo documento:</span>
                    <xsl:if test="DatiGenerali/DatiGeneraliDocumento/TipoDocumento">
                      <span class="block text-center pt-4">
                        <xsl:value-of select="DatiGenerali/DatiGeneraliDocumento/TipoDocumento" />
                        <xsl:variable name="TD">
                          <xsl:value-of select="DatiGenerali/DatiGeneraliDocumento/TipoDocumento" />
                        </xsl:variable>
                        <xsl:choose>
                          <xsl:when test="$TD='TD01'">
                            fattura
                          </xsl:when>
                          <xsl:when test="$TD='TD02'">
                            acconto/anticipo su fattura
                          </xsl:when>
                          <xsl:when test="$TD='TD03'">
                            acconto/anticipo su parcella
                          </xsl:when>
                          <xsl:when test="$TD='TD04'">
                            nota di credito
                          </xsl:when>
                          <xsl:when test="$TD='TD05'">
                            nota di debito
                          </xsl:when>
                          <xsl:when test="$TD='TD06'">
                            parcella
                          </xsl:when>
                          <xsl:when test="$TD='TD16'">
                            integrazione fattura
                            reverse charge interno
                          </xsl:when>
                          <xsl:when test="$TD='TD17'">
                            integrazione/autofattura per
                            acquisto servizi da estero
                          </xsl:when>
                          <xsl:when test="$TD='TD18'">
                            integrazione per acquisto
                            beni intracomunitari
                          </xsl:when>
                          <xsl:when test="$TD='TD19'">
                            integrazione/autofattura per
                            acquisto beni ex art.17 c.2 DPR 633/72
                          </xsl:when>
                          <xsl:when test="$TD='TD20'">
                            autofattura per regolarizzazione e integrazione delle fatture
                            - ex art.6 c.8 e 9–bis d.lgs. 471/97 o art.46 c.5 D.L. 331/93
                          </xsl:when>
                          <xsl:when test="$TD='TD21'">
                            autofattura per splafonamento
                          </xsl:when>
                          <xsl:when test="$TD='TD22'">
                            estrazione beni da Deposito IVA
                          </xsl:when>
                          <xsl:when test="$TD='TD23'">
                            estrazione beni da Deposito IVA
                            con versamento IVA
                          </xsl:when>
                          <xsl:when test="$TD='TD24'">
                            fattura differita — art.21 c.4 terzo periodo lett. a – DPR 633/72
                          </xsl:when>
                          <xsl:when test="$TD='TD25'">
                            fattura differita — art.21 c.4 terzo periodo lett. b – DPR 633/72
                          </xsl:when>
                          <xsl:when test="$TD='TD26'">
                            cessione di beni ammortizzabili e per
                            passaggi interni — art.36 DPR 633/72
                          </xsl:when>
                          <xsl:when test="$TD='TD27'">
                            fattura per autoconsumo o per cessioni
                            gratuite senza rivalsa
                          </xsl:when>
                          <xsl:when test="$TD='TD28'">
                            acquisti da San Marino con IVA — Fattura Cartacea
                          </xsl:when>
                          <xsl:when test="$TD=''">
                          </xsl:when>
                          <xsl:otherwise>
                            <span>(!!! codice non previsto !!!)</span>
                          </xsl:otherwise>
                        </xsl:choose>
                      </span>
                    </xsl:if>
                  </td>
                  <td class="relative border border-slate-600">
                    <span class="text-2xs absolute left-0 top-0 p-0.5">Numero:</span>
                    <xsl:if test="DatiGenerali/DatiGeneraliDocumento/Numero">
                      <span class="block text-center pt-4">
                        <xsl:value-of select="DatiGenerali/DatiGeneraliDocumento/Numero" />
                      </span>
                    </xsl:if>
                  </td>
                  <td class="relative border border-slate-600">
                    <span class="text-2xs absolute left-0 top-0 p-0.5">Data:</span>
                    <xsl:if test="DatiGenerali/DatiGeneraliDocumento/Data">
                      <span class="block text-center pt-4">
                        <xsl:value-of select="DatiGenerali/DatiGeneraliDocumento/Data" />
                        <xsl:call-template name="FormatDate">
                          <xsl:with-param name="DateTime" select="DatiGenerali/DatiGeneraliDocumento/Data" />
                        </xsl:call-template>
                      </span>
                    </xsl:if>
                  </td>
                </tr>
                <tr>
                  <td class="relative border border-slate-600">
                    <span class="text-2xs absolute left-0 top-0 p-0.5">Valuta:</span>
                    <xsl:if test="DatiGenerali/DatiGeneraliDocumento/Divisa">
                      <span class="block text-center pt-4">
                        <xsl:value-of select="DatiGenerali/DatiGeneraliDocumento/Divisa" />
                      </span>
                    </xsl:if>
                  </td>
                  <td class="relative border border-slate-600">
                    <span class="text-2xs absolute left-0 top-0 p-0.5">Importo totale:</span>
                    <xsl:if test="DatiGenerali/DatiGeneraliDocumento/ImportoTotaleDocumento">
                      <span class="block text-center pt-4">
                        <xsl:value-of select="DatiGenerali/DatiGeneraliDocumento/ImportoTotaleDocumento" />
                      </span>
                    </xsl:if>
                  </td>
                  <td class="relative border border-slate-600">
                    <span class="text-2xs absolute left-0 top-0 p-0.5">Arrotondamento su totale:</span>
                    <xsl:if test="DatiGenerali/DatiGeneraliDocumento/Arrotondamento">
                      <span class="block text-center pt-4">
                        <xsl:value-of select="DatiGenerali/DatiGeneraliDocumento/Arrotondamento" />
                      </span>
                    </xsl:if>
                  </td>
                </tr>
              </tbody>
            </table>

          </xsl:for-each>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
