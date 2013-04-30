#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

window.BarcodeApp =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}

_.extend BarcodeApp, Backbone.Events

BarcodeApp.realtime = connect : () ->
    BarcodeApp.socket = io.connect('http://0.0.0.0:5001');

    BarcodeApp.socket.on 'rt-change', (message) ->
      	BarcodeApp.trigger 'barcodes', message


