require 'rails_helper'

describe 'User updates a job' do
  scenario 'user can update a job' do
  category = Category.create!(title: 'Web Development')
  company = Company.create!(name: "ESPN")
  job = Job.create!(title: "Developer", level_of_interest: 90, city: "Denver", company_id: company.id, category_id: category.id)

    visit edit_company_job_path(company, job)

    fill_in 'job[title]', with: 'DBA'
    fill_in 'job[level_of_interest]', with: 45
    fill_in 'job[city]', with: 'Boulder'

    click_on('Update')

    expect(current_path).to eq(company_job_path(company, job))
    expect(page).to_not have_content("Developer")
    expect(page).to_not have_content("70")

    expect(page).to have_content("ESPN")
    expect(page).to have_content("DBA")
    expect(page).to have_content("Boulder")
    expect(page).to have_content("Level of Interest: 45")
  end
end
