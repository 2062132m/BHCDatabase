class UnenrolmentsInUsersGrid
  include Datagrid

  scope do
    Unenrolment
  end

  column(:id, :mandatory => true)
  column(:initiative_id, :header => 'Initiative', :mandatory => true) do |model|
    format(model.initiative_id) do |value|
      init = Initiative.find(value)
      link_to init.name, init
    end
  end
  column(:date_enrolled, :header => 'Date Enrolled', :mandatory => true) do |model|
    format(model.date_enrolled) { |value| value.strftime('%d/%m/%Y - %H:%M') }
  end
  column(:created_at, :header => 'Date Unenrolled', :mandatory => true) do |model|
    format(model.created_at) { |value| value.strftime('%d/%m/%Y - %H:%M') }
  end
end
