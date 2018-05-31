@javascript
Feature: Access Home Page
As a product owner
I want my users to be directly shown the CTA when they visit the site

Scenario: User Sees the Generate field
	When I go to the homepage
	Then I should see the 'Shorten.it' logo
	   And I should see the generate field