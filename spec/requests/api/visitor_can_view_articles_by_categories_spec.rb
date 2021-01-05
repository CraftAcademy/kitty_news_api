RSpec.describe 'GET/api/articles' do
  let!(:category) { create(:category, name: 'global politics') }
  let!(:articles) { 2.times { create(:article, category: category) } }

  describe 'successfully get articles sorted in categories' do
    before do
      get "/api/categories/#{category.name}"
    end

    it 'is expected to return a 200 response' do
      expect(response).to have_http_status 200
    end

    it 'is expected to return all categories' do
      expect(response_json['category']['articles'].count).to eq 2
    end

    it 'it expected to return the name of the category' do
      expect(response_json['category']['name']).to eq 'global politics'
    end

    it 'is expected to show title of one of the articles' do
      expect(response_json['category']['articles'][1]['name']).to eq 'MyTitle'
    end
  end
end
