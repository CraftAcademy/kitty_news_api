RSpec.describe 'POST/api/articles', type: :request do
  let(:registered_user) { create(:registered_user) }
  let(:registered_user_headers) { registered_user.create_new_auth_token }
  let(:journalist) { create(:journalist) }
  let(:journalist_headers) { journalist.create_new_auth_token }
  let(:category) { create(:category, label: 'global_politics') }

  describe 'successfully creates an article' do
    before do
      post '/api/articles',
           params: {
             article: {
               title: 'A title',
               lead: 'And a lead',
               body: 'With a body',
               category_id: category.id,
               author_id: journalist.id
             }
           },
           headers: journalist_headers
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
           },
           headers: journalist_headers
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
           },
           headers: journalist_headers
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
           },
           headers: journalist_headers
    end

    it 'is expected to return a 422' do
      expect(response).to have_http_status 422
    end

    it 'is expected to return a error message' do
      expect(response_json['message']).to eq 'Category must exist'
    end
  end

  describe 'Registered user can not create an article' do
    before do
      post '/api/articles',
           params: {
             article: {
               title: 'A title',
               lead: 'And a lead',
               body: 'With a body',
               category_id: category.id,
               author_id: registered_user.id
             }
           },
           headers: registered_user_headers
    end
    it 'is expected to return 401 status' do
      expect(response).to have_http_status 401
    end
    it 'is expected to return an error message' do
      expect(response_json).to have_key('message').and have_value('You are not authorized to create an article.')
    end
  end

  describe 'Visitor can not create an article' do
    before do
      post '/api/articles',
           params: {
             article: {
               title: 'A title',
               lead: 'And a lead',
               body: 'With a body',
               category_id: category.id,
               author_id: 'Test author'
             }
           }
    end
    it 'is expected to return 401 status' do
      expect(response).to have_http_status 401
    end
    it 'is expected to return an error message' do
      expect(response_json['errors']).to eq ['You need to sign in or sign up before continuing.']
    end
  end
end
