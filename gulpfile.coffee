gulp        = require 'gulp'
loadPlugins = require 'gulp-load-plugins'

$           = loadPlugins()

#### sass --------------------------------
PLEEEASE_OPTS =
  autoprefixer:
    browsers: ["last 4 versions", "ie 9", "Android 2.3", "ios 6"]
  minifier: false

gulp.task 'sass', ->
  opts = { bundleExec: true, loadPath: ['./bower_components'] }
  $.rubySass('src/style.scss', opts)
    .on('error', $.util.log)
    .pipe($.pleeease(PLEEEASE_OPTS))
    .pipe($.size(title: 'styles'))
    .pipe(gulp.dest('build'))


#### watch --------------------------------
gulp.task 'watch', ->
  gulp.watch('src/**/*.scss', ['sass'])
