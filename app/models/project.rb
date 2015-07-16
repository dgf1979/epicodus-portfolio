class Project < ActiveRecord::Base
  belongs_to :category
  validates :name, :presence => true
  validates :category_id, :presence => true
  validates_format_of :url, :with => URI::regexp(%w(http https))
end
