Feature: CRUD functions for admins on admin users

As a website administrator
So I can delegate and remove administrative power to other people
I wish to implement crud functions for admin users

Background:
	Given the following users exist:
		| username | firstname | lastname | email           | password | password_confirmation|
		|testuser1 |user1first |user1last |user1@gmail.com  | password | password             |
		|testuser2 |user2first |user2last |user2@colgate.edu| password | password             |
		|testuser3 |user3first |user3last |user3@yahoo.com  | password | password             |
	Given the following admins exist:
		|	email							|password|
		|testadmin@gmail.com|password|
	Given I am logged in as the following authenticated admin:
		|email 							|password |
		|testadmin@gmail.com|password |

Scenario: creating a new admin user
	Given I am on the admin dashboard
	When I follow "Admin Users"
	Then I should be on the admin adminusers page
	When I follow "New Admin User"
	And I fill in the following:
		|Email|testadmin2@gmail.com|
		|admin_user_password|password|
		|admin_user_password_confirmation|password|
	And I press "Create Admin user"
	Then I should be on the admin adminuser page for testadmin2@gmail.com
	And I should see "Admin user was successfully created."

Scenario: Viewing admin user attributes
	Given I am on the admin adminusers page
	When I follow "View"
	Then I should be on the admin adminuser page for testadmin@gmail.com
	And I should see "testadmin@gmail.com"

Scenario: editing an admin user
	Given I am on the admin adminusers page
	When I follow "Edit"
	Then I should be on the edit admin adminuser page for testadmin@gmail.com
	When I fill in the following:
		|Email|edittestadmin@gmail.com|
		|admin_user_password|password|
		|admin_user_password_confirmation|password|
	And I press "Update Admin user"
	Then I should be on the admin login page
	When I fill in the following:
		|Login|edittestadmin@gmail.com|
		|admin_user_password|password|
	And I press "Login"
	Then I should be on the admin adminuser page for edittestadmin@gmail.com

Scenario: deleting an admin user
	Given I am on the admin adminusers page
	When I follow "View"
	Then I should be on the admin adminuser page for testadmin@gmail.com
	When I follow "Delete Admin User"
	Then I should be on the admin login page
	
