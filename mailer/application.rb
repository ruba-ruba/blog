require 'sinatra/base'
# require 'sinatra_more'
require 'sinatra'
require 'pry'

require_relative 'mailer.rb'

class Application < Sinatra::Base
  # register SinatraMore::MarkupPlugin
  # register SinatraMore::RenderPlugin
  # register SinatraMore::WardenPlugin
  # register SinatraMore::MailerPlugin
  # register SinatraMore::RoutingPlugin
end


get '/' do
  status = Mailer::Notifier.new.test_email
  status.to_s
end


