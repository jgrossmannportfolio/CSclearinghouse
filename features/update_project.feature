Feature: Update a project in the clearinghouse

	As a project owner
	So that I can keep my project information up to date
	I want to be able to update the project information and description

Background: projects on website and users registered

	Given the following projects exist: 
		| title       | description    | owner         | deadline    |
    | Project4    | Test Project 4 | Fake Person 1 | 21-Dec-2012 |
    | Project5    | Test Project 5 | Fake Person 2 | 21-Dec-2012 |

	Given the following users exist: 
	  | username | firstname | lastname | email           | password | password_confirmation|
		|testuser1 |user1first |user1last |user1@gmail.com  | password | password             |
		|testuser2 |user2first |user2last |user2@colgate.edu| password | password             |
		|testuser3 |user3first |user3last |user3@yahoo.com  | password | password             |
		

	Given I am signed in as the following authenticated user:
		|username |firstname |lastname |email          |password|password_confirmation|
		|testuser1|user1first|user1last|user1@gmail.com|password|password             |

Scenario: Update a project from projects page
	Given testuser1 has created Project4
	And I am on the Projects Page
	When I follow "More about Project4"
	And I should see "Project4"	
	Then I should be on the Details Page for Project4
	When I follow "Update"
	Then I should be on the Edit Page for Project4
	And I fill in "Owner" with "Santa Claus"
	And I fill in "New Tag" with "testtag"
	When I press "Update Project Info"
	Then I should be on the Details Page for Project4
	And I should see "testtag"
	When I follow "Update"
	Then I should be on the Edit Page for Project4
	When I check "testtag"
	And I press "Update Project Info"
	Then I should see "Santa Claus"
	And I should not see "Mrs. Buttersworth"
	And I should not see "testtag"

Scenario: unauthorized user should not be able to update a project
	Given I am on the Projects Page
	And I follow "More about Project5"
	Then I should be on the details page for Project5
	And I should not be able to follow Update
