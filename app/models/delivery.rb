class Delivery < ApplicationRecord
  belongs_to :member

	def ffff
		postal_code + destination + addressee
	end
end
