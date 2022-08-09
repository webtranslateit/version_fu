# frozen_string_literal: true

require 'version_fu'
ActiveRecord::Base.class_eval { include VersionFu }
