gulp = require 'gulp'

vulcanize = require 'gulp-vulcanize'


gulp.task 'vulcanize', ()->
  gulp.src('./meme-together-raw.html')
    .pipe vulcanize
      dest: './'
      strip: true
    .pipe gulp.dest './meme-together.html'


gulp.task 'default', ['vulcanize']





