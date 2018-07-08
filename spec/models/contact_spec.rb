require 'rails_helper'

describe Contact do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a name" do
        contact = Contact.new()
        expect(contact).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a name" do
        company = Company.new(name: "White House")
        contact = Contact.new(name: "Michelle Obama", title: 'First Lady', email: 'michelle@google.com', company_id: company.id)
        expect(company).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a company" do
      company = Company.new(name: "White House")
      expect(company).to respond_to(:contact)
    end
  end
end
