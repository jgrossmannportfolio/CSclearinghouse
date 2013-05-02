ActiveAdmin.register User do

	actions :all, :except => :new
	filter :username
	filter :firstname
	filter :lastname
	filter :created_at
	filter :updated_at
	filter :email
	filter :projects
	filter :reset_password_sent_at
	filter :remember_created_at
	filter :current_sign_in_at
	filter :last_sign_in_at
	filter :current_sign_in_ip
	index do
		selectable_column
		column :id
		column "Status" do |user|
			if user.confirmed_at == nil
				link_to("Confirm", admin_notifications_path(user.admin_notification, :path => "/admin/users", :status => true, :user => user), :method => :delete) + "  " + link_to("Deny", admin_notifications_path(user.admin_notification, :path => "/admin/users", :status => false, :user => user), :method => :delete)
			else
				"CONFIRMED"
			end
		end
		column :username
		column :firstname
		column :lastname
		column :created_at
		column :updated_at
		column :email
		column :current_sign_in_at
		column :last_sign_in_at
		default_actions
	end
    show do |ad|
      attributes_table do
				row :id
				row "Status" do |user|
			if user.confirmed_at == nil
				link_to("Confirm", admin_notifications_path(user.admin_notification, :path => "/admin/users/#{user.id}", :status => true, :user => user), :method => :delete) + "  " + link_to("Deny", admin_notifications_path(user.admin_notification, :path => "/admin/users", :status => false, :user => user), :method => :delete)
			else
				"CONFIRMED"
			end
		end
        row :username
        row :firstname
				row :lastname
				row :projects do
					user.projects.map {|p| p.title}.join(', ')
				end
				row :created_at
				row :updated_at
				row :email
				row :encrypted_password
				row :reset_password_token
				row :reset_password_sent_at
				row :remember_created_at
				row :sign_in_count
				row :current_sign_in_at
				row :last_sign_in_at
				row :current_sign_in_ip
				row :last_sign_in_ip
      end
      active_admin_comments
  end
	form do |f|
      f.inputs do
        f.input :username
				f.input :firstname
				f.input :lastname
				f.input :projects, :as => :check_boxes
				f.input :email
				f.input :reset_password_token
      end
		f.actions
	end
end
