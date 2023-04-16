class CreateFreelancers < ActiveRecord::Migration[6.1]
  def change
    create_table :freelancers do |t|
      t.string :name
      t.string :brand_name, default: "MesModder"
      t.string :eth_nonce
      t.string :eth_address

      t.timestamps
    end
  end
end
