class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.integer :course_id, null: false
      t.string  :name,      null: false
      t.string  :description
      t.string  :owner_name
      t.string  :trumb_url
      t.integer :total_score
      t.integer :total_tasks
      t.string  :started_at
      t.string  :finished_at
      t.timestamps
    end

    add_index :courses, :course_id
  end
end
