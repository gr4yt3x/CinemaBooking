class Seat < ApplicationRecord
  belongs_to :hall

  validates :seat_number, :row, :column, presence: true

  enum :seat_type, regular: "regular", premium: "premium"
  enum :status, available: "available", reserved: "reserved", unavailable: "unavailable"
end
