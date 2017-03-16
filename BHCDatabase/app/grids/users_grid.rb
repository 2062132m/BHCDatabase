class UsersGrid
  include Datagrid

  scope do
    User
  end

  filter(:id, :string, :multiple => ',')
  filter(:forename, :string) { |value| where('forename like ? ', "%#{value}%") }
  filter(:email, :string) { |value| where('email like ? ', "%#{value}%") }
  filter(:telephone, :string) { |value| where('telephone like ? ', "%#{value}%") }
  filter(:emergency_telephone, :string) { |value| where('emergency_telephone like ? ', "%#{value}%") }
  filter(:dob, :date, :range => true)

  column(:id, :mandatory => true) do |model|
    format(model.id) { |value| link_to value, model }
  end
  column(:forename, :mandatory => true) do |model|
    format(model.forename) { |value| link_to value, model }
  end
  column(:email, :mandatory => true)
  column(:telephone, :mandatory => true)
  column(:emergency_telephone, :mandatory => true)
  column(:dob, :mandatory => true) do |model|
    format(model.dob) { |value| value.strftime('%d/%m/%Y') }
  end
  column(:privilege, :mandatory => true,
         :header => 'Privileges <html><button button id="pop" data-trigger="hover"
                    data-toggle="popover" title="Levels of Privileges:"
                    data-content="<b>LEVEL 0: </b>Admin <br>
                    <b>LEVEL 1: </b>Volunteer <br>
                    <b>LEVEL 2: </b>User <br>"> <span class="glyphicon glyphicon-question-sign"></span></button>
                    <script>$("#pop").popover({html:true}); </script> </html>'.html_safe , :html => true, )

end
