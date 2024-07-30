# frozen_string_literal: true

class Registration < ApplicationRecord # rubocop:disable Style/Documentation
  belongs_to :event

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

  validates :name,      presence:  true
  validates :email,     format:    { with: /\S+@\S+/ }
  validates :how_heard, inclusion: { in: HOW_HEARD_OPTIONS }
end
