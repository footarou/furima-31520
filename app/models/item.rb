class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :name,             presence: true
  validates :memo,             presence: true
  validates :category_id,      numericality: { other_than: 1 }
  validates :condition_id,     numericality: { other_than: 1 }
  validates :price,            numericality: { only_integer: true, greater_than: 300, less_than: 10000000}
  validates :price,            format: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width numbers.' }
  validates :days_to_ship_id,  numericality: { other_than: 1 }
  validates :shipping_fee_id,  numericality: { other_than: 1 }
  validates :ship_from_id,     numericality: { other_than: 1 }
 
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :ship_from
  belongs_to :days_to_ship
end
