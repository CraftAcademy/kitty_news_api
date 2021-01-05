RSpec.describe 'POST/api/articles', type: :request do
  let!(:articles) { create(:article)}
  describe 'successfully creates an article' do
    before do
      post '/api/articles',
      params: { 
        article: {
          title: "A title",
          lead: "And a lead",
          body: "With a body"
        }
      }
    end
    it 'is expected to return a 201' do
      expect(response).to have_http_status 201
    end

    it 'is expected to return a success message' do
      expect(response_json['Your article was successfully created']).to eq true
    end

  end

end