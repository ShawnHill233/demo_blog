class Article < ActiveRecord::Base
	has_and_belongs_to_many :categories
	
	has_many :comments, dependent: :destroy
	validates :title, presence: true,
										length: { minimum: 5 }

	scope :recent, -> { where('created_at > ?', 10.days.ago )}

	scope :search, -> (keyword){
	 where("title LIKE ? OR text LIKE ?", "%#{keyword}%", "%#{keyword}%") if keyword.present? 
	}

	scope :filter_category, -> (category_name){
	 joins(:categories).where('categories.name = ?', category_name) if category_name.present?
	}

	scope :filter_archive, -> (article_date){
		where("strftime('%Y-%m', created_at) = ?", article_date) if article_date.present?
	}
end
