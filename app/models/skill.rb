class Skill < ActiveRecord::Base
  belongs_to :category
  has_and_belongs_to_many :experiences
  
  translates :name
  accepts_nested_attributes_for :translations
  
  validates :category, :presence => true
  validates :name, :presence => true
end
