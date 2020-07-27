class Delivery < ApplicationRecord
  belongs_to :member

  validates :postal_code, presence: true
  validates :destination, presence: true
  validates :addressee, presence: true

	def ffff
		postal_code + destination + addressee
	end

end
