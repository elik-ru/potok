require "rails_helper"
RSpec.feature "User adds a loan" do
  scenario "they see the page with that loan" do
    visit root_path
    click_on "Добавить займ"

    fill_in "loan_amount", with: "123456"
    fill_in "loan_payments_attributes_0_amount", with: "25000"
    fill_in "loan_payments_attributes_1_amount", with: "25000"
    fill_in "loan_payments_attributes_2_amount", with: "25000"
    fill_in "loan_payments_attributes_3_amount", with: "25000"
    fill_in "loan_payments_attributes_4_amount", with: "25000"
    fill_in "loan_payments_attributes_5_amount", with: "25000"
    click_on "Сохранить займ"
    expect(page).to have_text "123 456,00"
end end