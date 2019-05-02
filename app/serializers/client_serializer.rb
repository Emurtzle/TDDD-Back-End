class ClientSerializer < ActiveModel::Serializer
  attributes :id, :firstName, :lastName, :phone, :address, :email, :fax, :dob, :occupation, :ssn, :status
end
