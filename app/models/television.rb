class Television < ApplicationRecord
  searchkick

  validates :brand, :name, :display, :price, :size, :year, presence: true
  validates :price, numericality: true
  validates :year, numericality: { only_integer: true }

  def full_description
    "#{brand} #{name} #{size}\" #{display}"
  end
end
