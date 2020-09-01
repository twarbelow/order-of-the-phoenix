require 'rails_helper'

RSpec.describe 'as a user, I can look select a house' do
  it 'and it shows the details for the order of the phoenix members who belong to that house' do
    visit '/'
    within('.select-field') do
      select 'Gryffindor'
    end
    click_button "Search For Members"
    expect(current_path).to eq('/search')
    expect(page).to have_content("Order of the Phoenix Members in Gryffindor: 21")
    expect(page).to have_content("Details of Gryffindor Members:")
    within('.details') do
      expect(page).to have_css(".member", count: 21)
      within('.member') do
        expect(page).to have_css('.name')
        expect(page).to have_css('.role')
        expect(page).to have_css('.house')
        expect(page).to have_css('.patronus')
    end
  end
end

# As a user,
# When I visit "/"
# And I Select "Gryffindor" from the select field
# (Note: Use the existing select field)
# And I click "Search For Members"
# Then I should be on page "/search"
# Then I should see the total number of the order of the phoenix members that belong to Gryffindor. (i.e. 21)
# And I should see a list with the detailed information for the 21 members of the Order of the Phoenix for house Gryffindor.
# And for each of the members I should see:
# - The name of the member
# - The members role (if it exists)
# - The house the member belongs to
# - The Patronus of the member (if it exists)
