Feature: Delete a project from the clearinghouse

As a project owner
So no one sees and respondsa project that I no longer wish to pursue
I want to be able to delete a project

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

Scenario: Delete a project from projects page
	Given I am on the details page for Project4
	And I press "Delete"
	Then I should be on the projects page
	Then I should see "Project4 deleted."
	And I should not see "Fake Person 1"
