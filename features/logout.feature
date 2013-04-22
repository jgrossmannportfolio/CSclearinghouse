Feature: logging out of the website

As a User
So that I do not leave my account open when I am not using it
I want to logout of the website

Background: users registered

	Given the following users exist: 
	  | username | firstname | lastname | email           | password | password_confirmation|
		|testuser1 |user1first |user1last |user1@gmail.com  | password | password             |
		|testuser2 |user2first |user2last |user2@colgate.edu| password | password             |
		|testuser3 |user3first |user3last |user3@yahoo.com  | password | password             |
		

	Given I am signed in as the following authenticated user:
		|username |firstname |lastname |email          |password|password_confirmation|
		|testuser1|user1first|user1last|user1@gmail.com|password|password             |

Scenario: log out of the website
	Given I am on the Home Page
	When I follow "Logout"
	Then I should be on the Home Page
	And I am not signed in

	

