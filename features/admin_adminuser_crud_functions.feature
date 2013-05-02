Feature: CRUD functions for admins on admin users

As a website administrator
So I can delegate and remove administrative power to other people
I wish to implement crud functions for admin users

Background:
	Given the test users exist
	Given the test admins exist
	Given I am logged in as the following authenticated admin:
		|email 							|password |
		|testadmin@gmail.com|password |

Scenario: creating a new admin user
	Given I am on the admin dashboard
	When I follow "Admin Users"
	Then I should be on the admin adminusers page
	When I follow "New Admin User"
	And I fill in the following:
		|Email|testadmin3@gmail.com|
		|admin_user_password|password|
		|admin_user_password_confirmation|password|
	And I press "Create Admin user"
	Then I should be on the admin adminuser page for testadmin3@gmail.com
	And I should see "Admin user was successfully created."

Scenario: Viewing admin user attributes
	Given I am on the admin adminusers page
	When I follow View for admin adminuser testadmin@gmail.com
	Then I should be on the admin adminuser page for testadmin@gmail.com
	And I should see "testadmin@gmail.com"

Scenario: editing an admin user
	Given I am on the admin adminusers page
	When I follow Edit for admin adminuser testadmin2@gmail.com
	Then I should be on the edit admin adminuser page for testadmin2@gmail.com
	When I fill in the following:
		|Email|edittestadmin@gmail.com|
		|admin_user_password|password|
		|admin_user_password_confirmation|password|
	And I press "Update Admin user"
	Then I should be on the admin adminuser page for edittestadmin@gmail.com
	And I should see "edittestadmin@gmail.com"

Scenario: deleting an admin user
	Given I am on the admin adminusers page
	When I follow Delete for admin adminuser testadmin2@gmail.com
	Then I should be on the admin adminusers page
	And I should see "Admin user was successfully destroyed"
	And I should not see "testadmin2@gmail.com"
	
