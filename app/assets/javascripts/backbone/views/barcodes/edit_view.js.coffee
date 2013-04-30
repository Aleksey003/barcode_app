BarcodeApp.Views.Barcodes ||= {}

class BarcodeApp.Views.Barcodes.EditView extends Backbone.View
  template : JST["backbone/templates/barcodes/edit"]

  events :
    "submit #edit-barcode" : "update"

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success : (barcode) =>
        @model = barcode
        window.location.hash = "/#{@model.id}"
    )

  render : ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
