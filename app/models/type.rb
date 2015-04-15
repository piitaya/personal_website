class Type < ActiveRecord::Base
  has_many :experiences
  
  translates :name
  accepts_nested_attributes_for :translations
  
  validates :name, :presence => true
end
