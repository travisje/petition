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

    context "with valid attributes" do
      it "saves the new signer in the database" do
        expect{
          post :create, signer: attributes_for(:signer)}.to change(Signer, :count).by(1)
      end
      it "renders the :success template" do
        post :create, signer: attributes_for(:signer)
        expect(response).to render_template :success
      end
    end

    context "with invalid attributes" do
      it "does not save the new contact to the database" do
        expect {
          post :create, signer: attributes_for(:invalid_signer)
        }.to_not change(Signer, :count)
      end

      it "re-renders the :new template" do
        post :create, signer: attributes_for(:invalid_signer)
        expect(response).to render_template :new
      end

    end
  end

end