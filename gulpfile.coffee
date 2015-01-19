gulp = require 'gulp'
coffee = require 'gulp-coffee'
concat = require 'gulp-concat'
uglify = require 'gulp-uglify'
sourcemaps = require 'gulp-sourcemaps'
plumber = require 'gulp-plumber'
browserify = require 'gulp-browserify'
rename = require 'gulp-rename'

paths =
  peerjs: ['./lib/peerjs-connector/**/*.coffee']



buildConnector = (connector_name)->
  ()->
    gulp.src(paths[connector_name], {read: false})
      .pipe(plumber())
      .pipe browserify
        transform: ['coffeeify']
        extensions: ['.coffee']
        debug: true
        ignore: ['faye-websocket', './srv', 'dns', 'tls']
      .pipe rename
        extname: ".js"
      .pipe gulp.dest('./'+connector_name+'-connector')
      .pipe uglify()
      .pipe rename
        extname: ".min.js"
      .pipe gulp.dest('./'+connector_name+'-connector')


gulp.task 'xmpp', [], buildConnector 'xmpp'


# Rerun the task when a file changes
gulp.task 'watch', ()->
  gulp.watch(paths.peerjs, ['peerjs'])
  gulp.watch(paths.test, ['test'])
  gulp.watch(paths.strophe, ['strophe'])
  gulp.watch(paths.xmpp, ['xmpp'])

gulp.task('default', ['watch', 'build'])









