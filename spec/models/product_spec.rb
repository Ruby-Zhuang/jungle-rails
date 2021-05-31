require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    before do
      @category = Category.new(:name => "Test Category")
    end

    it "successfully saves a product given a name, price, quantity, and category" do
      @product = Product.new(:name => "Test Product", :price => 100, :quantity => 10, :category => @category)
      @product.save!
      expect(@product).to be_valid
      expect(@product.errors.full_messages).to be_empty
    end

    # validates :name, presence: true
    it "fails to save a product when no name is specified" do
    end

    # validates :price, presence: true
    it "fails to save a product when no price is specified" do
    end

    # validates :quantity, presence: true
    it "fails to save a product when no quantity is specified" do
    end

    # validates :category, presence: true
    it "fails to save a product when no category is specified" do
    end

  end
end
