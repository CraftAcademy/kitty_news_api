RSpec.describe 'GET/api/atricles' do
  let(:article) { create(:article) }
  let(:subscriber) { create(:subscriber) }
  let(:subscriber_headers) { subscriber.create_new_auth_token }

  describe 'successfully get a specific article' do
    before do
      get "/api/articles/#{article.id}",
          headers: subscriber_headers
    end

    it 'is expected to return a 200 response' do
      expect(response).to have_http_status 200
    end

    it 'is expected to show a specific title for first article' do
      expect(response_json['article']['title']).to eq 'MyTitle'
    end

    it 'is expected to show a specific body for first article' do
      expect(response_json['article']['body']).to eq 'MyBody'
    end

    it 'is expected to not increes article_click count' do
      expect(subscriber.reload.article_click).to eq 0
    end
  end

  describe 'unsuccessfully get a specific article with incorrect route' do
    before do
      get '/api/articles/abc',
          headers: subscriber_headers
    end

    it 'is expected to return a 404 response' do
      expect(response).to have_http_status 404
    end

    it 'is expected to respond with a error message' do
      expect(response_json['message']).to eq 'Something went wrong, this article was not found'
    end
  end

  describe 'unsuccessfully get a specific article with invalid authentication' do
    before do
      get "/api/articles/#{article.id}"
    end
    it 'is expected to return a error status' do
      expect(response).to have_http_status 401
    end
    it 'is expected to respond with a error message' do
      expect(response_json['errors'][0]).to eq "You need to sign in or sign up before continuing."
    end
  end
end
