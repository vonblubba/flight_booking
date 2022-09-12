# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string           not null
#  last_name              :string           not null
#  password               :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email)
#  index_users_on_first_name            (first_name)
#  index_users_on_last_name             (last_name)
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    user = User.new(
      first_name: 'Jeffrey',
      last_name: 'Lebowski',
      email: 'j.lebowsi@gmail.com',
      password: 'pwdprova',
      password_confirmation: 'pwdprova'
    )

    expect(user).to be_valid
  end

  it 'is not valid without an email' do
    user = User.new(first_name: 'Jeffrey', last_name: 'Lebowski', password: 'pwdprova')
    expect(user).not_to be_valid
  end

  it 'is not valid with an invalid email' do
    user = User.new(
      first_name: 'Jeffrey',
      last_name: 'Lebowski',
      email: 'invalid_email',
      password: 'pwdprova',
      password_confirmation: 'pwdprova'
    )

    expect(user).not_to be_valid
  end

  it 'is not valid without a first name' do
    user = User.new(
      last_name: 'Lebowski',
      email: 'j.lebowsi@gmail.com',
      password: 'pwdprova',
      password_confirmation: 'pwdprova'
    )

    expect(user).not_to be_valid
  end

  it 'is not valid without a last name' do
    user = User.new(
      first_name: 'Jeffrey',
      email: 'j.lebowsi@gmail.com',
      password: 'pwdprova',
      password_confirmation: 'pwdprova'
    )

    expect(user).not_to be_valid
  end

  it 'is not valid without two equal passwords' do
    user = User.new(
      first_name: 'Jeffrey',
      last_name: 'Lebowski',
      email: 'j.lebowsi@gmail.com',
      password: 'pwdprova',
      password_confirmation: 'pwdprova2'
    )

    expect(user).not_to be_valid
  end
end
