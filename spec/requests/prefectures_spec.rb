require 'rails_helper'

RSpec.describe "Prefectures", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/prefectures/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/prefectures/show"
      expect(response).to have_http_status(:success)
    end
  end

end
