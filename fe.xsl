<?xml version="1.0"?>

<!--
Copyright (c) 2023, Guido Falsi <mad@madpilot.net>

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation
   and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its
   contributors may be used to endorse or promote products derived from
   this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-->

<xsl:stylesheet
  version="1.1"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:a="http://ivaservizi.agenziaentrate.gov.it/docs/xsd/fatture/v1.2"
>
  <xsl:output method="html" />

  <xsl:template name="FormatDate">
    <xsl:param name="DateTime" />

    <xsl:variable name="year" select="substring($DateTime,1,4)" />
    <xsl:variable name="month" select="substring($DateTime,6,2)" />
    <xsl:variable name="day" select="substring($DateTime,9,2)" />

    <xsl:value-of select="$day" />
    <xsl:value-of select="' '" />
    <xsl:choose>
      <xsl:when test="$month = '1' or $month = '01'">Gennaio</xsl:when>
      <xsl:when test="$month = '2' or $month = '02'">Febbraio</xsl:when>
      <xsl:when test="$month = '3' or $month = '03'">Marzo</xsl:when>
      <xsl:when test="$month = '4' or $month = '04'">Aprile</xsl:when>
      <xsl:when test="$month = '5' or $month = '05'">Maggio</xsl:when>
      <xsl:when test="$month = '6' or $month = '06'">Giugno</xsl:when>
      <xsl:when test="$month = '7' or $month = '07'">Luglio</xsl:when>
      <xsl:when test="$month = '8' or $month = '08'">Agosto</xsl:when>
      <xsl:when test="$month = '9' or $month = '09'">Settembre</xsl:when>
      <xsl:when test="$month = '10'">Ottobre</xsl:when>
      <xsl:when test="$month = '11'">Novembre</xsl:when>
      <xsl:when test="$month = '12'">Dicembre</xsl:when>
      <xsl:otherwise>Mese non riconosciuto</xsl:otherwise>
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
  </xsl:template>

  <xsl:template match="/">
    <html>
      <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta name="generator" content="fe-stl by Guido Falsi" />
        <style>/*! tailwindcss v3.3.6 | MIT License | https://tailwindcss.com*/*,:after,:before{box-sizing:border-box;border:0 solid #e5e7eb}:after,:before{--tw-content:""}html{line-height:1.5;-webkit-text-size-adjust:100%;-moz-tab-size:4;-o-tab-size:4;tab-size:4;font-family:ui-sans-serif,system-ui,-apple-system,BlinkMacSystemFont,Segoe UI,Roboto,Helvetica Neue,Arial,Noto Sans,sans-serif,Apple Color Emoji,Segoe UI Emoji,Segoe UI Symbol,Noto Color Emoji;font-feature-settings:normal;font-variation-settings:normal}body{margin:0;line-height:inherit}hr{height:0;color:inherit;border-top-width:1px}abbr:where([title]){-webkit-text-decoration:underline dotted;text-decoration:underline dotted}h1,h2,h3,h4,h5,h6{font-size:inherit;font-weight:inherit}a{color:inherit;text-decoration:inherit}b,strong{font-weight:bolder}code,kbd,pre,samp{font-family:ui-monospace,SFMono-Regular,Menlo,Monaco,Consolas,Liberation Mono,Courier New,monospace;font-feature-settings:normal;font-variation-settings:normal;font-size:1em}small{font-size:80%}sub,sup{font-size:75%;line-height:0;position:relative;vertical-align:initial}sub{bottom:-.25em}sup{top:-.5em}table{text-indent:0;border-color:inherit;border-collapse:collapse}button,input,optgroup,select,textarea{font-family:inherit;font-feature-settings:inherit;font-variation-settings:inherit;font-size:100%;font-weight:inherit;line-height:inherit;color:inherit;margin:0;padding:0}button,select{text-transform:none}[type=button],[type=reset],[type=submit],button{-webkit-appearance:button;background-color:initial;background-image:none}:-moz-focusring{outline:auto}:-moz-ui-invalid{box-shadow:none}progress{vertical-align:initial}::-webkit-inner-spin-button,::-webkit-outer-spin-button{height:auto}[type=search]{-webkit-appearance:textfield;outline-offset:-2px}::-webkit-search-decoration{-webkit-appearance:none}::-webkit-file-upload-button{-webkit-appearance:button;font:inherit}summary{display:list-item}blockquote,dd,dl,figure,h1,h2,h3,h4,h5,h6,hr,p,pre{margin:0}fieldset{margin:0}fieldset,legend{padding:0}menu,ol,ul{list-style:none;margin:0;padding:0}dialog{padding:0}textarea{resize:vertical}input::-moz-placeholder,textarea::-moz-placeholder{opacity:1;color:#9ca3af}input::placeholder,textarea::placeholder{opacity:1;color:#9ca3af}[role=button],button{cursor:pointer}:disabled{cursor:default}audio,canvas,embed,iframe,img,object,svg,video{display:block;vertical-align:middle}img,video{max-width:100%;height:auto}[hidden]{display:none}*,::backdrop,:after,:before{--tw-border-spacing-x:0;--tw-border-spacing-y:0;--tw-translate-x:0;--tw-translate-y:0;--tw-rotate:0;--tw-skew-x:0;--tw-skew-y:0;--tw-scale-x:1;--tw-scale-y:1;--tw-pan-x: ;--tw-pan-y: ;--tw-pinch-zoom: ;--tw-scroll-snap-strictness:proximity;--tw-gradient-from-position: ;--tw-gradient-via-position: ;--tw-gradient-to-position: ;--tw-ordinal: ;--tw-slashed-zero: ;--tw-numeric-figure: ;--tw-numeric-spacing: ;--tw-numeric-fraction: ;--tw-ring-inset: ;--tw-ring-offset-width:0px;--tw-ring-offset-color:#fff;--tw-ring-color:#3b82f680;--tw-ring-offset-shadow:0 0 #0000;--tw-ring-shadow:0 0 #0000;--tw-shadow:0 0 #0000;--tw-shadow-colored:0 0 #0000;--tw-blur: ;--tw-brightness: ;--tw-contrast: ;--tw-grayscale: ;--tw-hue-rotate: ;--tw-invert: ;--tw-saturate: ;--tw-sepia: ;--tw-drop-shadow: ;--tw-backdrop-blur: ;--tw-backdrop-brightness: ;--tw-backdrop-contrast: ;--tw-backdrop-grayscale: ;--tw-backdrop-hue-rotate: ;--tw-backdrop-invert: ;--tw-backdrop-opacity: ;--tw-backdrop-saturate: ;--tw-backdrop-sepia: }.absolute{position:absolute}.relative{position:relative}.bottom-0{bottom:0}.bottom-px{bottom:1px}.left-0{left:0}.right-0{right:0}.top-0{top:0}.m-0{margin:0}.m-0\.5{margin:.125rem}.mx-2{margin-left:.5rem;margin-right:.5rem}.mx-4{margin-left:1rem;margin-right:1rem}.mx-auto{margin-left:auto;margin-right:auto}.my-4{margin-top:1rem}.mb-4,.my-4{margin-bottom:1rem}.ml-2{margin-left:.5rem}.ml-4{margin-left:1rem}.ml-7{margin-left:1.75rem}.ml-auto{margin-left:auto}.mr-2{margin-right:.5rem}.mt-4{margin-top:1rem}.mt-6{margin-top:1.5rem}.mt-8{margin-top:2rem}.block{display:block}.flex{display:flex}.table{display:table}.grid{display:grid}.h-24{height:6rem}.h-8{height:2rem}.h-min{height:-moz-min-content;height:min-content}.w-24{width:6rem}.w-32{width:8rem}.w-36{width:9rem}.w-full{width:100%}.min-w-\[56rem\]{min-width:56rem}.min-w-fit{min-width:-moz-fit-content;min-width:fit-content}.max-w-5xl{max-width:64rem}.flex-none{flex:none}.table-fixed{table-layout:fixed}.list-inside{list-style-position:inside}.list-disc{list-style-type:disc}.grid-cols-2{grid-template-columns:repeat(2,minmax(0,1fr))}.flex-row{flex-direction:row}.gap-x-2{-moz-column-gap:.5rem;column-gap:.5rem}.gap-y-0{row-gap:0}.gap-y-0\.5{row-gap:.125rem}.truncate{overflow:hidden;text-overflow:ellipsis;white-space:nowrap}.whitespace-pre-line{white-space:pre-line}.rounded{border-radius:.25rem}.rounded-lg{border-radius:.5rem}.border{border-width:1px}.border-2{border-width:2px}.border-black{--tw-border-opacity:1;border-color:rgb(0 0 0/var(--tw-border-opacity))}.border-slate-300{--tw-border-opacity:1;border-color:rgb(203 213 225/var(--tw-border-opacity))}.border-slate-600{--tw-border-opacity:1;border-color:rgb(71 85 105/var(--tw-border-opacity))}.bg-slate-300{--tw-bg-opacity:1;background-color:rgb(203 213 225/var(--tw-bg-opacity))}.bg-slate-500{--tw-bg-opacity:1;background-color:rgb(100 116 139/var(--tw-bg-opacity))}.bg-slate-600{--tw-bg-opacity:1;background-color:rgb(71 85 105/var(--tw-bg-opacity))}.p-0{padding:0}.p-0\.5{padding:.125rem}.p-1{padding:.25rem}.p-4{padding:1rem}.px-2{padding-left:.5rem;padding-right:.5rem}.py-0{padding-top:0;padding-bottom:0}.py-0\.5{padding-top:.125rem;padding-bottom:.125rem}.py-1{padding-top:.25rem;padding-bottom:.25rem}.pt-4{padding-top:1rem}.pt-8{padding-top:2rem}.text-center{text-align:center}.text-right{text-align:right}.font-mono{font-family:ui-monospace,SFMono-Regular,Menlo,Monaco,Consolas,Liberation Mono,Courier New,monospace}.font-sans{font-family:ui-sans-serif,system-ui,-apple-system,BlinkMacSystemFont,Segoe UI,Roboto,Helvetica Neue,Arial,Noto Sans,sans-serif,Apple Color Emoji,Segoe UI Emoji,Segoe UI Symbol,Noto Color Emoji}.text-2xs{font-size:.625rem;line-height:.875rem}.text-lg{font-size:1.125rem;line-height:1.75rem}.text-sm{font-size:.875rem;line-height:1.25rem}.text-xl{font-size:1.25rem;line-height:1.75rem}.text-xs{font-size:.75rem;line-height:1rem}.font-bold{font-weight:700}.font-normal{font-weight:400}.leading-normal{line-height:1.5}.text-amber-600{--tw-text-opacity:1;color:rgb(217 119 6/var(--tw-text-opacity))}.text-gray-500{--tw-text-opacity:1;color:rgb(107 114 128/var(--tw-text-opacity))}.text-gray-700{--tw-text-opacity:1;color:rgb(55 65 81/var(--tw-text-opacity))}.text-slate-500{--tw-text-opacity:1;color:rgb(100 116 139/var(--tw-text-opacity))}.text-slate-900{--tw-text-opacity:1;color:rgb(15 23 42/var(--tw-text-opacity))}.shadow{--tw-shadow:0 1px 3px 0 #0000001a,0 1px 2px -1px #0000001a;--tw-shadow-colored:0 1px 3px 0 var(--tw-shadow-color),0 1px 2px -1px var(--tw-shadow-color);box-shadow:var(--tw-ring-offset-shadow,0 0 #0000),var(--tw-ring-shadow,0 0 #0000),var(--tw-shadow)}</style>
<xsl:comment>
Generated using fe-stl by Guido Falsi
avalable at https://github.com/madpilot78/fe-stl.git
</xsl:comment>
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
                    <span class="text-right">Partita IVA:</span>
                    <span class="font-mono">
                      <xsl:value-of select="IdFiscaleIVA/IdPaese" />
                      <xsl:value-of select="IdFiscaleIVA/IdCodice" />
                    </span>
                  </xsl:if>
                  <xsl:if test="CodiceFiscale">
                    <span class="text-right">Codice fiscale:</span>
                    <span class="font-mono">
                      <xsl:value-of select="CodiceFiscale" />
                    </span>
                  </xsl:if>
                  <xsl:if test="RegimeFiscale">
                    <span class="text-xs text-right">Regime fiscale:</span>
                    <div class="text-xs">
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
                      <span class="relative bottom-px font-mono text-2xs text-gray-500 ml-2">
                        [<xsl:value-of select="RegimeFiscale" />]
                      </span>
                    </div>
                  </xsl:if>
                </xsl:for-each>
              </div>

              <xsl:for-each select="a:FatturaElettronica/FatturaElettronicaHeader/CedentePrestatore/Contatti">
                <div class="h-min grid grid-cols-2 gap-y-0.5 gap-x-2">
                  <xsl:if test="Telefono">
                    <span class="text-right">Tel.:</span>
                    <span>
                      <xsl:value-of select="Telefono" />
                    </span>
                  </xsl:if>
                  <xsl:if test="Fax">
                    <span class="text-right">Fax:</span>
                    <span>
                      <xsl:value-of select="Fax" />
                    </span>
                  </xsl:if>
                  <xsl:if test="Email">
                    <span class="text-right">E-mail:</span>
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
              <div class="text-sm h-min grid grid-cols-2 gap-y-0.5 gap-x-2 pt-8">
                <xsl:for-each select="a:FatturaElettronica/FatturaElettronicaHeader/DatiTrasmissione">
                  <xsl:if test="IdTrasmittente">
                    <span class="text-right">
                      Identificativo del trasmittente:
                    </span>
                    <span class="font-mono truncate">
                      <span class="text-slate-500 mr-2">
                        <xsl:value-of select="IdTrasmittente/IdPaese" />
                      </span>
                      <xsl:value-of select="IdTrasmittente/IdCodice" />
                    </span>
                  </xsl:if>
                  <xsl:if test="ProgressivoInvio">
                    <span class="text-right">
                      Progressivo di invio:
                    </span>
                    <span class="font-mono truncate">
                      <xsl:value-of select="ProgressivoInvio" />
                    </span>
                  </xsl:if>
                  <xsl:if test="FormatoTrasmissione">
                    <span class="text-right">
                      Formato Trasmissione:
                    </span>
                    <span class="font-mono truncate">
                      <xsl:value-of select="FormatoTrasmissione" />
                    </span>
                  </xsl:if>
                  <xsl:if test="CodiceDestinatario">
                    <span class="text-right">
                      Codice identificativo destinatario:
                    </span>
                    <span class="font-mono truncate">
                      <xsl:value-of select="CodiceDestinatario" />
                    </span>
                  </xsl:if>
                  <xsl:if test="ContattiTrasmittente/Telefono">
                    <span class="text-right">
                      Telefono del trasmittente:
                    </span>
                    <span class="font-mono truncate">
                      <xsl:value-of select="ContattiTrasmittente/Telefono" />
                    </span>
                  </xsl:if>
                  <xsl:if test="ContattiTrasmittente/Email">
                    <span class="text-right">
                      E-mail del trasmittente:
                    </span>
                    <span class="font-mono truncate">
                      <xsl:value-of select="ContattiTrasmittente/Email" />
                    </span>
                  </xsl:if>
                  <xsl:if test="PECDestinatario">
                    <span class="text-right">
                      Destinatario PEC:
                    </span>
                    <span class="font-mono truncate">
                      <xsl:value-of select="PECDestinatario" />
                    </span>
                  </xsl:if>
                </xsl:for-each>
              </div>
            </xsl:if>

            <xsl:if test="a:FatturaElettronica/FatturaElettronicaHeader/CessionarioCommittente">
              <div class="ml-auto min-w-fit">
                <h3 class="text-lg text-amber-600 font-bold">Cliente:</h3>
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
                        <span>Partita IVA:</span>
                        <span class="font-mono">
                          <xsl:value-of select="IdFiscaleIVA/IdPaese" />
                          <xsl:value-of select="IdFiscaleIVA/IdCodice" />
                        </span>
                      </xsl:if>
                      <xsl:if test="CodiceFiscale">
                        <span>Codice fiscale:</span>
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
                <span class="font-mono">
                  <xsl:value-of select="position()"/>
                </span>
                di
                <span class="font-mono">
                  <xsl:value-of select="$TOTALBODY"/>
                </span>
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
                      <span class="block text-center pt-4 ml-7">
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
                      <span class="absolute left-0 bottom-0 font-mono text-xs text-gray-500 p-0.5">
                        <xsl:value-of select="DatiGenerali/DatiGeneraliDocumento/TipoDocumento" />
                      </span>
                    </xsl:if>
                  </td>
                  <td class="relative border border-slate-600">
                    <span class="text-2xs absolute left-0 top-0 p-0.5">Numero:</span>
                    <xsl:if test="DatiGenerali/DatiGeneraliDocumento/Numero">
                      <span class="block font-mono text-center pt-4">
                        <xsl:value-of select="DatiGenerali/DatiGeneraliDocumento/Numero" />
                      </span>
                    </xsl:if>
                  </td>
                  <td class="relative border border-slate-600">
                    <span class="text-2xs absolute left-0 top-0 p-0.5">Data:</span>
                    <xsl:if test="DatiGenerali/DatiGeneraliDocumento/Data">
                      <span class="block text-center pt-4">
                        <xsl:value-of select="DatiGenerali/DatiGeneraliDocumento/Data" />
                        <span class="text-sm text-gray-700 ml-4">
                          <xsl:call-template name="FormatDate">
                            <xsl:with-param name="DateTime" select="DatiGenerali/DatiGeneraliDocumento/Data" />
                          </xsl:call-template>
                        </span>
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
                      <span class="block font-mono text-center pt-4">
                        <xsl:value-of select="DatiGenerali/DatiGeneraliDocumento/ImportoTotaleDocumento" />
                      </span>
                    </xsl:if>
                  </td>
                  <td class="relative border border-slate-600">
                    <span class="text-2xs absolute left-0 top-0 p-0.5">Arrotondamento su totale:</span>
                    <xsl:if test="DatiGenerali/DatiGeneraliDocumento/Arrotondamento">
                      <span class="block font-mono text-center pt-4">
                        <xsl:value-of select="DatiGenerali/DatiGeneraliDocumento/Arrotondamento" />
                      </span>
                    </xsl:if>
                  </td>
                </tr>
              </tbody>
            </table>

            <xsl:if test="DatiGenerali/DatiGeneraliDocumento/DatiBollo">
              <table class="table-fixed w-full border border-slate-600">
                <thead>
                  <tr>
                    <th colspan="2" class="border border-slate-600 bg-slate-500 text-amber-600">Bollo</th>
                  </tr>
                </thead>
                <tbody>
                  <xsl:for-each select="DatiGenerali/DatiGeneraliDocumento/DatiBollo">
                    <tr>
                      <td class="relative border border-slate-600">
                        <span class="text-2xs absolute left-0 top-0 p-0.5">Tipo:</span>
                        <xsl:if test="BolloVirtuale">
                          <xsl:variable name="BV">
                            <xsl:value-of select="BolloVirtuale" />
                          </xsl:variable>
                          <xsl:if test="$BV!=''">
                            <span class="block text-center text-sm pt-4">
                              Bollo assolto ai sensi del decreto MEF 17 giugno 2014 (Art. 6)
                            </span>
                          </xsl:if>
                        </xsl:if>
                      </td>
                      <td class="relative border border-slate-600">
                        <span class="text-2xs absolute left-0 top-0 p-0.5">Importo:</span>
                        <xsl:if test="ImportoBollo">
                          <span class="block font-mono text-center pt-4">
                            <xsl:value-of select="ImportoBollo" />
                          </span>
                        </xsl:if>
                      </td>
                    </tr>
                  </xsl:for-each>
                </tbody>
              </table>
            </xsl:if>

            <xsl:if test="DatiGenerali/DatiGeneraliDocumento/Causale">
              <table class="table-fixed w-full border border-slate-600 mt-4">
                <thead>
                  <tr>
                    <th class="border border-slate-600 bg-slate-500 text-amber-600">Causale</th>
                  </tr>
                </thead>
                <tbody>
                  <xsl:for-each select="DatiGenerali/DatiGeneraliDocumento/Causale">
                    <tr>
                      <td class="relative border border-slate-600">
                        <p class="p-1"><xsl:value-of select="current()" /></p>
                      </td>
                    </tr>
                  </xsl:for-each>
                </tbody>
              </table>
            </xsl:if>

            <xsl:if test="DatiGenerali/DatiGeneraliDocumento/DatiRitenuta">
              <table class="table-fixed w-full border border-slate-600 mt-4">
                <thead>
                  <tr>
                    <th colspan="3" class="border border-slate-600 bg-slate-500 text-amber-600">Ritenuta</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td class="relative border border-slate-600">
                      <span class="text-2xs absolute left-0 top-0 p-0.5">Tipo:</span>
                      <xsl:if test="TipoRitenuta">
                        <span class="block text-center pt-4">
                          <xsl:variable name="TR">
                            <xsl:value-of select="TipoRitenuta" />
                          </xsl:variable>
                          <xsl:choose>
                            <xsl:when test="$TR='RT01'">
                              ritenuta persone fisiche
                            </xsl:when>
                            <xsl:when test="$TR='RT02'">
                              ritenuta persone giuridiche
                            </xsl:when>
                            <xsl:when test="$TR='RT03'">
                              contributo INPS
                            </xsl:when>
                            <xsl:when test="$TR='RT04'">
                              contributo ENASARCO
                            </xsl:when>
                            <xsl:when test="$TR='RT05'">
                              contributo ENPAM
                            </xsl:when>
                            <xsl:when test="$TR='RT06'">
                              altro contributo previdenziale
                            </xsl:when>
                            <xsl:when test="$TR=''">
                            </xsl:when>
                            <xsl:otherwise>
                              <span>(!!! codice non previsto !!!)</span>
                            </xsl:otherwise>
                          </xsl:choose>
                        </span>
                        <span class="absolute left-0 bottom-0 font-mono text-xs text-gray-500 p-0.5">
                          <xsl:value-of select="TipoRitenuta" />
                        </span>
                      </xsl:if>
                    </td>
                    <td class="relative border border-slate-600">
                      <span class="text-2xs absolute left-0 top-0 p-0.5">Importo:</span>
                      <xsl:if test="ImportoRitenuta">
                        <span class="block font-mono text-center pt-4">
                          <xsl:value-of select="ImportoRitenuta" />
                        </span>
                      </xsl:if>
                    </td>
                    <td class="relative border border-slate-600">
                      <span class="text-2xs absolute left-0 top-0 p-0.5">Aliquota (%):</span>
                      <xsl:if test="AliquotaRitenuta">
                        <span class="block font-mono text-center pt-4">
                          <xsl:value-of select="AliquotaRitenuta" />
                        </span>
                      </xsl:if>
                    </td>
                  </tr>
                  <tr>
                    <td colspan="3" class="relative border border-slate-600">
                      <span class="text-2xs absolute left-0 top-0 p-0.5">Causale di pagamento:</span>
                      <xsl:if test="CausalePagamento">
                        <span class="block text-center pt-4">
                          <xsl:value-of select="CausalePagamento" />
                          <xsl:variable name="CP">
                            <xsl:value-of select="CausalePagamento" />
                          </xsl:variable>
                          <xsl:if test="$CP!=''">
                            (decodifica come da modello CU)
                          </xsl:if>
                        </span>
                      </xsl:if>
                    </td>
                  </tr>
                </tbody>
              </table>
            </xsl:if>

            <xsl:if test="DatiBeniServizi/DettaglioLinee">
              <table class="table-fixed w-full border border-slate-600 mt-4">
                <col />
                <col class="w-24" />
                <col class="w-32" />
                <col class="w-24" />
                <col class="w-32" />
                <thead>
                  <tr>
                    <th colspan="5" class="border border-slate-600 bg-slate-500 text-amber-600">Beni/Servizi</th>
                  </tr>
                  <tr>
                    <th class="border border-slate-600 bg-slate-300 text-amber-600">Descrizione</th>
                    <th class="border border-slate-600 bg-slate-300 text-amber-600">Quantità</th>
                    <th class="border border-slate-600 bg-slate-300 text-amber-600">Costo unitario</th>
                    <th class="border border-slate-600 bg-slate-300 text-amber-600">IVA %</th>
                    <th class="border border-slate-600 bg-slate-300 text-amber-600">Importo</th>
                  </tr>
                </thead>
                <tbody>
                  <xsl:for-each select="DatiBeniServizi/DettaglioLinee">
                    <tr>
                      <td class="border border-slate-600">
                        <xsl:for-each select="CodiceArticolo">
                          <span>
                            [
                            <xsl:value-of select="CodiceTipo" />
                            —
                            <xsl:value-of select="CodiceValore" />
                            ]
                          </span>
                        </xsl:for-each>
                        <xsl:if test="Descrizione">
                          <span>
                            <xsl:value-of select="Descrizione" />
                          </span>
                        </xsl:if>
                      </td>
                      <td class="relative border border-slate-600 text-right">
                        <xsl:if test="Quantita">
                          <span class="font-mono block text-center">
                            <xsl:value-of select="Quantita" />
                          </span>
                        </xsl:if>
                        <xsl:if test="UnitaMisura">
                          <span class="absolute right-0 bottom-0 m-0.5 text-xs">
                            <xsl:value-of select="UnitaMisura" />
                          </span>
                        </xsl:if>
                      </td>
                      <td class="border border-slate-600 text-right">
                        <xsl:if test="PrezzoUnitario">
                          <span class="font-mono">
                            <xsl:value-of select="PrezzoUnitario" />
                          </span>
                        </xsl:if>
                      </td>
                      <td class="border border-slate-600 text-right">
                        <xsl:if test="AliquotaIVA">
                          <span class="font-mono">
                            <xsl:value-of select="AliquotaIVA" />
                          </span>
                        </xsl:if>
                      </td>
                      <td class="border border-slate-600 text-right">
                        <xsl:if test="PrezzoTotale">
                          <span class="font-mono">
                            <xsl:value-of select="PrezzoTotale" />
                          </span>
                        </xsl:if>
                      </td>
                    </tr>
                  </xsl:for-each>
                </tbody>
              </table>
            </xsl:if>

            <xsl:if test="DatiBeniServizi/DatiRiepilogo">
              <table class="table-fixed w-full border border-slate-600 mt-4">
                <col class="w-24"/>
                <col />
                <col class="w-32" />
                <col class="w-32" />
                <col />
                <thead>
                  <tr>
                    <th colspan="5" class="border border-slate-600 bg-slate-500 text-amber-600">Riepilogo aliquote IVA</th>
                  </tr>
                  <tr>
                    <th class="border border-slate-600 bg-slate-300 text-amber-600">Aliquota</th>
                    <th class="border border-slate-600 bg-slate-300 text-amber-600">Natura</th>
                    <th class="border border-slate-600 bg-slate-300 text-amber-600">Imponibile</th>
                    <th class="border border-slate-600 bg-slate-300 text-amber-600">Imposta</th>
                    <th class="border border-slate-600 bg-slate-300 text-amber-600">Esigibilità</th>
                  </tr>
                </thead>
                <tbody>
                  <xsl:for-each select="DatiBeniServizi/DatiRiepilogo">
                    <tr>
                      <td class="border border-slate-600 text-right">
                        <xsl:if test="AliquotaIVA">
                          <span class="font-mono">
                            <xsl:value-of select="AliquotaIVA" />
                          </span>
                        </xsl:if>
                      </td>
                      <td class="relative border border-slate-600 text-center">
                        <xsl:if test="Natura">
                          <span class="absolute left-0 bottom-0 font-mono text-xs text-gray-500 p-0.5">
                            <xsl:value-of select="Natura" />
                          </span>
                          <span class="ml-7">
                            <xsl:variable name="NAT1">
                              <xsl:value-of select="Natura" />
                            </xsl:variable>
                            <xsl:choose>
                              <xsl:when test="$NAT1='N1'">
                                escluse ex art.15
                              </xsl:when>
                              <xsl:when test="$NAT1='N2'">
                                non soggette
                              </xsl:when>
                              <xsl:when test="$NAT1='N2.1'">
                                non soggette ad IVA — artt. da 7 a 7–septies
                                del DPR 633/72
                              </xsl:when>
                              <xsl:when test="$NAT1='N2.2'">
                                non soggette — altri casi
                              </xsl:when>
                              <xsl:when test="$NAT1='N3'">
                                non imponibili
                              </xsl:when>
                              <xsl:when test="$NAT1='N3.1'">
                                non imponibili — esportazioni
                              </xsl:when>
                              <xsl:when test="$NAT1='N3.2'">
                                non imponibili — cessioni intracomunitarie
                              </xsl:when>
                              <xsl:when test="$NAT1='N3.3'">
                                non imponibili — cessioni verso S.Marino
                              </xsl:when>
                              <xsl:when test="$NAT1='N3.4'">
                                non imponibili — operazioni assimilate alle
                                cessioni all'esportazione
                              </xsl:when>
                              <xsl:when test="$NAT1='N3.5'">
                                non imponibili — a seguito di dichiarazioni
                                d'intento
                              </xsl:when>
                              <xsl:when test="$NAT1='N3.6'">
                                non imponibili — altre operazioni che non
                                concorrono alla formazione del plafond
                              </xsl:when>
                              <xsl:when test="$NAT1='N4'">
                                esenti
                              </xsl:when>
                              <xsl:when test="$NAT1='N5'">
                                regime del margine / IVA non esposta in fattura
                              </xsl:when>
                              <xsl:when test="$NAT1='N6'">
                                inversione contabile per le operazioni in reverse
                                charge ovvero nei casi di autofatturazione per
                                acquisti extra UE di servizi ovvero per importazioni
                                di beni nei soli casi previsti
                              </xsl:when>
                              <xsl:when test="$NAT1='N6.1'">
                                inversione contabile — cessione di rottami e
                                altri materiali di recupero
                              </xsl:when>
                              <xsl:when test="$NAT1='N6.2'">
                                inversione contabile — cessione di oro e
                                argento ai sensi della legge 7/2000 nonché di oreficeria
                                usata ad OPO
                              </xsl:when>
                              <xsl:when test="$NAT1='N6.3'">
                                inversione contabile — subappalto nel settore
                                edile
                              </xsl:when>
                              <xsl:when test="$NAT1='N6.4'">
                                inversione contabile — cessione di fabbricati
                              </xsl:when>
                              <xsl:when test="$NAT1='N6.5'">
                                inversione contabile — cessione di telefoni
                                cellulari
                              </xsl:when>
                              <xsl:when test="$NAT1='N6.6'">
                                inversione contabile — cessione di prodotti
                                elettronici
                              </xsl:when>
                              <xsl:when test="$NAT1='N6.7'">
                                inversione contabile — prestazioni comparto
                                edile e settori connessi
                              </xsl:when>
                              <xsl:when test="$NAT1='N6.8'">
                                inversione contabile — operazioni settore
                                energetico
                              </xsl:when>
                              <xsl:when test="$NAT1='N6.9'">
                                inversione contabile - altri casi
                              </xsl:when>
                              <xsl:when test="$NAT1='N7'">
                                IVA assolta in altro stato UE — prestazione di servizi di
                                telecomunicazioni, tele-radiodiffusione ed elettronici ex
                                art. 7–octies, comma 1 lett. a, b, art. 74–sexies DPR 633/72
                              </xsl:when>
                              <xsl:otherwise>
                                <span>(!!! codice non previsto !!!)</span>
                              </xsl:otherwise>
                            </xsl:choose>
                          </span>
                        </xsl:if>
                      </td>
                      <td class="border border-slate-600 text-right">
                        <xsl:if test="ImponibileImporto">
                          <span class="font-mono">
                            <xsl:value-of select="ImponibileImporto" />
                          </span>
                        </xsl:if>
                      </td>
                      <td class="border border-slate-600 text-right">
                        <xsl:if test="Imposta">
                          <span class="font-mono">
                            <xsl:value-of select="Imposta" />
                          </span>
                        </xsl:if>
                      </td>
                      <td class="relative border border-slate-600 text-center">
                        <xsl:if test="EsigibilitaIVA">
                          <span class="absolute left-0 bottom-0 font-mono text-xs text-gray-500 p-0.5">
                            <xsl:value-of select="EsigibilitaIVA" />
                          </span>
                          <xsl:variable name="EI">
                            <xsl:value-of select="EsigibilitaIVA" />
                          </xsl:variable>
                          <span>
                            <xsl:choose>
                              <xsl:when test="$EI='I'">
                                esigibilità immediata
                              </xsl:when>
                              <xsl:when test="$EI='D'">
                                esigibilità differita
                              </xsl:when>
                              <xsl:when test="$EI='S'">
                                scissione dei pagamenti
                              </xsl:when>
                              <xsl:otherwise>
                                <span>(!!! codice non previsto !!!)</span>
                              </xsl:otherwise>
                            </xsl:choose>
                          </span>
                        </xsl:if>
                      </td>
                    </tr>
                    <xsl:if test="RiferimentoNormativo">
                      <tr>
                        <td colspan="5">
                          <span class="whitespace-pre-line mx-2 leading-normal">
                            <xsl:value-of select="RiferimentoNormativo" />
                          </span>
                        </td>
                      </tr>
                    </xsl:if>
                  </xsl:for-each>
                </tbody>
              </table>
            </xsl:if>

            <xsl:if test="DatiPagamento">
              <table class="table-fixed w-full border border-slate-600 mt-4">
                <col class="w-36"/>
                <col />
                <col class="w-32"/>
                <thead>
                  <tr>
                    <th colspan="4" class="border border-slate-600 bg-slate-500">
                      <span class="text-amber-600">Dati pagamento</span>
                      <xsl:if test="DatiPagamento/CondizioniPagamento">
                        —
                        <span class="font-mono font-normal text-slate-900">
                          <xsl:value-of select="DatiPagamento/CondizioniPagamento" />
                        </span>
                        <xsl:variable name="CP">
                          <xsl:value-of select="DatiPagamento/CondizioniPagamento" />
                        </xsl:variable>
                        <xsl:choose>
                          <xsl:when test="$CP='TP01'">
                            pagamento a rate
                          </xsl:when>
                          <xsl:when test="$CP='TP02'">
                            pagamento completo
                          </xsl:when>
                          <xsl:when test="$CP='TP03'">
                            anticipo
                          </xsl:when>
                          <xsl:when test="$CP=''">
                          </xsl:when>
                          <xsl:otherwise>
                            <span>(!!! codice non previsto !!!)</span>
                          </xsl:otherwise>
                        </xsl:choose>
                      </xsl:if>
                    </th>
                  </tr>
                </thead>
                <xsl:if test="DatiPagamento/DettaglioPagamento">
                  <tbody>
                    <xsl:for-each select="DatiPagamento/DettaglioPagamento">
                      <tr>
                        <td class="relative border border-slate-600">
                          <span class="text-2xs absolute left-0 top-0 p-0.5">Modalità</span>
                          <xsl:if test="ModalitaPagamento">
                            <span class="block text-center pt-4 ml-7">
                              <xsl:variable name="MP">
                                <xsl:value-of select="ModalitaPagamento" />
                              </xsl:variable>
                              <xsl:choose>
                                <xsl:when test="$MP='MP01'">
                                  contanti
                                </xsl:when>
                                <xsl:when test="$MP='MP02'">
                                  assegno
                                </xsl:when>
                                <xsl:when test="$MP='MP03'">
                                  assegno circolare
                                </xsl:when>
                                <xsl:when test="$MP='MP04'">
                                  contanti presso Tesoreria
                                </xsl:when>
                                <xsl:when test="$MP='MP05'">
                                  bonifico
                                </xsl:when>
                                <xsl:when test="$MP='MP06'">
                                  vaglia cambiario
                                </xsl:when>
                                <xsl:when test="$MP='MP07'">
                                  bollettino bancario
                                </xsl:when>
                                <xsl:when test="$MP='MP08'">
                                  carta di pagamento
                                </xsl:when>
                                <xsl:when test="$MP='MP09'">
                                  RID
                                </xsl:when>
                                <xsl:when test="$MP='MP10'">
                                  RID utenze
                                </xsl:when>
                                <xsl:when test="$MP='MP11'">
                                  RID veloce
                                </xsl:when>
                                <xsl:when test="$MP='MP12'">
                                  RIBA
                                </xsl:when>
                                <xsl:when test="$MP='MP13'">
                                  MAV
                                </xsl:when>
                                <xsl:when test="$MP='MP14'">
                                  quietanza erario
                                </xsl:when>
                                <xsl:when test="$MP='MP15'">
                                  giroconto su conti di contabilità speciale
                                </xsl:when>
                                <xsl:when test="$MP='MP16'">
                                  domiciliazione bancaria
                                </xsl:when>
                                <xsl:when test="$MP='MP17'">
                                  domiciliazione postale
                                </xsl:when>
                                <xsl:when test="$MP='MP18'">
                                  bollettino di c/c postale
                                </xsl:when>
                                <xsl:when test="$MP='MP19'">
                                  SEPA Direct Debit
                                </xsl:when>
                                <xsl:when test="$MP='MP20'">
                                  SEPA Direct Debit CORE
                                </xsl:when>
                                <xsl:when test="$MP='MP21'">
                                  SEPA Direct Debit B2B
                                </xsl:when>
                                <xsl:when test="$MP='MP22'">
                                  Trattenuta su somme già riscosse
                                </xsl:when>
                                <xsl:when test="$MP='MP23'">
                                  PagoPA
                                </xsl:when>
                                <xsl:when test="$MP=''">
                                </xsl:when>
                                <xsl:otherwise>
                                  <span>(!!! codice non previsto !!!)</span>
                                </xsl:otherwise>
                              </xsl:choose>
                            </span>
                            <span class="absolute left-0 bottom-0 font-mono text-xs text-gray-500 p-0.5">
                              <xsl:value-of select="ModalitaPagamento" />
                            </span>
                          </xsl:if>
                        </td>
                        <td class="relative border border-slate-600">
                          <span class="text-2xs absolute left-0 top-0 p-0.5">Data scadenza pagamento</span>
                          <xsl:if test="DataScadenzaPagamento">
                            <span class="block text-center pt-4">
                              <xsl:value-of select="DataScadenzaPagamento" />
                              <span class="text-sm text-gray-700 ml-4">
                                <xsl:call-template name="FormatDate">
                                  <xsl:with-param name="DateTime" select="DataScadenzaPagamento" />
                                </xsl:call-template>
                              </span>
                            </span>
                          </xsl:if>
                        </td>
                        <td class="relative border border-slate-600">
                          <span class="text-2xs absolute left-0 top-0 p-0.5">Importo</span>
                          <xsl:if test="ImportoPagamento">
                            <span class="block font-mono text-right pt-4 text-right">
                              <xsl:value-of select="ImportoPagamento" />
                            </span>
                          </xsl:if>
                        </td>
                        <td class="relative border border-slate-600">
                          <span class="text-2xs absolute left-0 top-0 p-0.5">IBAN</span>
                          <xsl:if test="IBAN">
                            <span class="block text-center font-mono pt-4">
                              <xsl:value-of select="IBAN" />
                            </span>
                          </xsl:if>
                        </td>
                      </tr>
                    </xsl:for-each>
                  </tbody>
                </xsl:if>
              </table>
            </xsl:if>

            <xsl:if test="Allegati">
              <h3 class="text-xl mt-8 mb-4">Informazioni sugli allegati</h3>
              <ul class="list-disc list-inside">
                <xsl:for-each select="Allegati">
                  <li>
                    <span class="border border-slate-300 rounded bg-slate-300 px-2 py-1"><xsl:value-of select="NomeAttachment" /></span>
                    <xsl:if test="FormatoAttachment">
                      <span class="mx-4"><xsl:value-of select="FormatoAttachment" /></span>
                    </xsl:if>
                    <xsl:if test="DescrizioneAttachment">
                      <span class="mx-4">— <xsl:value-of select="DescrizioneAttachment" /></span>
                    </xsl:if>
                  </li>
                </xsl:for-each>
              </ul>
            </xsl:if>
          </xsl:for-each>
        </div>

        <!-- add some space at end of document -->
        <div class="h-8"></div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
