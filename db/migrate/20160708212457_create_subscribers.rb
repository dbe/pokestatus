class CreateSubscribers < ActiveRecord::Migration[5.0]
  def change
    create_table :subscribers do |t|
      t.string :email
      t.string :ip

      t.timestamps
    end

    add_index :subscribers, :email, unique: true
  end
end
