class ClientSerializer < ActiveModel::Serializer
  attributes :id, :firstName, :lastName, :phone, :email, :fax, :dob, :occupation, :ssn, :status
end
