require 'rails_helper'
require 'warden_helper'

blog = Blog.create({ text: "What I Think" })

describe "the add a comment process" do
  it "should add a comment" do
    user = User.create({ email: "test@test.com", password: "password" })
    login_as user, :scope => :user
    visit new_blog_comment_path(blog)
    fill_in 'Text', :with => 'Never Read the Comments'
    click_on 'Create Comment'
    expect(page).to have_content 'Never Read the Comments'
  end

  it "should error when no text is entered" do
    user = User.create({ email: "test@test.com", password: "password" })
    login_as user, :scope => :user
    visit new_blog_comment_path(blog)
    click_on 'Create Comment'
    expect(page).to have_content 'errors'
  end
end

describe "the edit a comment process" do
  it "should modify the text of a comment" do
    user = User.create({ email: "test@test.com", password: "password" })
    comment = Comment.create({ text: "Never Read These", blog_id: blog.id, user_id: user.id })
    login_as user, :scope => :user
    visit edit_blog_comment_path(blog, comment)
    fill_in 'Text', :with => 'Hello World'
    click_on 'Update Comment'
    expect(page).to have_content 'Hello World'
  end

  it "should error when text is not provided" do
    user = User.create({ email: "test@test.com", password: "password" })
    login_as user, :scope => :user
    comment = Comment.create({ text: "Never Read These", blog_id: blog.id, user_id: user.id })
    visit edit_blog_comment_path(blog, comment)
    fill_in 'Text', :with => ''
    click_on 'Update Comment'
    expect(page).to have_content 'error'
  end
end
