require 'rails_helper'

feature 'Reviewing' do
	before {Restaurant.create name: 'Roka'}

	scenario 'Allows users to leave a review using a form' do
		visit '/restaurants'
		click_link 'Review Roka'
		fill_in "Thoughts", with: "Average"
		select '3', from: 'Rating'
		click_button 'Leave Review'

		expect(current_path).to eq '/restaurants'
		expect(page).to have_content('Average')
	end

	scenario 'Are deleted if the restaurant is deleted' do
		visit '/restaurants'
		click_link 'Review Roka'
		fill_in "Thoughts", with: "Average"
		select '3', from: 'Rating'
		click_button 'Leave Review'

		click_link 'Delete Roka'
		expect(page).not_to have_content('Average')
	end

end