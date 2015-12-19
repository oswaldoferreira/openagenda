require 'rails_helper'

RSpec.describe 'Events API', type: :request do
  describe 'POST api/v1/events' do
    context 'when valid attributes' do
      let(:attributes) {
        {
          'title' => 'Rubyconf 2016',
          'start_at' => DateTime.new(2015, 3, 20),
          'description' => 'Rubyconf event is awesome.'
        }
      }

      let(:perform_request) { post '/api/v1/events', 'event' => attributes }

      it 'creates an event' do
        expect{ perform_request }.to change(Event, :count).from(0).to(1)
      end

      it 'responds with 201 (created)' do
        perform_request
        expect(response).to have_http_status(:created)
      end

      it 'has valid body content' do
        perform_request

        event = Event.first
        expect(JSON.parse(response.body)).to eq(
          {
            "event"=>{
              "id"=>event.id,
              "title"=>"Rubyconf 2016",
              "description"=>'Rubyconf event is awesome.',
              "start_at"=>"2015-03-20T00:00:00.000Z",
              "user_id"=>nil
            }
          }
        )
      end
    end

    context 'when invalid attributes' do
      let(:attributes) {
        {
          'title' => '',
          'start_at' => '',
          'description' => ''
        }
      }

      let(:perform_request) { post '/api/v1/events', 'event' => attributes }

      it 'creates no event' do
        expect{ perform_request }.not_to change(Event, :count)
      end

      it 'responds with 422 (unprocessable entity)' do
        perform_request

        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'has valid body content' do
        perform_request

        expect(JSON.parse(response.body)).to eq(
          {
            'message' => 'Validation Failed',
            'errors' =>  ["Title can't be blank"]
          }
        )
      end
    end
  end
end
