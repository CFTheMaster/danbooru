class CreateAntiVoters < ActiveRecord::Migration
  def change
    create_table :anti_voters do |t|
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
