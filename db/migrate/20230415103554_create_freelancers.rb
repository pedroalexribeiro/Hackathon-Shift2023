class CreateFreelancers < ActiveRecord::Migration[6.1]
  def change
    create_table :freelancers do |t|
      t.string :name
      t.string :brand_name, default: "MesModder"

      t.timestamps
    end
  end
end
