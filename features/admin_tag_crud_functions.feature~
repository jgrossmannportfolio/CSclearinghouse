Feature: CRUD functions for admins on tags

As a website administrator
So I can regulate the tags on the website
I wish to implement crud functions for tags

Background:
	Given the following users exist:
		| username | firstname | lastname | email           | password | password_confirmation|
		|testuser1 |user1first |user1last |user1@gmail.com  | password | password             |
		|testuser2 |user2first |user2last |user2@colgate.edu| password | password             |
		|testuser3 |user3first |user3last |user3@yahoo.com  | password | password             |
	Given the following projects exist: 
		| title       | description    | owner         | deadline    |
    | Project4    | Test Project 4 | Fake Person 1 | 21-Dec-2012 |
    | Project5    | Test Project 5 | Fake Person 2 | 21-Dec-2012 |
	Given the following admins exist:
		|	email							|password|
		|testadmin@gmail.com|password|
	Given I am logged in as the following authenticated admin:
		|email 							|password |
		|testadmin@gmail.com|password |
	Given the following tags exist:
		|name|
		|testtag1|
		|testtag2|

Scenario: creating a new admin tag
	Given I am on the admin dashboard
	When I follow "Tags"
	Then I should be on the admin tags page
	When I follow "New Tag"
	And I fill in the following:
		|Name|admin test tag|
	And I check "Project4"
	And I press "Create Tag"
	Then I should be on the admin tag page for admin test tag
	And I should see "Tag was successfully created."
	And I should see "Project4"

Scenario: Viewing admin tag attributes
	Given I am on the admin tags page
	When I follow View for admin tag testtag1
	Then I should be on the admin tag page for testtag1
	And I should see "testtag1"

Scenario: editing an admin tag
	Given I am on the admin tags page
	When I follow Edit for admin tag testtag1
	Then I should be on the edit admin tag page for testtag1
	When I fill in the following:
		|Name|edittesttag1|
	And I check "Project4"
	And I press "Update Tag"
	Then I should be on the admin tag page for edittesttag1
	And I should see "Tag was successfully updated."
	And I should see "Project4"

Scenario: deleting an admin tag
	Given I am on the admin tags page
	When I follow Delete for admin tag testtag1
	Then I should be on the admin tags page
	And I should see "Tag was successfully destroyed"
	And I should not see "testtag1"
