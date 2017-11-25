require 'rails_helper'

RSpec.describe Api::RealEstatesController, type: :controller do

    describe "GET #index" do
        it "index all real estates" do
            get :index, format: :json
            expect(response.status).to eq(200)
        end
    end

    describe "GET #show" do
        it "show real estate object data" do
            real_estate = FactoryGirl.create(:real_estate)
            get :show, params: { id: real_estate.id}, format: :json
            expect(response.status).to eq(200)
        end
    end

    describe "GET #show" do
        it "returns error response when id is not found" do
            get :show, params: { id: Faker::Number.number } , format: :json
            expect(response.status).to eq(422)
        end
    end

    describe "POST #create" do
        it "create real estate entry " do
            post :create, params: {real_estate: FactoryGirl.attributes_for(:real_estate)} , format: :json
            expect(response.status).to eq(201)
        end
    end

    describe "POST #create" do
        it "returns error response when field is missing" do
            post :create, params: {real_estate: FactoryGirl.attributes_for(:real_estate, street: nil)} , format: :json
            expect(response.status).to eq(422)
        end
    end


    describe "POST #update" do
        it "updates real estate entry " do
            real_estate = FactoryGirl.create(:real_estate)
            
            put :update, params: {id: real_estate.id, real_estate: FactoryGirl.attributes_for(:real_estate)} , format: :json
            expect(response.status).to eq(200)
        end
    end


    describe "POST #update" do
        it "returns error response when field is missing" do
            real_estate = FactoryGirl.create(:real_estate)
            put :update, params: {id: real_estate.id, real_estate: FactoryGirl.attributes_for(:real_estate, zip: nil)} , format: :json
            expect(response.status).to eq(422)
        end
    end

    describe "POST #update" do
        it "returns error response when id is not found" do
            put :update, params: {id: Faker::Number.number, real_estate: FactoryGirl.attributes_for(:real_estate, zip: nil)} , format: :json
            expect(response.status).to eq(422)
        end
    end


    describe "POST #destroy" do
        it "destroys real estate entry " do
            real_estate = FactoryGirl.create(:real_estate)
            delete :destroy, params: {id: real_estate.id, real_estate: FactoryGirl.attributes_for(:real_estate)} , format: :json
            expect(response.status).to eq(200)
        end
    end

    describe "POST #destroy" do
        it "returns error response when id is not found" do
            put :update, params: {id: Faker::Number.number, real_estate: FactoryGirl.attributes_for(:real_estate, zip: nil)} , format: :json
            expect(response.status).to eq(422)
        end
    end

    describe "get #search" do
        it "show real estate object data with the search critieria" do
            real_estate = FactoryGirl.create(:real_estate)
            get :search, params: {price_from: real_estate.price, area_to: real_estate.square_feet} , format: :json
            expect(response.status).to eq(200)
        end
    end
end
