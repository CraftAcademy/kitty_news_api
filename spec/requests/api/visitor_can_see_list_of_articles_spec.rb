RSpec.describe 'GET/api/articles' do
  let!(:articles) { 3.times { create(:article) } }
  describe 'successfully get list of articles' do
    before do
      get '/api/articles'
    end
    it 'expected to return a 200 response' do
      expect(response).to have_http_status 200
    end
    it 'expected to return all articles' do
      expect(response_json['articles'].count).to eq 3
    end
  end
end
