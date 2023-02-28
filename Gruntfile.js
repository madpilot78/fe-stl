module.exports = function(grunt) {
  grunt.initConfig({
    shell: {
      options: {
        // Task-specific options go here.
      },
      prod: {
        command: 'npx tailwindcss -m -i ./base.css -o ./fe.css'
      },
      dev: {
        command: 'npx tailwindcss -i ./base.css -o ./fe.css'
      },
      clean: {
        command: 'rm -f fe.xsl fe.css'
      }
    },
    replace: {
      prod: {
        options: {
          patterns: [
            {
              match: 'includeCSS',
              replacement: '<style><%= grunt.file.read("fe.css") %></style>'
            }
          ]
        },
        files: [
          {
            src: 'base.xsl',
            dest: './fe.xsl'
          }
        ]
      },
      dev: {
        options: {
          patterns: [
            {
              match: 'includeCSS',
              replacement: '<link href="fe.css" rel="stylesheet" />'
            }
          ]
        },
        files: [
          {
            src: 'base.xsl',
            dest: './fe.xsl'
          }
        ]
      }
    }
  })

  grunt.loadNpmTasks('grunt-contrib-clean')
  grunt.loadNpmTasks('grunt-shell')
  grunt.loadNpmTasks('grunt-replace')

  grunt.registerTask('default', ['shell:prod', 'replace:prod'])
  grunt.registerTask('prod', ['shell:prod', 'replace:prod'])
  grunt.registerTask('dev', ['shell:dev', 'replace:dev'])
  grunt.registerTask('clean', ['shell:clean'])
}
