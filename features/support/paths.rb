# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    #home controller
    when /^the home page$/i then '/home'

    #projects controller
    when /^the projects?\s?page$/i then projects_path
		when /^the details? page for (.*)$/i then "/projects/#{Project.find_by_title($1).id}"
    when /^the add project page$/i then new_project_path
    when /^the edit page for (.*)$/i then edit_project_path(Project.find_by_title($1).id)
		
    #users controller
    when /^the users?\s?page$/i then users_path
    when /^the register new user page$/i then new_user_registration_path
		when /^the profile page for (.*)$/ then "/users/#{User.find_by_username($1).id}"
		when /^the edit profile page for (.*)$/ then edit_user_path(User.find_by_username($1).id)
		when /^the edit account info page for (.*)$/ then "/users/edit"
		when /^the login page$/i then "/users/sign_in"

		#admin
		when /^the admin login page$/i then "/admin/login"
		when /^the admin dashboard$/i then "/admin"

		#admin adminusers
		when /^the admin adminusers page$/i then "/admin/admin_users"
		when /^the admin adminuser page for (.*)$/ then "/admin/admin_users/#{AdminUser.find_by_email($1).id}"
		when /^the edit admin adminuser page for (.*)$/i then "/admin/admin_users/#{AdminUser.find_by_email($1).id}/edit"

		#admin users
		when /^the admin users page$/i then "/admin/users"
		when /^the admin user page for (.*)$/i then "/admin/users/#{User.find_by_username($1).id}"
		when /^the edit admin user page for (.*)$/i then "/admin/users/#{User.find_by_username($1).id}/edit"
		
		#admin tags
		when /^the admin tags page$/i then "/admin/tags"
		when /^the admin tag page for (.*)$/i then "/admin/tags/#{Tag.find_by_name($1).id}"
		when /^the edit admin tag page for (.*)$/i then "/admin/tags/#{Tag.find_by_name($1).id}/edit"

		#admin projects
		when /^the admin projects page$/i then "/admin/projects"
		when /^the admin project page for (.*)$/i then "/admin/projects/#{Project.find_by_title($1).id}"
		when /^the edit admin project page for (.*)$/i then "/admin/projects/#{Project.find_by_title($1).id}/edit"

		#admin notifications
		when /^the admin notifications page$/i then "/admin/notifications"
		when /^the admin notification page for the notification of (.*)$/i then "/admin/notifications/#{Project.find_by_title($1).admin_notification.id}"


    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
