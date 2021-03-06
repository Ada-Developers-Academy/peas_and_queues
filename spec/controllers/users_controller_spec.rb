require 'spec_helper'

describe UsersController do
  describe "GET 'show'" do

    let(:user){ create(:user) }

    it 'should work' do
      get :show, id: user.id
      expect(response.status).to eq 200
    end

    it 'should be that user' do 
      user1 = create(:user1)
      get :show, id: user.id
      expect(assigns(:user)).to eq user
    end
  end

  describe "POST 'update'" do
    let(:updated_attr) { { name: 'blake', email: 'user@user.com'} }
    let(:user) { create(:user) }

    it "should update the user's attributes" do
      xhr :put, :update, :format => "json", id: user.id, user: updated_attr
      user.reload
      expect(user.email).to eq 'user@user.com'
      expect(user.name).to eq 'blake'
    end
  end
end
