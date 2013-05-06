Feature: Search all the projects that have been posted

As a potential contribuutor
So that I can see projects I might be interested in working on
I want to be able to search for projects by specific attributes

Background: projects on website

	Given the test users exist
	Given the test projects exist
	Given I am signed in as the following authenticated user:
		|username |firstname |lastname |email          |password|password_confirmation|
		|testuser1|user1first|user1last|user1@gmail.com|password|password             |

Scenario: Search projects from home page
	Given I am on the home page
	When I follow "All Projects"
	Then I should be on the projects page
	When I fill in "search_string" with "jgrossmann"
	Then I select "Owner" from "search_type_selected"
	When I press "Submit search"
	Then I should see all projects owned by "jgrossmann"

Scenario: Empty search
	Given I am on the home page
	When I follow "All Projects"
	Then I should be on the projects page
	When I select "Description" from "search_type_selected"
	When I press "Submit search"
	Then I should see all the projects

Scenario: Clearing search
	Given I am on the home page
	When I follow "All Projects"
	Then I should be on the projects page
	When I fill in "search_string" with "jgrossmann"
	Then I select "Owner" from "search_type_selected"
	When I press "Submit search"
	Then I should see all projects owned by "jgrossmann"
	When I follow "Clear search"
	Then I should see all the projects