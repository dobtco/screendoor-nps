module.exports = (grunt) ->
  grunt.loadNpmTasks 'grunt-gh-pages'
  grunt.loadNpmTasks 'grunt-shell'

  grunt.initConfig
    pkg: '<json:package.json>'

    shell:
      build_production:
        command: 'bundle exec jekyll build --config _config.yml,_config-production.yml'

    'gh-pages':
      options:
        base: '_site'
        message: 'Deploy (via Grunt)'
      production:
        src: ['**']
        options:
          repo: 'https://github.com/dobtco/screendoor-nps.git'

  grunt.registerTask 'deploy:production', ['shell:build_production', 'gh-pages:production']
