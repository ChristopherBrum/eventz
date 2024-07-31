# frozen_string_literal: true

class Like < ApplicationRecord # rubocop:disable Style/Documentation
  belongs_to :event
  belongs_to :user
end
