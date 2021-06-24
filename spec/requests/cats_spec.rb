require 'rails_helper'

RSpec.describe "Cats", type: :request do
  describe "GET /index" do
    it "gets a list of cats" do
      # Create a cat
      Cat.create name: 'Toasty', age: 2, enjoys: 'alllll the attention'

      # Make a request to the index endpoint
      get '/cats'

      # Parsing cat into a ruby hash
      cat = JSON.parse(response.body)

      # Expect status to be good
      expect(response).to have_http_status(200)
      # Expect one cat in the db
      expect(cat.length).to eq 1
    end
  end

  describe "POST /create" do
    it "creates a cat" do
      # Create a cat params data object
      cat_params = {
        cat: {
          name: 'Toasty',
          age: 2,
          enjoys: 'allllll the attention'
        }
      }

      # Make a request to the create endpoint
      post '/cats', params: cat_params

      # Expect status to be good
      expect(response).to have_http_status(200)
      # Expect to have a cat
      new_cat = Cat.first
      expect(new_cat.name).to eq('Toasty')
      expect(new_cat.age).to eq(2)
      expect(new_cat.enjoys).to eq('allllll the attention')
    end
  end

  describe "PATCH /update" do
    it 'updates a cat' do
      # Create a cat
      cat_params = {
        cat: {
          name: 'Toasty',
          age: 2,
          enjoys: 'allllll the attention'
        }
      }
      post '/cats', params: cat_params

      # Change the cat info
      new_cat_params = {
        cat: {
          name: 'Toasty',
          age: 3,
          enjoys: 'allllll the attention'
        }
      }
      # Make a request with the new cat info to the update endpoint (which requires an id)
      cat = Cat.first
      patch "/cats/#{cat.id}", params: new_cat_params

      # Assure that we get a success back
      expect(response).to have_http_status(200)
      # Assure that the edited cat has the correct attributes
      expect(cat.age).to eq 2
    end
  end

  describe "DELETE /destroy" do
    it 'deletes a cat' do
      # Create a cat
      cat_params = {
        cat: {
          name: 'Felix',
          age: 4,
          enjoys: 'Walks in the park.'
        }
      }
      post '/cats', params: cat_params
      cat = Cat.first
      delete "/cats/#{cat.id}"
      expect(response).to have_http_status(200)
      cats = Cat.all
      expect(cats).to be_empty
    end
  end
end
