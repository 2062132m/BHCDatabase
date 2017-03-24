class ConditionsGrid
  include Datagrid

  scope do
    Condition
  end

  column(:medical_condition_id) do |model|
    format(model.medical_condition_id) do
      link_to MedicalCondition.find(model.medical_condition_id).name, MedicalCondition.find(model.medical_condition_id)
    end
  end
  column(:created_at, :header => 'Date Assigned') do |model|
    format(model.created_at) { |value| value.strftime('%d/%m/%Y - %H:%M') }
  end
  column(:id, :header => 'Unassign') do |model|
    format(model.id) do |value|
      @condition = Condition.find(value)
      # Delete the condition, which will in turn create an 'unassigned_condition'
      link_to "<i class='glyphicon glyphicon-remove-sign'></i> Unassign".html_safe, @condition, method: :delete, class: "btn btn-default unenrol-btn"
    end
  end
end
