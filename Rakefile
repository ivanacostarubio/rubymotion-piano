# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'
require './lib/pintador'

begin
  require 'bundler'
  require 'motion/project/template/gem/gem_tasks'
  Bundler.require
rescue LoadError
end

Motion::Project::App.setup do |app|
  app.name = 'truco'
  app.device_family = [:iphone,:ipad]

   app.codesign_certificate = "iPhone Developer: Bellatrix Martinez (26673RW978)"

   app.provisioning_profile = '/Users/ivan/Library/MobileDevice/Provisioning Profiles/7D0009B7-5287-4033-A691-F9AE712A641F.mobileprovision'

   app.frameworks += ['MediaPlayer']


end
