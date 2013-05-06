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

Scenario: Search users from home page
	Given I am on the home page
	When I follow "All Users"
	Then I should be on the users page
	When I fill in "search_string" with "tcharron480"
	Then I select "Username" from "search_type_selected"
	When I press "Search users"
	Then I should see all users with username "tcharron480"

Scenario: Empty search
	Given I am on the home page
	When I follow "All Users"
	Then I should be on the users page
	When I select "Email" from "search_type_selected"
	When I press "Search users"
	Then I should see all the users

Scenario: Clear sarch
	Given I am on the home page
	When I follow "All Users"
	Then I should be on the users page
	When I fill in "search_string" with "tcharron480"
	Then I select "Username" from "search_type_selected"
	When I press "Search users"
	Then I should see all users with username "tcharron480"
	When I follow "Clear search"
	Then I should see all the users
