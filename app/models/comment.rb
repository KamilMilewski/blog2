class Comment < ApplicationRecord
	belongs_to :post

	validates :commenter, presence: true, length: {maximum: 20}
	validates :content, presence: true, length: {maximum: 150}
end
