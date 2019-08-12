class Tag < ApplicationRecord
	has_many :joins
	has_many :gossipps, through: :joins
end
