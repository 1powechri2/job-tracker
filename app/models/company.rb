class Company < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :jobs, dependent: :destroy
  has_many :contacts, dependent: :destroy

  def self.top_three
    select("companies.name, avg(jobs.level_of_interest) AS avg_of_interest")
    .joins(:jobs)
    .group(:name)
    .order("avg_of_interest DESC")
    .take(3)
  end
end
