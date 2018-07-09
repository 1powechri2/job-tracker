describe "User sees list of jobs based on query search" do
  scenario "a user sees every job that meets the search" do
    category_1 = Category.create!(title: 'Web Development')
    category_2 = Category.create!(title: 'Education')
    company_1 = Company.create!(name: "ESPN")
    company_2 = Company.create!(name: "Verizon")
    job_1 = Job.create!(title: "Developer", level_of_interest: 90, city: "Denver", company_id: company_1.id, category_id: category_1.id)
    job_2 = Job.create!(title: "Teacher", level_of_interest: 10, city: "Boulder", company_id: company_2.id, category_id: category_2.id)

    visit '/jobs?sort=location'
#####STILL TRYING TO FIGURE OUT HOW TO TEST ORDER HERE"########################

    expect(page).to have_content("Teacher at Verizon in Boulder")
    expect(page).to have_content("Developer at ESPN in Denver")
  end
end
