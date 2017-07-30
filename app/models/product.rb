class Product < ApplicationRecord
  has_many :categoryProducts
  has_many :categorys, through: :categoryProducts
end
