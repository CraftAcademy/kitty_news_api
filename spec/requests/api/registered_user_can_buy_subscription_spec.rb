RSpec.describe "POST /api/subscriptions", type: :request do
  describe "Registered user can buy subscription" do
    let(:registered_user) { create(:registered_user) }
    let(:registered_user_headers) { registered_user.create_new_auth_token }
    let(:stripe_helper) { StripeMock.create_test_helper }
    let(:valid_stripe_token) { stripe_helper.generate_card_token }

    before(:each) { StripeMock.start }
    after(:each) { StripeMock.stop }

    let(:product) { stripe_helper.create_product }
    let!(:plan) do
      stripe_helper.create_plan(
        id: 'kitty_subscription',
        amount: 75,
        currency: 'usd',
        interval: 'year',
        interval_count: 1,
        name: 'kitty_subscription',
        product: product.id
      )
    end

    describe "successfully" do
      before do
        post "/api/subscriptions",
        params: {
          stripeToken: valid_stripe_token,
        },
        headers: registered_user_headers
      end

      it "is expected to return a 201 response" do
        expect(response).to have_http_status 201
      end

      it "is expected to return a success message" do
        expect(response_json["message"]).to eq "Meow. Thanks for the yarn!"
      end

      it "is expected to turn a registered user into a subsciber" do
        expect(registered_user.reload.role).to eq "subscriber"
      end
    end

    describe "unsuccessfully when card is declined" do
      before do
        StripeMock.prepare_card_error(:card_declined, :new_invoice)
        post "/api/subscriptions",
        params: {
          stripeToken: valid_stripe_token,
        },
        headers: registered_user_headers
      end

      it "is expected to return a 422 response" do
        expect(response).to have_http_status 422
      end

      it "is expected to return a error message" do
        expect(response_json["message"]).to eq "Are you a dog?! The card was declined"
      end

      it "is expected to keep registered user as a registered user" do
        expect(registered_user.reload.role).to eq "registered_user"
      end
    end 

    describe "unsuccessfully when subscriber can't pay yearly amount" do
      let(:subscriber) { create(:user, role: 'subscriber') }
      let(:subscriber_header) { subscriber.create_new_auth_token }
      before do
        StripeMock.prepare_card_error(:card_declined, :new_invoice)
        post "/api/subscriptions",
        params: {
          stripeToken: valid_stripe_token,
        },
        headers: subscriber_header
      end

      it "is expected to return a 422 response" do
        expect(response).to have_http_status 422
      end

      it "is expected to return a error message" do
        expect(response_json["message"]).to eq "Are you a dog?! The card was declined"
      end

      it "is expected turn subscriber into a registered user" do
        expect(subscriber.reload.role).to eq "registered_user"
      end
    end 
  end
end