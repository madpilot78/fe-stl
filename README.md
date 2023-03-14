# Fatture elettroniche stylesheet

This project aims to provide an XML Stylesheet with an open license  to
transform an Italian electronic invoice into a decent HTML file.

I'm using the xsl file provided by Agenzia delle entrate as a starting point.

I'm publishing this in case someone find it useful.

## Description/origin

I created this file for my own needs, giving priority to the features I use.

Due to this the present version of the file does not have support for all
the sections that cen be present in fattura elettronica.

For example I'm ignoring the DDT, Vehicles, contracts etc. sections and the
payments section actually only supports the fields for basic bank money order
(bonifico) payments.

## Technical Details

This project is using [Tailwindcss](https://tailwindcss.com) to generate the CSS file. The generated CSS is embedded in the template using [Grunt](https://gruntjs.com).

To generate the final stl file run:

```sh
npm install
npm run build
```

### Customizing Logo

The generated HTML includes a logo.png image from the same directory it is in.

The image should be 96x96 pixel, other sizes will be scaled.

The file included in this repository is a simple placeholder I generated using GIMP.
