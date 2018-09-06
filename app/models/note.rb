class Note < ApplicationRecord	
	belongs_to :user, :dependent => :destroy
	before_save :downcase_tags

	validates :description, presence: true

  def self.search(query)
  	query = query.downcase!
  	where("tags like ?", "%#{query}%")
	end

	def downcase_tags
		self.tags.downcase!
	end

end
