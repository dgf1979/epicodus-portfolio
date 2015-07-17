require 'rails_helper'
require 'warden_helper'

describe "the add a comment process" do
  it "should add a comment" do
    blog = Blog.create({ text: "What I Think" })
    user = User.create({ email: "test@test.com", password: "password" })
    login_as user, :scope => :user
    visit blog_path(blog)
    click_on "Leave a Comment"
    fill_in 'comment_text', :with => 'Never Read the Comments'
    click_on 'Create Comment'
    expect(page).to have_content 'Never Read the Comments'
  end
end

describe "the delete a comment process" do
  it "should delete a comment" do
    blog = Blog.create({ text: "What I Think" })
    user = User.create({ email: "test@test.com", password: "password" })
    login_as user, :scope => :user
    comment = Comment.create({ text: "Never Read These", blog_id: blog.id, user_id: user.id })
    visit blog_path(blog)
    expect(page).to have_content 'Never Read These'
    click_on "Delete"
    expect(page).to_not have_content 'Never Read These'
  end
end

describe "the edit a comment process" do
  it "should modify the text of a comment" do
    blog = Blog.create({ text: "What I Think" })
    user = User.create({ email: "test@test.com", password: "password" })
    comment = Comment.create({ text: "Never Read These", blog_id: blog.id, user_id: user.id })
    login_as user, :scope => :user
    visit blog_path(blog)
    expect(page).to have_content 'Never Read These'
    click_on "Edit"
    fill_in 'comment_text', :with => 'Unless you really want to'
    click_on 'Update Comment'
    expect(page).to have_content 'Unless you really want to'
  end
end
