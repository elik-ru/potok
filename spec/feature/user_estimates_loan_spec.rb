require "rails_helper"
RSpec.feature "User runs loan calculation" do
  scenario "they see the page with calculation for that amount" do
    visit root_path
    fill_in "amount", with: "123456"
    click_on "Рассчитать"
    expect(page).to have_text "123 456,00"
end end