# frozen_string_literal: true

module MicropostsHelper

  def micropost_star_count(micropost)
    count = micropost.star_count

    count > 9999 ? '9999+' : count
  end
end
