class Artcle < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition, :area, :charge, :scheduleddelivery
end