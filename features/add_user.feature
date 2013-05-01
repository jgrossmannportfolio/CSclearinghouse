Feature: add a user to the website

As a visitor to the website
So that I can advertise my credentials or post a project
I want to have a profile on the website filled out with my personal information

Background:
	Given the test users exist

Scenario: Go to the registration page
	Given I am on the Home Page
	When I follow "Create an Account"
	Then I should be on the Register New User Page

Scenario: Add a new user to the website
	 Given I am on the Register New User Page
	 When I fill in "user_username" with "testuser4"
	 And I fill in "user_firstname" with "user4first"
	 And I fill in "user_lastname" with "user4last"
	 And I fill in "user_email" with "user4@yahoo.com"
   And I fill in "user_password" with "password"
	 And I fill in "user_password_confirmation" with "password"
	 And I press "Sign up"
	 Then I should be on the Home Page
	 
