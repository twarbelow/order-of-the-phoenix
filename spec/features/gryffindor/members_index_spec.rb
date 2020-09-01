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
end
