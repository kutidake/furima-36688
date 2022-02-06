class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :area_id, :municipalities, :house_number, :building, :telephone, :user_id, :item_id, :token

  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'を入力して下さい' }
    validates :municipalities
    validates :house_number
    validates :telephone,format: { with: /\A\d{10,11}\z/, message: "を半角数字で入力して下さい" }
    validates :user_id
    validates :token
    validates :item_id
  end
  validates :area_id, numericality: { other_than: 1 , message: "can't be blank"}

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, area_id: area_id, municipalities: municipalities, house_number: house_number, building: building, telephone: telephone, order_id: order.id)
  end
end