require 'rails_helper'

RSpec.feature "User can search for" do
  it "searches a zipcode and gets bestbuy stores" do
    #As a user
    # When I visit "/"
    visit '/'
    expect(current_path).to eq root_path
    # And I fill in a search box with "80202" and click "search"
    fill_in 'zip_code', with: 80202
    click_on 'Search'
    # Then my current path should be "/search" (ignoring params)
    expect(current_path).to eq search_path
    # And I should see stores within 25 miles of 80202
    # And I should see a message that says "17 Total Stores"
    expect(page).to have_content "17 Total Stores"
    # And I should see exactly 10 results (There are 17 stores within 25 miles. We want to display 10 on this page and 7 on the next. Get the first page to work first from start to finish and worry about pagination later.)
    expect(page).to_not have_css ".store-12-name"
    expect(page).to_not have_css ".store-11-name"

    expect(page).to have_css ".store-0-city"
    expect(page).to have_css ".store-0-distance"
    expect(page).to have_css ".store-0-phone"
    expect(page).to have_css ".store-0-type"

    expect(page).to have_css ".store-1-city"
    expect(page).to have_css ".store-1-distance"
    expect(page).to have_css ".store-1-phone"
    expect(page).to have_css ".store-1-type"

    expect(page).to have_css ".store-2-city"
    expect(page).to have_css ".store-2-distance"
    expect(page).to have_css ".store-2-phone"
    expect(page).to have_css ".store-2-type"

    expect(page).to have_css ".store-3-city"
    expect(page).to have_css ".store-3-distance"
    expect(page).to have_css ".store-3-phone"
    expect(page).to have_css ".store-3-type"

    expect(page).to have_css ".store-4-city"
    expect(page).to have_css ".store-4-distance"
    expect(page).to have_css ".store-4-phone"
    expect(page).to have_css ".store-4-type"

    expect(page).to have_css ".store-5-city"
    expect(page).to have_css ".store-5-distance"
    expect(page).to have_css ".store-5-phone"
    expect(page).to have_css ".store-5-type"

    expect(page).to have_css ".store-6-city"
    expect(page).to have_css ".store-6-distance"
    expect(page).to have_css ".store-6-phone"
    expect(page).to have_css ".store-6-type"

    expect(page).to have_css ".store-7-city"
    expect(page).to have_css ".store-7-distance"
    expect(page).to have_css ".store-7-phone"
    expect(page).to have_css ".store-7-type"

    expect(page).to have_css ".store-8-city"
    expect(page).to have_css ".store-8-distance"
    expect(page).to have_css ".store-8-phone"
    expect(page).to have_css ".store-8-type"

    expect(page).to have_css ".store-9-city"
    expect(page).to have_css ".store-9-distance"
    expect(page).to have_css ".store-9-phone"
    expect(page).to have_css ".store-9-type"

    expect(page).to_not have_css ".store-10-city"
    expect(page).to_not have_css ".store-10-distance"
    expect(page).to_not have_css ".store-10-phone"
    expect(page).to_not have_css ".store-10-type"

    expect(page).to_not have_css ".store-11-city"
    expect(page).to_not have_css ".store-11-distance"
    expect(page).to_not have_css ".store-11-phone"
    expect(page).to_not have_css ".store-11-type"

    expect(page).to have_content "Cherry Creek Shopping Center"
    expect(page).to have_content "Southglenn"

    expect(page).to have_content "3.45"
    expect(page).to have_content "11.02"

    # And I should see the long name, city, distance, phone number and store type for each of the 10 results
  end
end
