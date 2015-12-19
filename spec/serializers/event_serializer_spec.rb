require 'rails_helper'

RSpec.describe EventSerializer do
  describe '#as_json' do
    let!(:event) { build(:event) }
    let(:serializer) { described_class.new(event) }
    let(:adapter) { ActiveModel::Serializer::Adapter.create(serializer) }

    it 'returns serialized event' do
      expect(adapter.as_json).to eq(
        event: {
          id: event.id,
          title: event.title,
          description: event.description,
          start_at: event.start_at,
          user_id: event.user_id
        }
      )
    end
  end
end
