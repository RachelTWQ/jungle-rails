class Review < ActiveRecord::Base
    belongs_to :product
    belongs_to :user

    validates :product_id, presence: true
    validates :user_id, presence: true
    validates :description, presence: true
    validates :rating, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }, presence: true
end
