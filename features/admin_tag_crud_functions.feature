Feature: CRUD functions for admins on tags

As a website administrator
So I can regulate the tags on the website
I wish to implement crud functions for tags

Background:
	Given the test users exist
	Given the test projects exist
	Given the test admins exist
	Given the test tags exist
	Given I am logged in as the following authenticated admin:
		|email 							|password |
		|testadmin@gmail.com|password |

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
