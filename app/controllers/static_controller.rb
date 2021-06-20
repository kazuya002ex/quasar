class StaticController < ApplicationController
  skip_before_action :authenticate_user!, only: [:lp, :conf, :help]

  def lp
  end

  def conf
  end

  def help
  end
end
