class UsersGrid
  include Datagrid

  scope do
    User
  end

  filter(:id, :string, :multiple => ',')
  filter(:forename, :string) { |value| where.has { forename =~ "%#{value}%" } }
  filter(:surname, :string) { |value| where.has { surname =~ "%#{value}%" } }
  filter(:email, :string) { |value| where.has { email =~ "%#{value}%" } }
  filter(:telephone, :string) { |value| where.has { telephone =~ "%#{value}%" } }
  filter(:emergency_telephone, :string) { |value| where.has { emergency_telephone =~ "%#{value}%" } }
  filter(:dob, :date, :range => true)

  column(:id) do |model|
    format(model.id) { |value| link_to value, model }
  end
  column(:forename) do |model|
    format(model.forename) { |value| link_to value, model }
  end
  column(:surname) do |model|
    format(model.surname) { |value| link_to value, model }
  end
  column(:email)
  column(:telephone)
  column(:emergency_telephone)
  column(:dob) do |model|
    format(model.dob) { |value| value.strftime('%d/%m/%Y') }
  end
  column(:privilege) do |value|
    if value.privilege == 0
      'Admin'
    elsif value.privilege == 1
      'Volunteer'
    else
      'Service User'
    end
  end
end
