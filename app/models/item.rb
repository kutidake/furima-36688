class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

  validates :image, presence: true
  validates :item_name, presence: true
  validates :explanation, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :category_id,numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :area_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :charge_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :scheduled_delivery_id, numericality: { other_than: 1 , message: "can't be blank"}
  VALID_PRICEL_REGEX =                 /\A[0-9]+\z/
end