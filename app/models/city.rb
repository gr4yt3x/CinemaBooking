class City < ApplicationRecord
  has_many :cinemas

  before_validation :upcase_state

  validates :name, presence: true
  validates :state, presence: true,
    format: { with: /\A[A-Z]{2}\z/, message: "must be two uppercase letters" }

  private
  def upcase_state
    self.state = state&.upcase
  end
end
