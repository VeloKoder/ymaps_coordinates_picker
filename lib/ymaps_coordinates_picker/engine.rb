# encoding: utf-8
require 'rails'
require 'adapter'
# picker module
module YmapsCoordinatesPicker
  # picker engine as a native part of rails engine
  class Engine < ::Rails::Engine
    config.after_initialize do
      # adding picker helper to ViewHelper module
      ActionView::Base.send(:include, YmapsCoordinatesPicker::ViewHelper)
      # adding picker form helper to FormBuilder module
      ActionView::Helpers::FormBuilder.send(:include, YmapsCoordinatesPicker::FormBuilder)
      # include definer as a part of ActiveRecord adapter
      ActiveRecord::Base.send(:include, Adapter::YmapsGeopicker) if Object.const_defined? 'ActiveRecord'
      # include definer as a part of Mongoid adapter
      Mongoid.send(:include, Adapter::YmapsGeopicker) if Object.const_defined? 'Mongoid'
    end
  end
end