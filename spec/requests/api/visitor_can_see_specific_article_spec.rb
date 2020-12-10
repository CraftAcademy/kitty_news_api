RSpec.describe 'GET/api/atricles' do
  let!(:article) { create(:article) } 
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

  end
end