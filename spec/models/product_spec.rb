require 'rails_helper'

describe Product do
  context "when the product has comments" do
    before do
      @product = Product.create!(name: "The White Album", description: "A double album.  This is one of the best known records of all time.", image_url: "white-record.jpg", colour: "white", price: 19.99)
      @user = User.create!(email: "rob@ogus.org", password: "familyties")
      @product.comments.create!(rating: 1, user: @user, body: "I don't like this!")
      @product.comments.create!(rating: 3, user: @user, body: "Not too bad")
      @product.comments.create!(rating: 5, user: @user, body: "Wow, great record!")
    end

    it "returns the average rating of all comments" do
      expect(@product.average_rating).to eq 3
    end

    it "is not valid" do
      expect(@product = Product.new(description: "A record suitable for all ages")).not_to be_valid
    end

  end
end