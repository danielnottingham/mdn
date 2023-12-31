# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  has_many :accounts, dependent: :destroy
  has_many :categories, dependent: :destroy

  validates :full_name, length: { maximum: 60 }
end
