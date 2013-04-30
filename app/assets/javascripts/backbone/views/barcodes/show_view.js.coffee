BarcodeApp.Views.Barcodes ||= {}

class BarcodeApp.Views.Barcodes.ShowView extends Backbone.View
  template: JST["backbone/templates/barcodes/show"]

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
