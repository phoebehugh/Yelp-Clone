require 'rails_helper'

feature 'Restaurants'  do
	context 'No restaurants have been added' do
		scenario 'should display a prompt to add a restaurant' do
			visit '/restaurants'
			expect(page).to have_content 'No restaurants yet'
			expect(page).to have_link 'Add a restaurant'
		end
	end

	context 'Creating restaurants' do
		scenario 'prompts user to fill out a form, then displays the new restaurant' do
			visit '/restaurants'
			click_link 'Add a restaurant'
			fill_in 'Name', with: 'Roka'
			click_button 'Create restaurant'
			expect(page).to have_content 'Roka'
			expect(current_path).to eq '/restaurants'
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

	context 'Viewing restaurants' do
		let!(:roka){Restaurant.create(name:'Roka')}

		scenario 'lets a user view a restaurant' do
			visit '/restaurants'
			click_link 'Roka'
			expect(page).to have_content 'Roka'
			expect(current_path).to eq "/restaurants/#{roka.id}"
		end
	end
end
