Feature: edit my account info

As a User
So that I can manage my website account
I want to edit my account info

Background: users registered

	Given the test users exist
	Given I am signed in as the following authenticated user:
		|username |firstname |lastname |email          |password|password_confirmation|
		|testuser1|user1first|user1last|user1@gmail.com|password|password             |

Scenario: Go to the edit account info page
	When I follow "Edit account info"
	Then I should be on the edit account info page for testuser1

Scenario: Edit account info
	Given I am on the edit account info page for testuser1
	When I fill in the following:
		|user_email|editemail@gmail.com|
		|user_username|edituser|
		|user_password|editpassword|
		|user_password_confirmation|editpassword|
		|user_current_password|password|
	And I press "Update"
	Then I should be on the Home Page
	And I should see "Signed in as edituser"


