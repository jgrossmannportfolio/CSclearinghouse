ActiveAdmin.register Notification do

	index do 
		selectable_column                           
    column :subject
		column :user
		column :from
		column :message
		column :created_at
		column :updated_at                                 
    default_actions                   
  end
	controller do
		def create
			@notification = Notification.new(params[:notification])
			@notification.from = 'Admin'
			super
		end
	end

	show do |ad|
      attributes_table do
        row :id
        row :subject
				row :message
				row :user
				row :from
				row :created_at
				row :updated_at
      end
      active_admin_comments
  end


	form do |f|
      f.inputs do
				f.input :user, :as => :select, :label => "Send to:", :collection => User.where("users.confirmed_at IS NOT NULL"), :include_blank => false
        f.input :subject
				f.input :message
      end
		f.actions
	end
  
end
