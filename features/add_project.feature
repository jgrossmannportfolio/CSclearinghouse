Feature: Add a project to the clearinghouse

As a project owner
So that I can advertise and solicit help on a computer science related project
I want to add a project to the clearinghouse

Background: projects on website

	Given the following projects exist: 

	| title       | description    | owner         | deadline    |
    | Project4    | Test Project 4 | Fake Person 1 | 21-Dec-2012 |
    | Project5    | Test Project 5 | Fake Person 2 | 21-Dec-2012 |

Scenario: Add project to projects page
  

 Given I am on the Projects Page
 When I follow "Add New Project"
 Then I should be on the Add Project Page
 When I fill in "Title" with "Pancakes"
 And I fill in "Description" with "An incredibly exciting project!"
 And I fill in "Owner" with "Mrs. Buttersworth"
 And I fill in "Deadline" with "5-Aug-2013"
 And I press "Save Changes"
 Then I should be on the Projects Page
 And I should see "Pancakes"