require 'rails_helper'

describe 'User creates new comment on job show page' do
  scenario 'a user can create a new comment' do
    category = Category.create!(title: 'Web Development')
    company = Company.create!(name: "ESPN")
    job = Job.create!(title: "Developer", level_of_interest: 90, city: "Denver", company_id: company.id, category_id: category.id)

    visit company_job_path(company, job)

    fill_in 'comment[content]', with: 'Spoke to manager of company'

    click_button('Save')

    expect(page).to have_content('Spoke to manager of company')
    expect(current_path).to eq("/jobs/#{job.id}")
  end
end
