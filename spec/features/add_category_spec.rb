require 'rails_helper'

describe "the add a category process" do
  it "adds a new category" do
    visit new_category_path
    fill_in 'Name', :with => 'Ruby'
    click_on 'Create Category'
    expect(page).to have_content 'Ruby'
  end

  it "gives error when no name is entered" do
    visit new_category_path
    click_on 'Create Category'
    expect(page).to have_content 'errors'
  end
end
