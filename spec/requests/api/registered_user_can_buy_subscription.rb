RSpec.describe "POST /api/subscriptions", type: :request do
  describe "Registered user can buy subscription" do
    let(:registered_user) { create(:registered_user) }
    let(:registered_user_headers) { registered_user.create_new_auth_token }

    before do
      post "/api/subscriptions",
      params: {
        stripeToken: StripeMock.create_test_helper.generate_card_token,
      },
      headers: registered_user_headers
    end

    it "is expected to return a 200 response" do
      expect(response).to have_http_status 200
    end

    it "is expected to return a success message" do
      expect(response_json["message"]).to eq "Meow. Thanks for the yarn!"
    end
  end
end