class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :type
      t.integer :actor
      t.integer :repo

      t.timestamps
    end
  end
end
