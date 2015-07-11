class Comment < ActiveRecord::Base
  default_scope{ order('created_at DESC') }
  belongs_to :user
  belongs_to :blog
  validates :text, :presence => true
  validates :user_id, :presence => true
  validates :blog_id, :presence => true
end
