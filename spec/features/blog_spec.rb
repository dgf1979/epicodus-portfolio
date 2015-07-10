require 'rails_helper'
require 'warden_helper'

describe "the add a blog (post) process" do
  it "adds a new blog (post)" do
    visit new_blog_path
    fill_in 'Text', :with => 'My Summer Vaction'
    click_on 'Create Blog'
    expect(page).to have_content 'My Summer Vaction'
  end

  it "gives error when no name is entered" do
    visit new_blog_path
    click_on 'Create Blog'
    expect(page).to have_content 'error'
  end
end

describe "reading a blog" do
  it "views a blog" do
    blog = Blog.create({ text: 'My Summer Vaction'})
    visit blog_path(blog)
    expect(page).to have_content 'My Summer Vaction'
  end
end

describe "the edit a blog post process" do
  blog = Blog.create({ text: 'My Summer Vaction'})

  it "edits a blog" do
    visit edit_blog_path(blog)
    fill_in 'Text', :with => 'My Summer Vaction'
    click_on 'Update Blog'
    expect(page).to have_content 'My Summer Vaction'
  end

  it "fails to edit a blog" do
    visit edit_blog_path(blog)
    fill_in 'Text', :with => ''
    click_on 'Update Blog'
    expect(page).to have_content 'error'
  end
end

describe "the delete a blog post process" do
  blog = Blog.create({ text: 'My Summer Vaction'})
  it "should delete a blog post" do
    user = User.create({ email: "test@test.com", password: "password", admin: true })
    login_as user, :scope => :user
    visit blog_path(blog)
    click_on "Admin"
    click_on "Delete This Post"
    expect(page).to_not have_content 'My Summer Vaction'
    expect(page).to have_content 'Blog was successfully destroyed'
  end
end
