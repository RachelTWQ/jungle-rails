require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

    3.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They can add product to my cart" do

    visit root_path
    expect(page).to have_content "My Cart (0)"
    first('.actions').click_button('Add')
    # puts page.html
    expect(page).to have_content "My Cart (1)"

    save_screenshot
  end

end
