require 'rails_helper'

describe ItemsController do

  describe 'GET #new' do
    it "new.html.hamlに遷移すること" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #index' do
    # it "@itemに正しい値が入っていること" do
    #   items = create_list(:item, 3)
    #   get :index
    #   expect(assigns(:items)).to match(items.sort{ |a, b| b.created_at <=> a.created_at } )
    # end

    it "index.html.hamlに遷移すること" do
      get :index
      expect(response).to render_template :index
    end
  end
  
end