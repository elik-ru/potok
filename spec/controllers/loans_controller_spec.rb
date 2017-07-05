require "rails_helper"

RSpec.describe LoansController, "#create" do 
  context "when the loan is invalid" do
    it "re-renders the form" do
      post :create, params: {loan: attributes_for(:loan, :invalid)}
      expect(response).to render_template :new 
    end
  end 
end