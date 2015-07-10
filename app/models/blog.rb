class Blog < ActiveRecord::Base
  validates :text, :presence => true
  has_many :comments
end
