Company.destroy_all
Job.destroy_all

COMPANIES = ["ESPN", "Aetna", "United Airlines", "Denver Public Schools", "Shopify", "Starbucks", "Pivotal Labs", "Captain U"]
JOBS = ["Engineering", "Development", "Dev Ops", "Quality Assurance", "Teacher", "Product Manager", "Consultant", "Community Manager"]
CITIES = ["Seattle", "Denver", "Portland", "Indianapolis", "Madison", "Orlando", "San Diego", "Austin", "Las Vegas", "Little Rock", "Boise", "Eugene", "Oakland"]
cat_1 = Category.new(title: "Education")
cat_2 = Category.new(title: "Tech")
cat_3 = Category.new(title: "Accounting")
cat_4 = Category.new(title: "Plumbing")
cat_5 = Category.new(title: "Service")
cat_6 = Category.new(title: "HR")
cat_7 = Category.new(title: "Marketing")
cat_8 = Category.new(title: "Purchasing")
CATEGORIES = [cat_1, cat_2, cat_3, cat_4, cat_5, cat_6, cat_7, cat_8]

COMPANIES.each do |name|
  company = Company.create!(name: name)
  puts "Created #{company.name}"
  10.times do |num|
    company.jobs.create!(title: JOBS.sample, description: "What a great position!", level_of_interest: rand(1..5), city: CITIES.sample, category: CATEGORIES.sample)
    puts "  Created #{company.jobs[num].title}"
  end
end
