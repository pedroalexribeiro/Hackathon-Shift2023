class CreateDeadlines < ActiveRecord::Migration[6.1]
  def change
    create_table :deadlines do |t|
      t.string :name
      t.references :project, null: false, foreign_key: true
      t.column :status, :integer, default: 0

      t.timestamps
    end
  end
end
