class EventSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :start_at

  belongs_to :user_id
end
