# frozen_string_literal: true

require 'active_record'
require 'version_fu/version_fu'
ActiveRecord::Base.class_eval { include VersionFu }
