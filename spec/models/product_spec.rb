require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    before do
      @category = Category.new(:name => "Test Category")
      @product = @category.products.new(:name => "Test Product", :price => 100, :quantity => 10)
    end

    it "successfully saves a product given a name, price, quantity, and category" do
      @product.save
      expect(@product).to be_valid
      expect(@product.errors.full_messages).to be_empty
    end

    # validates :name, presence: true
    it "fails to save a product when no name is specified" do
      @product.name = nil
      @product.save
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to_not be_empty
    end

    # validates :price, presence: true
    it "fails to save a product when no price is specified" do
      @product.price_cents = nil
      @product.save
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to_not be_empty
    end

    # validates :quantity, presence: true
    it "fails to save a product when no quantity is specified" do
      @product.quantity = nil
      @product.save
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to_not be_empty
    end

    # validates :category, presence: true
    it "fails to save a product when no category is specified" do
      @noCategoryProduct = Product.new(:name => "Test Product", :price => 100, :quantity => 10)
      @noCategoryProduct.save
      expect(@noCategoryProduct).to_not be_valid
      expect(@noCategoryProduct.errors.full_messages).to_not be_empty
    end

  end
end
