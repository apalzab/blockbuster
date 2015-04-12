require 'rails_helper'

RSpec.describe MoviesController, type: :controller do

  describe 'GET #index' do
    it "populates an array of movies" do
      movies = Movie.all.limit(15) # 15 is the elements
      get :index
      expect(assigns(:movies)).to match_array(movies)
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    let(:movie) do
      create(:movie)
    end

    it "assigns the requested movie to @movie" do
      get :show, id: movie
      expect(assigns(:movie)).to eq(movie)
    end

    it "renders the :show template" do
      get :show, id: movie
      expect(response).to render_template :show
    end
  end
end
