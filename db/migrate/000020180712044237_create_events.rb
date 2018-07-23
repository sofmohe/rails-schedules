class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :startdate
      t.string :enddate
      t.string :name
      t.string :location
      t.text :memo
      t.integer :user_id

      t.timestamps
    end
  end
end
