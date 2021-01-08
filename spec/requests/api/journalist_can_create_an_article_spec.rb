RSpec.describe 'POST/api/articles', type: :request do
  let!(:category) { create(:category, label: 'global_politics') }
  let!(:category_2) { create(:category, label: 'global_politics') }

  describe 'successfully creates an article' do
    before do
      post '/api/articles',
           params: {
             article: {
               title: 'A title',
               lead: 'And a lead',
               body: 'With a body',
               category_id: category.id
             }
           }
    end
    it 'is expected to return a 201' do
      expect(response).to have_http_status 201
    end

    it 'is expected to return a success message' do
      expect(response_json['message']).to eq 'Your article was successfully created!'
    end
  end

  describe 'unsuccessfully creates an article without a title' do
    before do
      post '/api/articles',
           params: {
             article: {
               title: '',
               lead: 'Lead',
               body: 'Body',
               category_id: category.id
             }
           }
    end

    it 'is expected to return a 422' do
      expect(response).to have_http_status 422
    end

    it 'is expected to return a error message' do
      expect(response_json['message']).to eq "Title can't be blank"
    end
  end

  describe 'unsuccessfully creates an article without a lead' do
    before do
      post '/api/articles',
           params: {
             article: {
               title: 'Title',
               lead: '',
               body: 'Body',
               category_id: category.id
             }
           }
    end

    it 'is expected to return a 422' do
      expect(response).to have_http_status 422
    end

    it 'is expected to return a error message' do
      expect(response_json['message']).to eq "Lead can't be blank"
    end
  end

  describe 'unsuccessfully creates an article without a category_id' do
    before do
      post '/api/articles',
           params: {
             article: {
               title: 'Title',
               lead: 'lead',
               body: 'Body'
             }
           }
    end

    it 'is expected to return a 422' do
      expect(response).to have_http_status 422
    end

    it 'is expected to return a error message' do
      expect(response_json['message']).to eq 'Category must exist'
    end
  end
end
