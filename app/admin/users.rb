ActiveAdmin.register User do

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
		column :username
		column :firstname
		column :lastname
		column :created_at
		column :updated_at
		column :email
		column :reset_password_token
		column :reset_password_sent_at
		column :remember_created_at
		column :current_sign_in_at
		column :last_sign_in_at
		default_actions
	end
    show do |ad|
      attributes_table do
				row :id
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
				f.input :encrypted_password
				f.input :reset_password_token
				f.input :reset_password_sent_at, :as => :datetime_select
				f.input :remember_created_at, :as => :datetime_select
				f.input :current_sign_in_at, :as => :datetime_select
				f.input :last_sign_in_at, :as => :datetime_select
				f.input :current_sign_in_ip
				f.input :last_sign_in_ip
      end
		f.actions
	end
end
