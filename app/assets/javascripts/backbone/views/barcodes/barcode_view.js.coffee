BarcodeApp.Views.Barcodes ||= {}

class BarcodeApp.Views.Barcodes.BarcodeView extends Backbone.View
  template: JST["backbone/templates/barcodes/barcode"]

  events:
    "click .destroy" : "destroy"

  tagName: "tr"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
