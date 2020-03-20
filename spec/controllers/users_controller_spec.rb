# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users is empty' do
    it 'should return OK' do
      get '/users'
      payload = JSON.parse(response.body)
      expect(payload).to be_empty
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /users' do
    let!(:users) { create_list(:user, 10) }

    it 'should users list' do
      get '/users'
      payload = JSON.parse(response.body)
      expect(payload).to_not be_empty
      expect(payload.size).to eq(users.size)
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /user/{id}' do
    let!(:user) { create(:user) }

    it 'should return an user' do
      get "/users/#{user
                        .id}"
      payload = JSON.parse(response.body)
      expect(payload).to_not be_empty
      expect(payload['id']).to eq(user.id)
      expect(payload['name']).to eq(user.name)
      expect(payload['last_name']).to eq(user.last_name)
      expect(payload['phone_number']).to eq(user.phone_number)
      expect(payload['email']).to eq(user.email)
      expect(payload['address']).to eq(user.address)
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /users' do
    it 'should create an user' do
      req_payload = {
        user: {
          name: 'pepe',
          last_name: 'perez',
          phone_number: '3111111',
          email: 'prueba@gmail.com',
          address: 'av 123'
        }
      }

      # POST HTTP
      post '/users', params: req_payload
      payload = JSON.parse(response.body)
      expect(payload).to_not be_empty
      expect(payload['id']).to_not be_nil
      expect(response).to have_http_status(:created)
    end

    it 'should return error message on invalid params' do
      req_payload = {
        user: {
          name: 'pepe'
        }
      }

      # POST HTTP
      post '/users', params: req_payload
      payload = JSON.parse(response.body)
      expect(payload).to_not be_empty
      expect(payload['last_name']).to_not be_empty
      expect(payload['phone_number']).to_not be_empty
      expect(payload['email']).to_not be_empty
      expect(payload['address']).to_not be_empty
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'PUT /users/{id}' do
    let!(:old_user) { create(:user) }

    it 'should update an user' do
      req_payload = {
        user: {
          name: 'pepe',
          last_name: 'perez',
          phone_number: '3111111',
          email: 'prueba@prueba.com',
          address: 'av 123'
        }
      }

      # PUT HTTP
      put "/users/#{old_user.id}", params: req_payload
      payload = JSON.parse(response.body)
      expect(payload).to_not be_empty
      expect(payload['id']).to eq(old_user.id)
      expect(response).to have_http_status(:ok)
    end

    it 'should return error message on invalid user' do
      req_payload = {
        user: {
          name: '',
          last_name: 'perez',
          phone_number: '3111111',
          email: 'prueba@prueba.com',
          address: 'av 123'
        }
      }

      # PUT HTTP
      put "/users/#{old_user.id}", params: req_payload
      payload = JSON.parse(response.body)
      expect(payload).to_not be_empty
      expect(payload['name']).to_not be_empty
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'PUT /users/{id}' do
    let!(:old_user) { create(:user) }

    # DELETE HTTP
    it 'should destroy an user' do
      delete "/users/#{old_user.id}"
      expect(response).to have_http_status(204)
    end
  end
end
