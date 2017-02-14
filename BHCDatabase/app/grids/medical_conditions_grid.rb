class MedicalConditionsGrid

  include Datagrid

  scope do
    MedicalCondition
  end

   filter(:id, :string, :multiple => ',')
   filter(:name, :string, :multiple => ',')
 # filter(:created_at, :date, :range => true, :header => "Creation date")
 # filter(:updated_at, :date, :range => true, :header => "Updated date")
 # filter(:user, :string, :multiple => ',')

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
  column(:description, :mandatory => true)

end
