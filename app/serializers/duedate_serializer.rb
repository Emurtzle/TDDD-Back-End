class DuedateSerializer < ActiveModel::Serializer
  attributes :id, :client_id, :name, :description, :dateDue, :progress, :status
end
