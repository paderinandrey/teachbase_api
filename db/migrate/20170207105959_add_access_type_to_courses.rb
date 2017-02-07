class AddAccessTypeToCourses < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :access_type, :string
  end
end
