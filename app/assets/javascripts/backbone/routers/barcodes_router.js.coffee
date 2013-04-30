class BarcodeApp.Routers.BarcodesRouter extends Backbone.Router
  initialize: (options) ->
    @barcodes = new BarcodeApp.Collections.BarcodesCollection()
    @barcodes.reset options.barcodes

  routes:
    "new"      : "newBarcode"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"

  newBarcode: ->
    @view = new BarcodeApp.Views.Barcodes.NewView(collection: @barcodes)
    $("#barcodes").html(@view.render().el)

  index: ->
    @view = new BarcodeApp.Views.Barcodes.IndexView(barcodes: @barcodes)
    $("#barcodes").html(@view.render().el)

  show: (id) ->
    barcode = @barcodes.get(id)

    @view = new BarcodeApp.Views.Barcodes.ShowView(model: barcode)
    $("#barcodes").html(@view.render().el)

  edit: (id) ->
    barcode = @barcodes.get(id)

    @view = new BarcodeApp.Views.Barcodes.EditView(model: barcode)
    $("#barcodes").html(@view.render().el)
