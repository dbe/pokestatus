class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.integer :status
      t.string :ip
      t.datetime :time

      t.timestamps
    end
  end
end
