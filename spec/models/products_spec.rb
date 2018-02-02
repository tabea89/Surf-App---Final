require 'rails_helper'

describe Product do

  context "when the product has comments" do
    let(:product) { Product.create!(name: "race bike") }
    let(:user) { User.create!(email: "tabi.tab@hotmail.com", password: "wasgehtbeidir") }
    before do
      product.comments.create!(rating: 1, user: user, body: "Shitty board!")
      product.comments.create!(rating: 3, user: user, body: "great!")
      product.comments.create!(rating: 5, user: user, body: "Amazing")
    end

    it "returns the average rating of all comments" do
      expect(product.comments.average(:rating)).to eq 3.0
    end

  end
  
  context "when product has a name" do
    before do
      @product = Product.create(name: "Longboard", description: "test", colour: "blue", price: 100)
    end

    it 'is an invalid product' do
      expect(@product).to be_valid
    end
  end

  context "when product has no name" do
    before do
      @product = Product.create(description: "Top board")
    end

    it 'is an invalid product' do
      expect(@product).not_to be_valid
    end
  end

end