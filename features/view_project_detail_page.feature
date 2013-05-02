Feature: See specific details of a project

As a student 
So that I can gather more information on prospective projects to work on
I want to be able to view details of a specific project

Background:

	Given the test users exist
	Given the test projects exist
	Given I am signed in as the following authenticated user:
		|username |firstname |lastname |email          |password|password_confirmation|
		|testuser1|user1first|user1last|user1@gmail.com|password|password             |

Scenario: Go to project details page
	Given I am on the projects page
	And I follow "More about Project4"
	Then I should be on the details page for Project4	
	And I should see project details


