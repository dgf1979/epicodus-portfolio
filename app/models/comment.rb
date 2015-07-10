class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :blog
  validates :text, :presence => true
  validates :user_id, :presence => true
  validates :blog_id, :presence => true
end
