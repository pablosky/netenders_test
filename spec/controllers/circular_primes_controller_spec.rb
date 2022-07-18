require 'rails_helper'

RSpec.describe CircularPrimesController, type: :controller do
  describe "GET index" do
    it 'returns a successful response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET index with arguments" do
    it 'returns a successful response with calculations' do
      get :index, params: { primes_calculator: { limit: 100 }  }
      expect(response).to be_successful
    end
  end

end