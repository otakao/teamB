require 'rails_helper'

describe ItemsController do
  describe 'GET #new' do
    it "new.html.hamlに遷移すること" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it "@itemに正しい値が入っていること" do
      user = create(:user)
      item = create(:item)
      get :edit, params: { id: item }
      expect(assigns(:item)).to eq item
    end

    it "edit.html.hamlに遷移すること" do
      user = create(:user)
      item = create(:item)
      get :edit, params: { id: item}
      expect(response).to render_template :edit
    end
  end

end