class Hall < ApplicationRecord
  belongs_to :cinema

  validates :name, presence: true
  validates :total_seats, numericality: { only_integer: true, greater_than: 0 }
end
