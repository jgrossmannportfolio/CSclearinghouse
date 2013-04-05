Feature: Delete my profile

As a user who wants to leave the website
So that I remove my information
I want to be able to delete my profile

Background: users registered

	Given the following users exist: 

		| username	| firstname	| lastname	| email	|
    | seanbjornsson | Sean | Bjornsson | seanbjornsson@gmail.com |
    | testuser1	| Test1 | User1 | testuser1@gmail.com |
    | testuser2	| Test2 | User2 | testuser2@gmail.com |
    | testuser3	| Test3 | User3 | testuser3@gmail.com |

Scenario: Go to the user profile page from the users page
	Given I am on the users page
	When I follow "More about seanbjornsson"
	Then I should be on the profile page for seanbjornsson
	Then I should see "seanbjornsson's Profile"

Scenario: Delete user from their profile page
	Given I am on the profile page for seanbjornsson
	When I press "Delete"
	Then I should be on the users page
	Then I should see "seanbjornsson deleted."
	And I should not see "seanbjornsson@gmail.com"
