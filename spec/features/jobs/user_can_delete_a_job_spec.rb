require 'rails_helper'

describe 'User deletes a job' do
  scenario 'user can delete a job' do
    category = Category.create!(title: 'Web Development')
    company = Company.create!(name: "ESPN")
    job = Job.create!(title: "Developer", level_of_interest: 90, city: "Denver", company_id: company.id, category_id: category.id)

    visit "/companies/#{company.id}/jobs/#{job.id}"

    click_link('Delete')

    expect(page).to_not have_content(job.title)
    expect(page).to_not have_content(job.level_of_interest)
    expect(page).to_not have_content(job.city)
  end
end
