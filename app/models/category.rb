class Category < ActiveRecord::Base
  has_many :skills
  
  translates :name
  accepts_nested_attributes_for :translations
  
  validates :name, :presence => true
  validates :order_display, :presence => true
end
