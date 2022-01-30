class Address < ApplicationRecord
  belongs_to :order
  belongs_to :area_id
end
