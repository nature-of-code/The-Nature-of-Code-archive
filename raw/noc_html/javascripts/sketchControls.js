$(function(){
  // Reload the sketch from sources. Also set paused to false
  $('.reset').click(function() {
    var controls = $(this).closest('.sketch-controls');
    var pjsID = $(controls).prev().attr('id');
    removeSketch(pjsID, loadSketch)
    $(controls).find('.pause').data()['paused'] = 'false';
  });
  $('.pause').click(function() {
    var controls = $(this).closest('.sketch-controls');
    var pjsID = $(controls).prev().attr('id');
    var pjs = Processing.getInstanceById(pjsID);
    if($(this).data()['paused'] === 'true') {
      pjs.loop();
      $(this).data()['paused'] = 'false';
    } else {
      pjs.noLoop();
      $(this).data()['paused'] = 'true';
    }
  });

});

var removeSketch = function (pjsID, callback) {
  var canvas = $("#"+pjsID);
  Processing.removeInstance(pjsID);
  callback({canvas:canvas[0]})
}

/**
 * Load the sketch associated with a canvas, from source indicated by that canvas.
 * @param {sketch} sketch An administrative sketch object
 */
var loadSketch = LazyLoading.loadSketch = function(sketch) {
  if (sketch.canvas) {
    // form an array of which files must be loaded for this sketch
    var processingSources = sketch.canvas.getAttribute('data-processing-sources');
    if(processingSources===null) { processingSources = sketch.canvas.getAttribute('data-src'); }
    if(processingSources===null) { processingSources = sketch.canvas.getAttribute('datasrc'); }
    var filenames = processingSources.split(' ');
    for (var j = 0; j < filenames.length;) {
      if (filenames[j]) { j++; }
      else { filenames.splice(j, 1); }}
    // make Processing.js load this sketch into its canvas
    Processing.loadSketchFromSources(sketch.canvas, filenames);
  }
};
