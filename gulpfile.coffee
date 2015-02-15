gulp = require 'gulp'
rename = require 'gulp-rename'

vulcanize = require 'gulp-vulcanize'

gulp.task 'vulcanize', ()->
  gulp.src('./meme-together-raw.html')
    .pipe vulcanize
      dest: './'
      strip: true
    .pipe rename
      basename : "meme-together"
    .pipe gulp.dest './'


gulp.task 'default', ['vulcanize']





