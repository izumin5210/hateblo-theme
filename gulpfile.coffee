gulp        = require 'gulp'
loadPlugins = require 'gulp-load-plugins'

$           = loadPlugins()

#### sass --------------------------------
gulp.task 'sass', ->
  opts = { bundleExec: true, loadPath: ['./bower_component'] }
  $.rubySass('src/style.scss', opts)
    .on('error', $.util.log)
    .pipe($.pleeease(minifier: false))
    .pipe($.size(title: 'styles'))
    .pipe(gulp.dest('build'))


#### watch --------------------------------
gulp.task 'watch', ->
  gulp.watch('src/**/*.scss', ['sass'])
