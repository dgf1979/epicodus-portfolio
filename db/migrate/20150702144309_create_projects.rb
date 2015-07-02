class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.column :name, :string
      t.column :description, :string
      t.column :url, :string
      t.column :category_id, :integer
      t.timestamps
    end
  end
end
