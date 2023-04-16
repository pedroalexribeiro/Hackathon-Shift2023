class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :category
      t.datetime :deadline
      t.column :status, :integer, default: 0
      t.references :client

      t.timestamps
    end
  end
end
