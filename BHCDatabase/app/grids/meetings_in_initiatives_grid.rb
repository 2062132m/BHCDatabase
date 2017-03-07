class MeetingsInInitiativesGrid

  include Datagrid

  scope do
    Meeting
  end

  #
  # Columns
  #

  column(:id, :mandatory => true) do |model|
    format(model.id) do |value|
      link_to value, model
    end
  end
  column(:datetime, :mandatory => true) do |model|
    format(model.datetime) do |value|
      link_to value.strftime("%d/%m/%Y - %H:%M"), model
    end
  end

end
