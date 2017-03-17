class EnrolmentsGrid
  include Datagrid

  scope do
    Enrolment
  end

  filter(:id, :string, :multiple => ',')
  filter(:user, :integer, :multiple => ',')
  filter(:initiative, :integer, :multiple => ',')

  column(:id, :mandatory => true)
  column(:user_id, :header => 'User', :mandatory => true) do |model|
    format(model.user_id) do |value|
      user = User.find(value)
      link_to user.known_as, user
    end
  end
  column(:initiative_id, :header => 'Initiative', :mandatory => true) do |model|
    format(model.initiative_id) do |value|
      init = Initiative.find(value)
      link_to init.name, init
    end
  end
  column(:created_at, :header => 'Enrolled', :mandatory => true) do |model|
    format(model.created_at) { |value| value.strftime('%d/%m/%Y - %H:%M') }
  end
  column(:created_at, :header => 'Un-Enrolled', :mandatory => true) do |model|
    format(model.updated_at) do |value|
      value == model.created_at ? 'Still Enrolled' : value.strftime('%d/%m/%Y - %H:%M')
    end
  end
end
