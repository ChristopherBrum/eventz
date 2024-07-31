# frozen_string_literal: true

class Registration < ApplicationRecord # rubocop:disable Style/Documentation
  belongs_to :event
  belongs_to :user

  HOW_HEARD_OPTIONS = [
    'Newsletter',
    'Blog',
    'Twitter',
    'Myspace',
    'Newspaper',
    'Web Search',
    'Friend',
    'Other'
  ].freeze

  validates :how_heard, inclusion: { in: HOW_HEARD_OPTIONS }
end
