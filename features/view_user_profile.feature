Feature: See the profile of a specific user

As a project owner
So that I can check the credentials of a user
I want to be able to view the profile of a user

Background: users registered

	Given the test users exist
	Given I am signed in as the following authenticated user:
		|username |firstname |lastname |email          |password|password_confirmation|
		|testuser1|user1first|user1last|user1@gmail.com|password|password             |

Scenario: View a user's profile
	Given I am on the users page
	When I follow "More about testuser2"
	Then I should be on the profile page for testuser2
	And I should see user details

