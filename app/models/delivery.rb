class Delivery < ApplicationRecord
  belongs_to :member

  def view_address_detail
    "〒#{self.postal_code} #{self.destination} #{self.addressee}"
  end
end
