class StaticController < ApplicationController
  skip_before_action :authenticate_user!, only: [:lp]

  def lp
  end
end
