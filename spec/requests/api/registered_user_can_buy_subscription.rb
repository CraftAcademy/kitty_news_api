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
      binding.pry
    end
  end
end