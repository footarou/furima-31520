class ShopperInfo
  include ActiveModel::Model
  attr_accessor :zip_code, :prefecture_id, :municipality, :address, :building, :phone_no, :user_id, :item_id, :token
  

  with_options presence: true do
    validates :zip_code,            format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id,       numericality: { other_than: 1 }
    validates :municipality
    validates :address
    validates :phone_no,            format: { with: /\A\d{10,11}\z/ }
    validates :token
    validates :user_id
    validates :item_id
  end

  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    Address.create(zip_code: zip_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building: building, phone_no: phone_no, purchase_record_id: purchase_record.id)
  end

end
