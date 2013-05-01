Feature: Update a project in the clearinghouse

	As a project owner
	So that I can keep my project information up to date
	I want to be able to update the project information and description

Background: projects on website and users registered

	Given the test users exist
	Given the test projects exist
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
	Then I should be on the Edit Page for Project4
	And I should see "testtag"
	When I check "testtag"
	And I press "Update Project Info"
	Then I follow "Back to Project4"
	And I should see "Santa Claus"
	And I should not see "Mrs. Buttersworth"
	And I should not see "testtag"

Scenario: unauthorized user should not be able to update a project
	Given I am on the Projects Page
	And I follow "More about Project5"
	Then I should be on the details page for Project5
	And I should not be able to follow Update
