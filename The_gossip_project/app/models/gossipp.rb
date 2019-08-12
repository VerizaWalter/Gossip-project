class Gossipp < ApplicationRecord
	belongs_to :user
	has_many :joins
	has_many :comments
	has_many :tags, through: :joins
end
