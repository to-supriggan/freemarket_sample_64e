require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

  describe '#create' do
    context 'can save' do
      subject {
        post :create,
        params: :product
      }
    end
  end
end
