class Comment < ActiveRecord::Base
  belongs_to :article
  validates :commenter, presence: true, length: { maximum: 50 }
  validates :body, presence: true
end
