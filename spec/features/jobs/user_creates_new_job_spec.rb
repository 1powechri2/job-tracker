require 'rails_helper'

describe 'User creates a new job' do
  scenario 'a user can create a new job' do
    category = Category.create!(title: 'Accounting')
    company = Company.create!(name: 'ESPN')
    visit new_company_job_path(company)

    fill_in :job_title, with: 'Accountant'
    fill_in :job_description, with: 'Money stuff'
    fill_in :job_level_of_interest, with: 7
    fill_in :job_city, with: 'Denver'
    select category.title, from: :job_category_id

    click_on 'Create Job'

    expect(page).to have_content('ESPN')
    expect(page).to have_content('Accountant')
    expect(page).to have_content('7')
    expect(page).to have_content('Denver')

  end
end
