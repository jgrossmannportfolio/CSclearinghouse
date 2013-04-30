ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }
end

ActiveAdmin::Dashboards.build do
	section "Notifications" do
		table_for AdminNotification.all.each do |t|
			t.column :message
			t.column :user || :project
			t.column do |n|
				link_to "Confirm", notifications_path(n, :path => "/admin", :status => "true"), :method => :delete
			end
			column do |n|
				link_to "Deny", notifications_path(n, :path => "/admin", :status => "false"), :method => :delete
			end
		end
	end
end
