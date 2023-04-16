class CreateClients < ActiveRecord::Migration[6.1]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :phonenumber
      t.string :nif
      t.references :freelancer
      t.string :access_code

      t.timestamps
    end
  end
end
