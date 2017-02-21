class ConditionsGrid

  include Datagrid

  scope do
    Condition
  end

  #
  # Columns
  #

  column(:id, :mandatory => true) do |model|
    format(model.id) do |value|
      link_to value, MedicalCondition.find(model.medical_condition_id)
    end
  end
  column(:medical_condition_id, :mandatory => true) do |model|
    format(model.medical_condition_id) do |value|
      link_to MedicalCondition.find(model.medical_condition_id).name, MedicalCondition.find(model.medical_condition_id)
    end
  end

end
