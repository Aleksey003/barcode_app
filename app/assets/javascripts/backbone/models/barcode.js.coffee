class BarcodeApp.Models.Barcode extends Backbone.Model
  paramRoot: 'barcode'

  defaults:
    user_id: null
    data: null

class BarcodeApp.Collections.BarcodesCollection extends Backbone.Collection
  model: BarcodeApp.Models.Barcode
  url: '/barcodes'

  initialize : () ->
    BarcodeApp.on 'barcodes', @handle_change, @

  handle_change : (message) ->
    switch message.action
      when 'create'
        @add message.obj
      when 'update'
        model = @get message.id
        model.set message.obj
      when 'destroy'
        @remove message.obj
