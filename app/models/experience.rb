class Experience < ActiveRecord::Base
  belongs_to :type
  has_and_belongs_to_many :skills
  has_many :projects
  
  has_attached_file :image,
    :styles => {:logo=> "x30", :medium=> "200x200#", :big=> "400x400#"}, 
    :url => "/images/:class/:attachment/:id/:style_:basename.:extension",
    :path => ":rails_root/public/images/:class/:attachment/:id/:style_:basename.:extension"
	has_attached_file :logo,
    :styles => {:logo=> "x30"}, 
    :url => "/images/:class/:attachment/:id/:style_:basename.:extension",
    :path => ":rails_root/public/images/:class/:attachment/:id/:style_:basename.:extension"
  
  validates_attachment_content_type :image, 
    :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
    
	validates_attachment_content_type :logo, 
    :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
    
  translates :title, :place, :country, :company, :description, :short_description
  accepts_nested_attributes_for :translations   
  
  def to_label
    "#{title} - #{company}"
  end
  
  validates :title, :presence => true
  validates :place, :presence => true
  validates :country, :presence => true
  validates :company, :presence => true
  validates :begin_date, :presence => true
end
