require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'should save a valid product with all four fields successfully' do
      @category = Category.create(name:"Makeup")
      product = Product.new(name: "Lipstick", price: 25.00, quantity: 30, category_id: @category.id)
      expect(product).to (be_valid)
    end

    it 'should not save without valid name' do
      @category = Category.create(name: "Makeup")
      name = Product.new(name: nil, price: 25.00, quantity: 30, category_id: @category.id)
      expect(name).to_not (be_valid)
    end

    it 'should not save without valid price' do
      @category = Category.create(name: "Makeup")
      price = Product.new(name: "Eye shadow", price: nil, quantity: 20, category_id: @category.id)
      expect(price).to_not (be_valid)
    end

    it 'should not save without valid quantity' do
      @category = Category.create(name: "Makeup")
      quantity = Product.new(name: "Eyeliner", price: 15.00, quantity: nil, category_id: @category.id)
      expect(quantity).to_not (be_valid)
    end

    it 'should not save without valid category id' do
      @category = Category.create(name: "Makeup")
      category_id = Product.new(name: "Setting powder", price: 12.00, quantity: 50, category_id: nil)
      expect(category_id).to_not (be_valid)
    end
  end
end