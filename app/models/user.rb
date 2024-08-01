# frozen_string_literal: true

class User < ApplicationRecord # rubocop:disable Style/Documentation
  before_save :set_slug
  before_save :format_username
  before_save :format_email

  has_many :registrations, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_events, through: :likes, source: :event

  has_secure_password

  validates :name,     presence: true
  validates :username, presence: true,
                       uniqueness: { case_sensitive: false },
                       format: { with: /\A[A-Z0-9]+\z/i }
  validates :email,    format: { with: /\S+@\S+/ },
                       uniqueness: { case_sensitive: false }

  def to_param
    slug
  end

  private

  def format_username
    self.username = username.downcase
  end

  def format_email
    self.email = email.downcase
  end

  def set_slug
    self.slug = username.parameterize
    p "username: #{username} - username.parameterize: #{username.parameterize}"
  end
end
