class Book < ActiveRecord::Base

	has_attached_file :image, 
		default_url: ":style/missing_image.png",
		url: "/assets/images/:basename.:extension"

	validates_attachment  :image,
        content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] },
        size: { :less_than => 1.megabyte }

	validates :name, presence: true, length: { maximum: 50 }
	validates :genre, presence: true
	validates :page_count, presence: true, numericality: { only_integer: true }

	scope :search, ->(search) do
		where("books.name LIKE :search or books.page_count LIKE :search or books.genre LIKE :search", search: "%#{search}%") unless search.blank?
	end

	scope :desc, -> do
		order(created_at: :desc)
	end

end