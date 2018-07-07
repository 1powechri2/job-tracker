require 'rails_helper'

describe 'User deletes a job' do
  scenario 'user can delete a job' do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")

    visit "/companies/#{company.id}/jobs/#{job.id}"

    click_link('Delete')

    expect(page).to_not have_content(job.title)
    expect(page).to_not have_content(job.level_of_interest)
    expect(page).to_not have_content(job.city)
  end
end
