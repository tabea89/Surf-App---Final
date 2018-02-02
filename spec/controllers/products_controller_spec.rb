require 'rails_helper'

  describe ProductsController, type: :controller do

	context "GET #index" do
	  it 'renders the index template' do
	    get :index
	    expect(response).to be_ok
	    expect(response).to render_template('index')
	  end
	end

	context "GET #new" do
	  it 'renders the new template' do
	    get :new
	    expect(response).to be_ok
	    expect(response).to render_template('new')
	  end
    end

    context "GET #edit" do
      before do
        @product = Product.create(name: "This is a test", description: "test", colour: "blue", price: 100)
      end
      
      it 'renders the edit template' do
        get :edit, params: { id: @product.id }
        expect(response).to be_ok
        expect(response).to render_template('edit')
      end
    end

    context "GET #show" do
      before do
        @product = Product.create(name: "This is a test", description: "test", colour: "blue", price: 100)
      end
      
      it 'renders the show template' do
        get :show, params: { id: @product.id }
        expect(response).to be_ok
        expect(response).to render_template('show')
      end
    end

    context "POST #create" do
    before do
      @user = FactoryBot.create(:user)
    end

    it 'if attributes correct shows product page' do
      @product = Product.create(name: "This is a test", description: "test", colour: "blue", price: 100)
      post :create, params: { product: { name: @product.name, description: @product.description, price: @product.price, colour: @product.colour} }
      expect(response).to redirect_to(:action => :show, :id => assigns(:product).id)
    end

    context "POST #update" do
      
      before do
        @product = Product.create(name: "This is a test", description: "test", colour: "blue", price: 100)
      end

      it 'updates product attributes' do
        @update = { name: "Softboard"}
        post :update, params: {id: @product.id, product: @update }
        @product.reload
        expect(@product.name).to eq "Softboard"
      end
    end

    context "DELETE #destroy" do
      before do
        @product = Product.create(name: "This is a test", description: "test", colour: "blue", price: 100)
      end
      
      it 'destroys product and redirects to products_path' do
        delete :destroy, params: { id: @product.id }
        expect(response).to redirect_to products_path
      end
    end
    
  end

end