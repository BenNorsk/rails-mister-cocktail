class Ingredient < ApplicationRecord
  has_many :doses
  before_destroy :check_dose_presence

  validates :name, presence: true, uniqueness: true

  def check_dose_presence
      raise ActiveRecord::InvalidForeignKey if doses.any?
  end
end
