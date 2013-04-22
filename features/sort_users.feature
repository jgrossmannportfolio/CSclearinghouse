Feature: sort users by various attributes

As a site user
So that I can find information about users faster
I want to be able to sort all the users by attributes, such as title, owner name, and deadline.

Background:

	Given the following projects exist: 
	| title       | description    | owner | deadline    |
    | Project4    | This is john's | John  | May-10-2013 |
    | Project5    | sean's project | Sean  | Jun-03-2014 |
    | Sixth proj  | Tom's project  | Tom   | Jun-03-1992 |

	Given the following users exist: 
	  	| username  | firstname  | lastname  | email           | password | password_confirmation|
		|atestuser1 |buser1first |cuser1last |user1@gmail.com  | password | password |
		|btestuser2 |cuser2first |auser2last |user2@colgate.edu| password | password |
		|ctestuser3 |auser3first |buser3last |user3@yahoo.com  | password | password |
		

	Given I am signed in as the following authenticated user:
		|username |firstname |lastname |email          |password|password_confirmation|
		|testuser1|user1first|user1last|user1@gmail.com|password|password   |

Scenario: Sort all users by username
	Given I am on the users page
	And I follow "Username"
	Then I should see "atestuser1" before "ctestuser3"