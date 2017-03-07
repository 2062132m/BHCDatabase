class UsersGrid

  include Datagrid

  scope do
    User
  end


  #
  # Filters
  #

  filter(:id, :string, :multiple => ',')
  #filter(:name, :string, :multiple => ',')
  filter(:name, :string) { |value| where('name like ? ',"%#{value}%") }
  filter(:email, :string)
  filter(:telephone, :integer)
  filter(:emergency_contact, :integer)
  filter(:dob, :date, :range => true)


  #
  # Columns
  #


  column(:id, :mandatory => true) do |model|
    format(model.id) do |value|
      link_to value, model
    end
  end
  column(:name, :mandatory => true) do |model|
    format(model.name) do |value|
      link_to value, model
    end
  end
  column(:email, :mandatory => true)
  column(:telephone, :mandatory => true)
  column(:emergency_contact, :mandatory => true)
  column(:dob, :mandatory => true) do |model|
    format(model.dob) do |value|
       value.strftime("%d/%m/%Y")
    end
  end

  column(:privilege, :mandatory => true)

end
