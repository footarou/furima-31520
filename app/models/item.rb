class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :memo
    validates :price,            numericality: { only_integer: true, greater_than: 300, less_than: 10000000}
    validates :price,            format: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width numbers.' }
    with_options numericality: { other_than: 1 } do
      validates :category_id      
      validates :condition_id
      validates :days_to_ship_id
      validates :shipping_fee_id
      validates :ship_from_id
    end 
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :condition
    belongs_to :shipping_fee
    belongs_to :ship_from
    belongs_to :days_to_ship
  end


