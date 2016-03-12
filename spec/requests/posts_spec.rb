require 'spec_helper'
require 'rails_helper'

describe "Posts API" do
  describe "#index" do
    context 'there are no posts' do
      it 'sends nothing' do
        get '/api/posts'

        json = JSON.parse(response.body)

        # test for the 200 status-code
        expect(response).to be_success

        # check to make sure the right amount of messages are returned
        expect(json.length).to eq(0)
      end
    end
    context 'there are some posts' do
      it 'sends all posts' do
        FactoryGirl.create_list(:post, 10)

        get '/api/posts'

        json = JSON.parse(response.body)

        # test for the 200 status-code
        expect(response).to be_success

        # check to make sure the right amount of messages are returned
        expect(json.length).to eq(10)
      end

      it 'sends upvote counts' do
        test_post = FactoryGirl.create(:post)
        test_post.upvotes.create()
        test_post.upvotes.create()

        get '/api/posts'
        json = JSON.parse(response.body)
        expect(json.first['upvotes']).to eq(2)
      end
    end
  end

  describe "#new" do
    it 'creates a new post' do
      post '/api/posts', post: {title: "This is a title", body: "body body"}

      json = JSON.parse(response.body)
      expect(json['title']).to eq "This is a title"
      expect(json['body']).to eq "body body"
    end
  end
end
