RSpec.describe 'GET/api/articles' do
  let!(:articles) { 3.times { create(:article) } }
  describe 'successfully get list of articles' do
    before do
      get '/api/articles'
    end
    it 'expected to return a 200 response' do
      expect(response).to have_http_status 200
    end

    it 'is expected to have valid title in first "article"' do
      expect(JSON.parse(response.body)['articles'][0]['title']).to eq 'MyTitle'
    end

    it 'is expected to have valid lead in second "article"' do
      expect(JSON.parse(response.body)['articles'][1]['lead']).to eq 'MyLead'
    end

    it 'is expected to have valid body in third "article"' do
      expect(JSON.parse(response.body)['articles'][2]['body']).to eq 'MyBody'
    end

    it 'expected to return all articles' do
      expect(response_json['articles'].count).to eq 3
    end
  end
end
