class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :text

      t.timestamps null: false
    end
  end
end
