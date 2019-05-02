class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :firstName
      t.string :lastName
      t.string :address
      t.string :phone
      t.string :email
      t.string :fax
      t.string :dob
      t.string :occupation
      t.string :ssn
      t.string :status

      t.timestamps
    end
  end
end
