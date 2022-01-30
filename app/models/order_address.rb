class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :area_id, :municipalities, :house_number, :building, :telephone, :order

  with_options presence: true do
    validates :post_code, presence: true
    validates :area_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :municipalities, presence: true
    validates :house_number, presence: true
    validates :telephone, presence: true
    validates :order, presence: true

  end

  def save
    order = Order.create(user_id: user_id,price:price)
    Address.create(post_code: post_code, area_id: area_id, municipalities: municipalities, house_number: house_number, building: building, order_id: order.id)
  end
end