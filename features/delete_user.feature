Feature: Delete my profile

As a user who wants to leave the website
So that I remove my information
I want to be able to delete my profile

Background: users registered

	Given the test users exist
		
	Given I am signed in as the following authenticated user:
		|username |firstname |lastname |email          |password|password_confirmation|
		|testuser1|user1first|user1last|user1@gmail.com|password|password             |

Scenario: Go to the edit account info page
	Given I am on the Home page
	When I follow "Edit Account Info"
	Then I should be on the edit account info page for testuser1

Scenario: Delete user from their edit account info page
	Given I am on the edit account info page for testuser1
	And I press "Cancel my account"
	#Then I should see "testuser1 deleted."
	And I should not see "Signed in as testuser1"
