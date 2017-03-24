class MeetingsInInitiativesGrid
  include Datagrid

  scope do
    Meeting
  end

  column(:id) do |model|
    format(model.id) { |value| link_to value, model }
  end
  column(:datetime) do |model|
    format(model.datetime) { |value| link_to value.strftime('%d/%m/%Y - %H:%M'), model }
  end
end
