class EnrolmentsInUsersGrid
  include Datagrid

  scope do
    Enrolment
  end

  column(:id, :mandatory => true)
  column(:initiative_id, :header => 'Initiative', :mandatory => true) do |model|
    format(model.initiative_id) do |value|
      init = Initiative.find(value)
      link_to init.name, init
    end
  end
  column(:created_at, :header => 'Date Enrolled', :mandatory => true) do |model|
    format(model.created_at) { |value| value.strftime('%d/%m/%Y - %H:%M') }
  end
  # Display button to unenrol a user from the initiative
  column(:id, :header => 'Unenrol', :mandatory => true) do |model|
    format(model.id) do |value|
      @enrolment = Enrolment.find(value)
      # Delete the enrolment, which will in turn create an 'unenrolment'
      link_to "<i class='glyphicon glyphicon-remove-sign'></i> Unenrol".html_safe, @enrolment, method: :delete, class: "btn btn-default unenrol-btn"
    end
  end
end
