require 'rails_helper'

RSpec.describe 'Preferences', type: :request do
  describe 'GET /users/#{user.id}/preferences is empty' do
    let!(:user) { create(:user) }

    it 'should return OK' do
      get "/users/#{user.id}/preferences"
      payload = JSON.parse(response.body)
      expect(payload).to be_empty
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /users/#{user_id}/preferences' do

    let!(:user) { create(:user) }
    let!(:preference) { create(:preference, user_id: user.id) }

    it 'should preferences list' do
      get "/users/#{user.id}/preferences"
      payload = JSON.parse(response.body)
      expect(payload).to_not be_empty
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /users/#{user_id}/preferences/{id}' do
    let!(:user) { create(:user) }
    let!(:preferences) { create(:preference, user_id: user.id) }

    it 'should return an preferences' do
      get "/users/#{user.id}/preferences/#{preferences.id}"
      payload = JSON.parse(response.body)
      expect(payload).to_not be_empty
      expect(payload['id']).to eq(preferences.id)
      expect(payload['description']).to eq(preferences.description)
      expect(payload['data']).to eq(preferences.data)
      expect(payload['user_id']).to eq(user.id)
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /users/#{user_id}preferences' do
    let!(:user) { create(:user) }

    it 'should create an preferences' do
      req_payload = {
          preference: {
              description: Constants::ADDITIONAL_DATA[0],
              data: ["a", "b"]
          }
      }

      # POST HTTP
      post "/users/#{user.id}/preferences", params: req_payload
      payload = JSON.parse(response.body)
      expect(payload).to_not be_empty
      expect(payload['id']).to_not be_nil
      expect(response).to have_http_status(:created)
    end

    it 'should return error message on invalid params' do
      req_payload = {
          preference: {
              data: ["a", "2"]
          }
      }

      # POST HTTP
      post "/users/#{user.id}/preferences", params: req_payload
      payload = JSON.parse(response.body)
      expect(payload).to_not be_empty
      expect(payload['description']).to_not be_empty
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'PUT /users/#{user_id}/preferences/{id}' do
    let!(:user) { create(:user) }
    let!(:old_preference) { create(:preference, user_id: user.id) }

    it 'should update an preferences' do
      req_payload = {
          preference: {
              data: ["a", "2"]
          }
      }

      # PUT HTTP
      put "/users/#{user.id}/preferences/#{old_preference.id}", params: req_payload
      payload = JSON.parse(response.body)
      expect(payload).to_not be_empty
      expect(payload['id']).to eq(old_preference.id)
      expect(response).to have_http_status(:ok)
    end

    it 'should return error message on invalid preferences' do

      req_payload = {
          preference: {
              description: "",
              data: ["b", "5"]
          }
      }

      # PUT HTTP
      put "/users/#{user.id}/preferences/#{old_preference.id}", params: req_payload
      payload = JSON.parse(response.body)
      expect(payload).to_not be_empty
      expect(payload['description']).to_not be_empty
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'DELETE /users/#{user_id}/preferences/{id}' do
    let!(:user) { create(:user) }
    let!(:old_preference) { create(:preference, user_id: user.id) }

    # DELETE HTTP
    it 'should destroy an preferences' do
      delete "/users/#{user.id}/preferences/#{old_preference.id}"
      expect(response).to have_http_status(204)
    end
  end
end
