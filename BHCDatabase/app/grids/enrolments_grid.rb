class EnrolmentsGrid

  include Datagrid

  scope do
    Enrolment
  end

  filter(:condition, :dynamic, :header => "Filter")

  column(:id, :mandatory => true) do |model|
    format(model.id) do |value|
      value
    end
  end
  column(:user_id, :header => 'User', :mandatory => true) do |model|
    format(model.user_id) do |value|
      user = User.find(value)
      link_to user.name, user
    end
  end
  column(:initiative_id, :header => 'Initiative', :mandatory => true) do |model|
    format(model.initiative_id) do |value|
      init = Initiative.find(value)
      link_to init.name, init
    end
  end

end
