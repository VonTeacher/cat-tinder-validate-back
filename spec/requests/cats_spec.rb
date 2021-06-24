require 'rails_helper'

RSpec.describe "Cats", type: :request do
  describe "GET /index" do
    it "gets a list of cats" do
      # create a cat
      Cat.create name: 'Toasty', age: 2, enjoys: 'alllll the attention'

      # make a request
      get '/cats'

      # parsing cat into a ruby hash
      cat = JSON.parse(response.body)

      # expect status to be good
      expect(response).to have_http_status(200)
      # expect one cat
      expect(cat.length).to eq 1
    end
  end

  describe "POST /create" do
    it "creates a cat" do
      cat_params = {
        cat: {
          name: 'Toasty',
          age: 2,
          enjoys: 'allllll the attention'
        }
      }

      # make a request
      post '/cats', params: cat_params

      # expect status to be good
      expect(response).to have_http_status(200)
      # expect to have a cat
      new_cat = Cat.first
      expect(new_cat.name).to eq('Toasty')
      expect(new_cat.age).to eq(2)
      expect(new_cat.enjoys).to eq('allllll the attention')

    end
  end
end
