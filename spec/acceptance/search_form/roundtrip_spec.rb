require 'spec_helper'

feature 'fill_in form' do
  background do
    visit '/'
  end

  scenario 'Fill in search form roundtrip', js: true do
    puts Date.today.next_month.to_s
    fill_in 'Город вылета', with: 'MOR'
    fill_in 'Город назначения', with: 'LON'
    fill_in 'search_depart_date_310', with: Date.today.next_month.to_s
    fill_in 'search_return_date_312', with: Date.today.next_month.next_week.to_s
    select('2', from: 'search_adults')
    select('1', from: 'search_children')
    select('1', from: 'search_infants')
    select('Эконом', from: 'search_trip_class_314')
    #click_on 'Найти'
    sleep 10
    page.should have_content('Найти отели')
  end
end
