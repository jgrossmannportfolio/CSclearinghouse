ActiveAdmin.register Project do
  show do |ad|
      attributes_table do
				row :id
        row :title
        row :description
				row :owner
				row :deadline
				row :created_at
				row :updated_at
				row :user
				row :tags do
					project.tags.map { |tag| tag.name }.join(', ')
				end
      end
      active_admin_comments
  end

	form do |f|
      f.inputs do
				f.input :user, :as => :select, :include_blank => false
        f.input :title
				f.input :description
				f.input :owner
				f.input :deadline
				f.input :tags, :as => :check_boxes
      end
		f.actions
end
	
end

