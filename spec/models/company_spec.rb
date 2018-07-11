require 'rails_helper'

describe Company do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a name" do
        company = Company.new()
        expect(company).to be_invalid
      end

      it "has a unique name" do
        Company.create(name: "Dropbox")
        company = Company.new(name: "Dropbox")
        expect(company).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a name" do
        company = Company.new(name: "Dropbox")
        expect(company).to be_valid
      end
    end
  end

  describe "relationships" do
    it "has many jobs" do
      company = Company.new(name: "Dropbox")
      expect(company).to respond_to(:jobs)
    end
  end
  # describe 'class methods' do
  #   # context 'it can find top three companies by jobs average level of interest' do
  #   #   it '.top three' do
  #   #     category_1 = Category.create!(title: 'Web Development')
  #   #     category_2 = Category.create!(title: 'Education')
  #   #     category_3 = Category.create!(title: 'Sales')
  #   #     category_4 = Category.create!(title: 'Accounting')
  #   #     company_1 = Company.create(name: "ESPN")
  #   #     company_2 = Company.create(name: "Turing")
  #   #     company_3 = Company.create(name: "Macy's")
  #   #     company_4 = Company.create(name: "Adidas")
  #   #     company_1.jobs.create(title: "Developer", level_of_interest: 10, city: "Denver", category_id: category_1.id)
  #   #     company_2.jobs.create(title: "Teacher", level_of_interest: 5, city: "Boulder", category_id: category_2.id)
  #   #     company_3.jobs.create(title: "Sales Rep", level_of_interest: 2, city: "New York", category_id: category_1.id)
  #   #     company_4.jobs.create(title: "Accountant", level_of_interest: 3, city: "Seattle", category_id: category_4.id)
  #   #     company_1.jobs.create(title: "Developer", level_of_interest: 12, city: "Denver", category_id: category_1.id)
  #   #     company_2.jobs.create(title: "Teacher", level_of_interest: 7, city: "Boulder", category_id: category_2.id)
  #   #     company_3.jobs.create(title: "Sales Rep", level_of_interest: 2, city: "New York", category_id: category_1.id)
  #   #     company_4.jobs.create(title: "Accountant", level_of_interest: 4, city: "Seattle", category_id: category_4.id)
  #   #
  #   #     expect(Company.top_three).to eq([company_1, company_2, company_4])
  #   #   end
  #   # end
  # end
end
