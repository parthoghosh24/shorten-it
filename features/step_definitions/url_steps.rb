When(/^I go to the homepage$/) do
	visit root_path
end

Then(/^I should see the 'Shorten.it' logo$/) do
	expect(page).to have_content("Shorten.it")
end

Then(/^I should see the generate field$/) do
	expect(page).to have_selector("input", :id=>"shorten-link")
end

Then(/^I populate "(.*)" with "(.*)"$/) do |id,link|
	expect(page).to have_content("Shorten.it")
	find("##{id}").set(link)
end

When(/^I wait (\+d) seconds$/) do |count|
	sleep(count)
end

Then(/^I click to generate$/) do
	page.execute_script("$('#shorten-generate').removeAttr('disabled')")
	click_button 'Generate'
end

Then(/^I see the shortlink$/) do
	expect(page).to have_selector("a", :id=>"shorten-url")
end