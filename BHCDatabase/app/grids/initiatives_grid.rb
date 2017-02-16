class InitiativesGrid

  include Datagrid

  scope do
    Initiative
  end

  #
  # Filters
  #

 # filter(:condition, :dynamic, :header => "Filter")

  filter(:id, :string, :multiple => ',')
  filter(:name, :string, :multiple => ',')
  #filter(:created_at, :date, :range => true, :header => "Creation date")
  #filter(:updated_at, :date, :range => true, :header => "Updated date")
  filter(:area, :string, :multiple => ',')
  filter(:location, :string, :multiple => ',')


  #
  # Conditions
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
  column(:location, :mandatory => true)
  column(:description, :mandatory => true)
  column(:area_id, :header => "Area", :mandatory => true) do |model|
    format(model.area_id) do |value|
      Area.find(value).name
    end
  end

end
