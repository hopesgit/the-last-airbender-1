require 'rails_helper'

describe 'As a user,' do
  describe 'When I visit "/"' do
    it 'I should see details for that group' do
      visit '/'
      expect(page).to have_field(:nation)
      select "Fire Nation", from: :nation
      # And I Select "Fire Nation" from the select field
      # (Note: Use the existing select field)
      click_button "Search For Members"
      # And I click "Search For Members"
      expect(current_path).to eq("/search")
      # Then I should be on page "/search"
      within('div#characters') do
        expect(page).to have_css('div.character', count: 97)
      end
      # Then I should see the total number of people who live in the Fire Nation. (should be close to 100)
      within('div#characters').first(25) do
        # not sure yet
      end
      # And I should see a list with the detailed information for the first 25 members of the Fire Nation.
      within('div#characters') do
        within('div.character'[0]) do
          expect(page).to have_content("Name:")
          expect(page).to have_content("Allies:")
          expect(page).to have_content("Enemies:")
          expect(page).to have_content("Photo:")
          expect(page).to have_content("Affiliation:")
        end
      end
      # And for each of the members I should see:
      # - The name of the member (and their photo, if they have one)
      # - The list of allies or "None"
      # - The list of enemies or "None"
      # - Any affiliations that the member has
    end
  end
end
