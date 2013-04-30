BarcodeApp.Views.Barcodes ||= {}

class BarcodeApp.Views.Barcodes.IndexView extends Backbone.View
  template: JST["backbone/templates/barcodes/index"]

  initialize: () ->
    @options.barcodes.bind('reset', @addAll)

  addAll: () =>
    @options.barcodes.each(@addOne)

  addOne: (barcode) =>
    view = new BarcodeApp.Views.Barcodes.BarcodeView({model : barcode})
    @$("tbody").append(view.render().el)

  render: =>
    $(@el).html(@template(barcodes: @options.barcodes.toJSON() ))
    @addAll()

    return this
