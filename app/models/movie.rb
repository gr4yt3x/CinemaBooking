class Movie < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }
  validates :language, length: { maximum: 10 }, allow_blank: true
  validates :age_rating, length: { maximum: 20 }, allow_blank: true
  validates :genre, :director, :trailer, :image, :banner,
            length: { maximum: 255 }, allow_blank: true

  scope :active, -> { where(is_active: true) }

  def full_title
    "#{title} (#{release_date.year})" if release_date.present?
  end
end
