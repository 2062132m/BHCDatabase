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
  filter(:email, :string)
  filter(:telephone, :integer)
  filter(:dob, :date, :range => true)
  filter(:name, :string) { |value| where('name like ? ',"%#{value}%") }
  

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
  column(:dob, :mandatory => true)
  column(:privilege, :mandatory => true)

end
