Feature: Delete a project from the clearinghouse

As a project owner
So no one sees and respondsa project that I no longer wish to pursue
I want to be able to delete a project

Background: projects on website and users registered

	Given the test users exist
	Given the test projects exist
	Given I am signed in as the following authenticated user:
		|username |firstname |lastname |email          |password|password_confirmation|
		|testuser1|user1first|user1last|user1@gmail.com|password|password             |

Scenario: Delete a project from projects page
	Given testuser1 has created Project4
	And I am on the details page for Project4
	And I press "Delete"
	Then I should be on the projects page
	Then I should see "Project4 deleted."
	And I should not see "Fake Person 1"

Scenario: Unauthorized user should not be able to delete a project
	Given I am on the details page for Project6
	Then I should not be able to click Delete
