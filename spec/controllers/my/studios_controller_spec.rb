require 'rails_helper'

RSpec.describe My::StudiosController, type: :controller do
  let(:user) { FactoryGirl.create(:user, :studio) }
  let(:studio) { FactoryGirl.create(:studio, user: user) }

  let(:params) do
    HashWithIndifferentAccess.new(
      studio:{ user_attributes: {
        name: 'Studio1',
        contact_number: '0123456789',
        address: '497 Hoa Hao, district 10, Ho Chi Minh city'
      },
      website: 'http://studio.com',
      description: 'Lorem ipsum dolor sit amet',
      bank_name: 'asdsa',
      account_number: '21312',
      account_owner: 'Phuoc',
      option_name: 'Clothes Rental',
      option_price: 100
    })
  end
  before do
    sign_in user
  end

  describe 'get methods' do
    it 'success get#show' do
      get :show
      expect(response).to render_template(:show)
    end

    it 'success get#edit' do
      get :edit
      expect(response).to render_template(:edit)
    end
  end

  describe 'update studio profile' do
    it 'success update studio profile' do
      put :update, params.merge(id: studio.id)
      expect(response).to redirect_to edit_my_studio_path
    end

    it 'fail update studio profile' do
      params[:studio][:website] = 'test'
      put :update, params.merge(id: studio.id)
      expect(response).to render_template :edit
    end
  end
end
