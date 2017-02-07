class StaticPagesController < ApplicationController

  skip_before_action :user?

  def contact
  end
end
