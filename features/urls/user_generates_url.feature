@javascript
Feature: Generate short url
As a product owner
I want my users to easily shorten their urls


Scenario: User generates short url
	Given I go to the homepage
	When I populate "shorten-link" with "https://github.com"
	And I click to generate
	Then I see the shortlink