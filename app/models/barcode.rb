class Barcode < ActiveRecord::Base
  belongs_to :user
  attr_accessible :data, :user, :user_id
  validates :user, presence: true
  validates :data, presence: true
end
