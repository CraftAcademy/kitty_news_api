RSpec.describe 'GET/api/categories' do
  let!(:category) { create(:category, label: 'global_politics') }
  let!(:articles) { 2.times { create(:article, category: category) } }

  describe 'successfully get articles sorted into categories' do
    before do
      get "/api/categories/#{category.label}"
    end

    it 'is expected to return a 200 response' do
      expect(response).to have_http_status 200
    end

    it 'is expected to return all categories' do
      expect(response_json['category'].count).to eq 3
    end

    it 'it expected to return the label of the category' do
      expect(response_json['category']['label']).to eq 'global_politics'
    end

    it 'is expected to show title of ONE of the articles' do
      expect(response_json['category']['articles'][1]['title']).to eq 'MyTitle'
    end
    describe 'unsuccessfully get a specific category' do
      before do
        get '/api/categories/abc'
      end

      it 'expected to return a 404 response' do
        expect(response).to have_http_status 404
      end

      it 'is expected to respond with a error message' do
        expect(response_json['message']).to eq 'Something went wrong, this category was not found'
      end
    end
  end
end
