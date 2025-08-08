class MovieSession < ApplicationRecord
  belongs_to :movie
  belongs_to :hall

  validates :start_time, :end_time, :language, :price_full, :price_half, presence: true
  validates :language, format: { with: /\A[a-z]{2}\z/, message: "deve conter 2 letras minúsculas (ex: 'pt')" }
  validates :subtitles, format: { with: /\A[a-z]{2}\z/, message: "deve conter 2 letras minúsculas (ex: 'en')" }, allow_blank: true
  validates :price_full, :price_half, numericality: { greater_than_or_equal_to: 0 }

  scope :active, -> { where(is_active: true) }

  validate :end_time_after_start_time

  private

  def end_time_after_start_time
    return if end_time.blank? || start_time.blank?
    errors.add(:end_time, "deve ser após o horário de início") if end_time <= start_time
  end
end
