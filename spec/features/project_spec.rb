require 'rails_helper'

category = Category.create({ name: "Ruby" })

describe "the add a project process" do
  it "adds a new project" do
    visit new_category_project_path(category)
    fill_in 'Name', :with => 'ToDo'
    click_on 'Create Project'
    expect(page).to have_content 'ToDo'
  end

  it "gives error when no name is entered" do
    visit new_category_project_path(category)
    click_on 'Create Project'
    expect(page).to have_content 'errors'
  end
end
