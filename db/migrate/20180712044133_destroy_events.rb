class DestroyEvents < ActiveRecord::Migration[5.1]
  def change
  	drop_table :events
  end
end
