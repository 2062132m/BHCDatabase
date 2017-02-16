class VolunteersHomepageController < ApplicationController

  skip_before_action :user_only?

  def index

  end
end
