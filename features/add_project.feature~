Feature: Add a project to the clearinghouse

As a project owner
So that I can advertise and solicit help on a computer science related project
I want to add a project to the clearinghouse

Background: projects on website and users registered

	Given the test projects exist

	Given the test users exist
		
	Given I am signed in as the following authenticated user:
		|username |firstname |lastname |email          |password|password_confirmation|
		|testuser1|user1first|user1last|user1@gmail.com|password|password             |

Scenario: Add new project from home page
 Given I am on the home page
 When I follow "Add Project"
 Then I should be on the Add Project Page

Scenario: Add new project from projects page
 Given I am on the Projects Page
 When I follow "Add New Project"
 Then I should be on the Add Project Page

Scenario: Add project to projects page
 Given I am on the Add Project Page
 When I fill in "Title" with "Pancakes"
 And I fill in "Description" with "An incredibly exciting project!"
 And I fill in "Owner" with "Mrs. Buttersworth"
 And I fill in "Deadline" with "5-Aug-2013"
 And I fill in "Tag" with "new tag"
 And I press "Save Changes"
 Then I should be on the Projects Page
 And I should see "'Pancakes' was submitted to an administrator for approval."
 When project Pancakes gets approved
 And I am on the projects page
 Then I should see "Pancakes"
 And I should see "An incredibly exciting project!"
 And I should see "Mrs. Buttersworth"
 And I should see "August 5, 2013"
 And I should see "new tag"
