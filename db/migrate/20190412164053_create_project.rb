class CreateProject < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :project_name
      t.string :project_url
      t.references :user, index: true
      t.references :template, index: true
    end
  end
end
