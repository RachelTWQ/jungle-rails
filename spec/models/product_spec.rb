require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it "should save a valid product" do
      @category = Category.create(name: "Groceries")
      product = Product.new(
        name: "Steak",
        price: 45.00,
        quantity: 3,
        category_id: @category.id
      )
    expect(product).to be_valid
    end

    it "should not save without a valid name" do
      @category = Category.create(name: "Groceries")
      product = Product.new(
        name: nil,
        price: 45.00,
        quantity: 3,
        category_id: @category.id
      )
    expect(product).to_not be_valid
    end

    it "should not save without a valid price" do
      @category = Category.create(name: "Groceries")
      product = Product.new(
        name: "Steak",
        price: nil,
        quantity: 3,
        category_id: @category.id
      )
    expect(product).to_not be_valid
    end

    it "should not save without a valid quantity" do
      @category = Category.create(name: "Groceries")
      product = Product.new(
        name: "Steak",
        price: 45.00,
        quantity: nil,
        category_id: @category.id
      )
    expect(product).to_not be_valid
    end

    it "should not save without a valid category" do
      @category = Category.create(name: "Groceries")
      product = Product.new(
        name: "Steak",
        price: 45.00,
        quantity: 3,
        category_id: nil
      )
    expect(product).to_not be_valid
    end

  end
end
