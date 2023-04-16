class CreateNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :notes do |t|
      t.text :content
      t.references :notable, polymorphic: true, null: false
      t.references :author, polymorphic: true, null: false

      t.timestamps
    end
  end
end
