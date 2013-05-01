Feature: Sign in to the website

As a User
In order to access the website's features
I want to sign in to the website

Background:
	Given the following users exist:
		| username | firstname | lastname | email           | password | password_confirmation|
		|testuser1 |user1first |user1last |user1@gmail.com  | password | password             |
		|testuser2 |user2first |user2last |user2@colgate.edu| password | password             |
		|testuser3 |user3first |user3last |user3@yahoo.com  | password | password             |

Scenario: going to login page
	Given I am on the Home Page
	And I am not signed in
	When I follow "Login"
	Then I should be on the Login page

Scenario:signing in to the website via email address
	Given I am on the Login page
	When I fill in the following:
		|user_login|user1@gmail.com|
		|user_password|password|
	And I press "Sign in"
	Then I should be on the Home page
	And I should be signed in as testuser1

Scenario: signing in to the website via username
	Given I am on the Login page
	When I fill in the following:
		|user_login|testuser1|
		|user_password|password|
	And I press "Sign in"
	Then I should be on the Home page
	And I should be signed in as testuser1
