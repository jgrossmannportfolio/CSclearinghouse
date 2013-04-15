Feature: Update a project in the clearinghouse

	As a project owner
	So that I can keep my project information up to date
	I want to be able to update the project information and description

Background: projects on website

	Given the following projects exist: 

	| title       | description    | owner         | deadline    |
    | Project4    | Test Project 4 | Fake Person 1 | 21-Dec-2012 |
    | Project5    | Test Project 5 | Fake Person 2 | 21-Dec-2012 |

Scenario: Update a project from home page
	Given I am on the Projects Page
	When I follow "More about Project4"
	And I should see "Project4"	
	Then I should be on the Details Page for Project4
	When I follow "Update"
	Then I should be on the Edit Page for Project4
	And I fill in "Owner" with "Santa Claus"
	When I press "Update Project Info"
	Then I should be on the Detail Page for Project4
	And I should see "Santa Claus"
	And I should not see "Mrs. Buttersworth"