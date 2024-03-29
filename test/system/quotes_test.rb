require "application_system_test_case"

class QuotesTest < ApplicationSystemTestCase

	setup do
    login_as users(:accountant) 
		@quote = Quote.ordered.first
	end
  # test "visiting the index" do
  #   visit quotes_url
  #
  #   assert_selector "h1", text: "Quotes"
  # end

   test "Creating a new quote" do
   	# when we visite Quotes#index page
   	# we expect to see title with the text "Quotes"
    visit quotes_path
  
    assert_selector "h1", text: "Quotes"

    # We click on the link with the text "New quote"
    # we expect to land on a page with the title "New quote"
    click_on "New quote"
    fill_in "Name", with: "Capybara quote"

    # when we fill in the name input with "Capybara quote"
    # and we click on "CreAte quote"
    # fill_in "Name", with: "Capybara quote"
    assert_selector "h1", text: "Quotes"
    click_on "Create quote"

    # We expect to be back on the page with the title "Quotes"
    # and to see our "Capybara quote" added to the list
    assert_selector "h1", text: "Quotes"
    assert_text "Capybara quote"
  end

  test "Showing a quote" do
  	visit quotes_path
  	click_link @quote.name

  	assert_selector "h1", text: @quote.name 
  end

  test "Update a quote" do
  	visit quotes_path
  	assert_selector "h1", text: "Quotes"

  	click_on "Edit", match: :first
    fill_in "Name", with: "Updated quote"

  	assert_selector "h1", text: "Quotes"
  	click_on "Update quote"

  	assert_selector "h1", text: "Quotes"
  	assert_text "Updated quote"
  end 

	test "Destroying a quote" do
		visit quotes_path
		assert_text @quote.name 

		click_on "Delete", match: :first
		assert_no_text @quote.name 
	end
end
