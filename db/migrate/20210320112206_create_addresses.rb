class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string         :zip_code,         null: false
      t.integer        :prefecture_id,    null: false
      t.string         :municipality,     null: false
      t.string         :address,          null: false
      t.string         :building
      t.string         :phone_no,         null: false
      t.references     :purchase_record,   foreign_key: true
      t.timestamps
    end
  end
end


