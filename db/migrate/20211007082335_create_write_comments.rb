class CreateWriteComments < ActiveRecord::Migration[5.2]
  def change
    create_table :write_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :write_id

      t.timestamps
    end
  end
end
