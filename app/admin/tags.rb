ActiveAdmin.register Tag do
	show do |ad|
      attributes_table do
        row :id
        row :name
				row :projects do
					tag.projects.map {|p| p.title}.join(', ')
				end
				row :created_at
				row :updated_at
      end
      active_admin_comments
  end

form do |f|
      f.inputs do
        f.input :name
				f.input :projects, :as => :check_boxes
      end
		f.actions
end
end
