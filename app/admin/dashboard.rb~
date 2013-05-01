ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }
end

ActiveAdmin::Dashboards.build do
	section "Notifications" do
		table_for AdminNotification.find_all_by_admin_type("user") do |t|
			t.column "New User Message" do |n|
				n.message
			end
			t.column "User" do |n|
				n.user.username
			end
			t.column do |n|
				link_to "Confirm", admin_notifications_path(n, :path => "/admin", :status => "true", :user => n.user), :method => :delete
			end
			column do |n|
				link_to "Deny", notifications_path(n, :path => "/admin", :status => "false", :user => n.user), :method => :delete
			end
		end
		table_for AdminNotification.find_all_by_admin_type("project") do |t|
			t.column "New Project Message" do |n|
				n.message
			end
			t.column "Project" do |n|
				n.project.title
			end
			t.column "User" do |n|
				n.project.user.username
			end
			t.column do |n|
				link_to "Confirm", admin_notifications_path(n, :path => "/admin", :status => "true", :project => n.project), :method => :delete
			end
			column do |n|
				link_to "Deny", notifications_path(n, :path => "/admin", :status => "false", :project => n.project), :method => :delete
			end
		end
	end
end
