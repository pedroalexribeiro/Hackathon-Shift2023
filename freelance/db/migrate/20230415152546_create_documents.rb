class CreateDocuments < ActiveRecord::Migration[6.1]
  def change
    create_table :documents do |t|
      t.text :name
      t.references :source, polymorphic: true, null: false
      t.references :author, polymorphic: true, null: false

      t.timestamps
    end
  end
end
