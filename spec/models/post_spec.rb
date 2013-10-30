require 'spec_helper'

describe Post do
  it "title should be automatically titleized before save" do
     post = Post.new
    post.title   = "My test post"
    post.content = "A great story"
    post.title.should eq "My test post!"
    post.save

    #title is titleized right before save
    post.title.should eq "My Test Post"
  end

  it "should be unpublished by default" do
    post = Post.new
    post.title = "Test"
    post.content = "test content"
    post.save
    post.is_published .should eq false
  end

  # a slug is an automaticaly generated url-friendly
  # version of the title
  it "slug should be automatically generated" do
    post = Post.new
    post.title   = "New post!"
    post.content = "A great story"
    post.slug.should be_nil
    post.save

    post.slug.should eq "new-post"
  end
end
