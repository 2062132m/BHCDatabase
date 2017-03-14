class MeetingsInInitiativesGrid
  include Datagrid

  scope do
    Meeting
  end

  column(:id, :mandatory => true) do |model|
    format(model.id) { |value| link_to value, model }
  end
  column(:datetime, :mandatory => true) do |model|
    format(model.datetime) { |value| link_to value.strftime('%d/%m/%Y - %H:%M'), model }
  end
end
