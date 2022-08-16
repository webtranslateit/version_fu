# frozen_string_literal: true

class Author < ActiveRecord::Base

  version_fu

  def create_new_version?
    first_name_change && last_name_changed?
  end

  def name
    "#{first_name} #{last_name}"
  end

  def hello_world(num = 1)
    "Hello World #{num}"
  end

end
