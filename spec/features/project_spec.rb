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

describe "the edit a project process" do
  project = category.projects.create({ name: "Prototype"})
  it "edits a project" do
    visit edit_category_project_path(category, project)
    fill_in 'Name', :with => 'Hello World'
    click_on 'Update Project'
    expect(page).to have_content 'Hello World'
  end
end
