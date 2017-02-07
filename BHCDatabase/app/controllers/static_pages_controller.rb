class StaticPagesController < ApplicationController

  skip_before_action :user_only?, :volunteer_only?

  def contact
  end
end
