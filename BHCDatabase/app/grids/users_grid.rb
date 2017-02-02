class UsersGrid

  include Datagrid

  scope do
    User.where(:privilege => false)
  end

  filter(:condition, :dynamic, :header => "Filter")

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
