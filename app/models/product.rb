class Product < ApplicationRecord
  has_many :categoryProducts
  has_many :categories, through: :categoryProducts
  accepts_nested_attributes_for :categories
end
