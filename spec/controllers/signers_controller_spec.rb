require 'rails_helper'

describe SignersController do
  
  describe 'GET #new' do
    it 'assigns a new Signer to @signer' do
      get :new
      expect(assigns(:signer)).to be_a_new(Signer)
    end
    it 'renders the :new template' do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST #create" do
    before :each do
      @signer = build(:signer)
    end

    context "with valid attributes" do
      it "saves the new signer in the database" do
        post :create
        expect(assigns(:signer)).to eq @signer
      end
      it "renders the :success template"
    end

    context "with invalid attributes" do
      it "does not save the new contact to the database"
      it "re-renders the :new template"
    end
  end

end