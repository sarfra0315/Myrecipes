class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
    	t.string :description
    	t.integer :chef_id
    	t.integer :recipe_id
    	t.timestamps
    end
  end
end