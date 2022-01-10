FactoryBot.define do
  factory :item do
    item_name          {"名前"}
    explanation    {"説明"}
    price           {2000}
    condition_id         {2}
    category_id          {2}
    charge_id            {2}
    area_id              {2}
    scheduled_delivery_id{2}
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end