class Post < ApplicationRecord
	has_many :comments, dependent: :destroy

	validates :title, presence: true, length: {maximum: 50}
	validates :content, presence: true, length: {maximum: 150}
end
