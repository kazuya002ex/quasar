# frozen_string_literal: true

class Entry < ApplicationRecord
  belongs_to :user
  belongs_to :room
end
