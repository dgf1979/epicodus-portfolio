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

describe "reading a category" do
  it "views a category" do
    category = Category.create({ name: 'Ruby'})
    visit category_path(category)
    expect(page).to have_content 'Ruby'
  end
end

describe "the edit a category process" do
  category = Category.create({ name: "Ruby" })

  it "edits a category" do
    visit edit_category_path(category)
    fill_in 'Name', :with => 'JavaScript'
    click_on 'Update Category'
    expect(page).to have_content 'JavaScript'
  end

  it "fails to edit a category" do
    visit edit_category_path(category)
    fill_in 'Name', :with => ''
    click_on 'Update Category'
    expect(page).to have_content 'error'
  end

end
