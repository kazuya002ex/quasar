# frozen_string_literal: true

class MicropostStar < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :micropost
end
