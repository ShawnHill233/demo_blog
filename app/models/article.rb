class Article < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	validates :title, presence: true,
										length: { minimum: 5 }

	scope :recent, -> { where('created_at > ?', 10.days.ago )}
	scope :search, -> (keyword){ where("title LIKE ? OR text LIKE ?", "%#{keyword}%", "%#{keyword}%") if keyword.present? }


end
