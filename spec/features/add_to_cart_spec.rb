require 'rails_helper'

RSpec.feature "Visitor can add items to the cart", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They add an item to the cart and can see the cart number update" do
    # ACT
    visit root_path

    # VERIFY
    expect(page).to have_content 'My Cart (0)'
    
    # DEBUG
    save_and_open_screenshot

    # ACT
    first('.product').click_button('Add')

    # VERIFY - expect cart number to increase by 1
    expect(page).to have_content 'My Cart (1)'

    # DEBUG
    save_and_open_screenshot
  end
end