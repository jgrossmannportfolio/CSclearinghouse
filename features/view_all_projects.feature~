Feature: View all the projects that have been posted

As a visitor to the website
So that I can browse projects that have been posted
I want to be able to see all projects

Background: projects on website

	Given the test users exist
	Given the test projects exist
	Given I am signed in as the following authenticated user:
		|username |firstname |lastname |email          |password|password_confirmation|
		|testuser1|user1first|user1last|user1@gmail.com|password|password             |

Scenario: Go to projects page from home page
	Given I am on the home page
<<<<<<< HEAD
	When I follow "All Projects"
=======
	When I follow "ALL Projects"
>>>>>>> views
	Then I should be on the projects page

Scenario: Display all posted projects
  Given I am on the projects page
  Then I should see all the projects
