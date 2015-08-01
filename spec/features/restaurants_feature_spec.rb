require 'rails_helper'

feature 'restaurants'  do
	context 'No restaurants have been added' do
		scenario 'should display a prompt to add a restaurant' do
			visit '/restaurants'
			expect(page).to have_content 'No restaurants yet'
			expect(page).to have_link 'Add a restaurant'
		end
	end

	context 'Restaurants have been added' do
		before do
			Restaurant.create(name: 'Roka')
		end

		scenario 'Display restaurants' do
			visit '/restaurants'
			expect(page).to have_content('Roka')
			expect(page).not_to have_content('No restaurants yet')
		end
	end
end
