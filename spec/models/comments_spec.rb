require 'rails_helper'

describe Comment do
  before(:each) do
    @product = Product.create(name: "This is a test", description: "test", colour: "blue", price: 100)
    @user = FactoryBot.create(:user)
  end

  context "If comment does not have all attributes" do
    let(:comment) {Comment.new(user_id: 1, product_id: @product.id, body: "Nice board", rating: nil)}

    it 'it is invalid' do
      expect(Comment.new(user_id: 1, product_id: @product.id, body: "Nice board", rating: nil)).not_to be_valid
    end
  end

  context "If comment has all attributes" do
    let(:comment) {Comment.new(user_id: 1, product_id: @product.id, body: "Nice board", rating: 4)}

    it 'it is valid' do
      expect(Comment.new(user_id: 1, product_id: @product.id, body: "Nice board", rating: 4)).to be_valid    
    end
  end
end
