class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :group_id
      t.text :memo
      t.string :image_name

      t.timestamps
    end
  end
end
