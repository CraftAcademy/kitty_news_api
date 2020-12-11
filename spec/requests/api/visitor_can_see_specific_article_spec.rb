RSpec.describe 'GET/api/atricles' do
  let(:article) { create(:article) }
  describe 'successfully get a specific article' do
    before do
      get "/api/articles/#{article.id}"
    end

    it 'expected to return a 200 response' do
      expect(response).to have_http_status 200
    end

    it 'is expected to show a specific title for first article' do
      expect(response_json['article']['title']).to eq 'MyTitle'
    end

    it 'is expected to show a specific body for first article' do
      expect(response_json['article']['body']).to eq 'MyBody'
    end

    describe 'unsuccessfully get a specific article' do
      before do
        get '/api/articles/abc'
      end

      it 'expected to return a 404 response' do
        expect(response).to have_http_status 404
      end

      it 'is expected to respond with a error message' do
        expect(response_json['message']).to eq 'Something went wrong, this article was not found'
      end
    end
  end
end
