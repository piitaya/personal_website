class Project < ActiveRecord::Base
  belongs_to :experience
  
  translates :title, :subtitle, :description, :short_description
  accepts_nested_attributes_for :translations
  
  validates :title, :presence => true
  validates :subtitle, :presence => true
  validates :order_display, :presence => true
end
