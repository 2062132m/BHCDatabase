class UsersGrid
  include Datagrid

  scope do
    User
  end

  filter(:id, :string, :multiple => ',')
  filter(:name, :string) { |value| where('name like ? ', "%#{value}%") }
  filter(:email, :string)
  filter(:telephone, :integer)
  filter(:emergency_contact, :integer)
  filter(:dob, :date, :range => true)

  column(:id, :mandatory => true) do |model|
    format(model.id) { |value| link_to value, model }
  end
  column(:name, :mandatory => true) do |model|
    format(model.name) { |value| link_to value, model }
  end
  column(:email, :mandatory => true)
  column(:telephone, :mandatory => true)
  column(:emergency_contact, :mandatory => true)
  column(:dob, :mandatory => true) do |model|
    format(model.dob) { |value| value.strftime('%d/%m/%Y') }
  end
  column(:privilege, :mandatory => true)
end
