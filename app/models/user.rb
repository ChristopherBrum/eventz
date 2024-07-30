# frozen_string_literal: true

class User < ApplicationRecord # rubocop:disable Style/Documentation
  has_secure_password

  validates :name,  presence: true
  validates :email, format:   { with: /\S+@\S+/ }, uniqueness: { case_sensitive: false }
end
