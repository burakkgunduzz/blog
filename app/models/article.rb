class Article < ApplicationRecord
  include Visible
  after_create_commit { broadcast_prepend_to 'articles' }
  after_update_commit { broadcast_replace_to "articles" }
  after_destroy_commit { broadcast_remove_to "articles" }
  
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end

