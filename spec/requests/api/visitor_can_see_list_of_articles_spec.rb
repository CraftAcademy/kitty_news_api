RSpec.describe 'GET/api/articles' do
  let(:journalist) { create(:journalist, email: 'journalist2@email.com')}
  let!(:articles) { 3.times { create(:article, author_id: journalist.id) } }
  describe 'successfully get list of articles' do
    before do
      get '/api/articles'
    end
    it 'expected to return a 200 response' do
      expect(response).to have_http_status 200
    end

    it 'is expected to have valid title in first "article"' do
      expect(response_json['articles'][0]['title']).to eq 'MyTitle'
    end

    it 'is expected to have valid lead in second "article"' do
      expect(response_json['articles'][1]['lead']).to eq 'MyLead'
    end

    it 'is expected to have valid date in third "article"' do
      expect(response_json['articles'][2]['created']).to eq Date.today.strftime('%F')
    end

    it 'expected to return all articles' do
      expect(response_json['articles'].count).to eq 3
    end
  end
end
