  # article_controller.rb

  # before_action :is_user_subscriber?, only: [:show]

  # def is_user_subscriber?
  #   unless current_user.subscriber?
  #   render json: { message: 'You are not catscribed yet? You shall be' }, status: 401
  #   end
  # end

  # subscriber_can_read_specific_article_spec.rb
  # describe "unsuccessfully get a specific article with invalid authentication" do
  #   before do
  #     get "/api/articles/#{article.id}",
  #     headers: registered_user_headers
  #   end

  #   it "is expected to return a error status" do
  #     expect(response).to have_http_status 401
  #   end

  #   it 'is expected to respond with a error message' do
  #     expect(response_json['message']).to eq 'You are not catscribed yet? You shall be'
  #   end
  # end