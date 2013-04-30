class Barcode < ActiveRecord::Base
  belongs_to :user
  attr_accessible :data, :user, :user_id
  validates :user, presence: true
  validates :data, presence: true

  after_create {|barcode| barcode.message 'create' }
  after_update {|barcode| barcode.message 'update' }
  after_destroy {|barcode| barcode.message 'destroy' }

  def message action
    msg = { resource: 'barcodes',
            action: action,
            id: self.id,
            obj: self }

    $redis.publish 'rt-change', msg.to_json
  end
end
