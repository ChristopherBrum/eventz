# frozen_string_literal: true

class User < ApplicationRecord # rubocop:disable Style/Documentation
  has_many :registrations, dependent: :destroy
  has_secure_password

  validates :name,     presence: true
  validates :username, presence: true,
                       uniqueness: { case_sensitive: false },
                       format: { with: /\A[A-Z0-9]+\z/i }
  validates :email,    format: { with: /\S+@\S+/ },
                       uniqueness: { case_sensitive: false }
end
