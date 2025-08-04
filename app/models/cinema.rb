class Cinema < ApplicationRecord
  belongs_to :city

  validates :name, :address, :cnpj, :phone, :email, presence: true
  validates :cnpj, uniqueness: true
  validates :email,
    format: { with: URI::MailTo::EMAIL_REGEXP },
    presence: true
  # Note: Email is not validated for uniqueness here because
  # multiple cinemas (even in different cities) may share the same contact email.
end
