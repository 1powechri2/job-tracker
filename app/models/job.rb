class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments, dependent: :destroy

  def self.group_by_interest
    group('level_of_interest').order('level_of_interest desc').count
  end

  def self.by_city_count
    group(:city).count
  end

  def self.cities_only
    pluck(:city)
  end
end
