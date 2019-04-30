class CreateDuedates < ActiveRecord::Migration[5.2]
  def change
    create_table :duedates do |t|
      t.belongs_to :client
      t.string :name
      t.string :description
      t.string :dateDue
      t.string :progress
      t.string :status

      t.timestamps
    end
  end
end
