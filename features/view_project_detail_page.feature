Feature: See specific details of a project

As a student 
So that I can gather more information on prospective projects to work on
I want to be able to view details of a specific project

Background:

	Given the following projects exist: 
		| title       | description    | owner | deadline    |
    | Project4    | Test Project 4 | John  | May-10-2013 |
    | Project5    | Test Project 5 | Sean  | Jun-03-2014 |

Scenario: Go to project details page
	Given I am on the projects page
	And I follow "More about Project4"
	Then I should be on the details page for Project4	
	And I should see project details
