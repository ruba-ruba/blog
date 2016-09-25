require 'pony'

module Mailer
  def self.smpt_configuration
    {
      :address        => 'smtp.gmail.com',
      :port           => '587',
      :user_name      => 'gunit346@gmail.com',
      :password       => 'qwe22fdsa',
      :authentication => :plain, # :plain, :login, :cram_md5, no auth by default
      :domain         => "localhost.localdomain" # the HELO domain provided by the client to the server
    }
  end
  

  class Notifier
    def test_email
      Pony.mail({
        :to => 'mykhailo.rybak.if@gmail.com',
        :body => 'test',
        :html_body => 'What do you know, Joe?',
        :via => :smtp,
        :via_options => {
          :address        => 'smtp.gmail.com',
          :port           => '465',
          :user_name      => 'gunit346@gmail.com',
          :password       => 'qwe22fdsa',
          :authentication => :plain, # :plain, :login, :cram_md5, no auth by default
          :enable_starttls_auto => true
          # :domain         => "localhost.localdomain" # the HELO domain provided by the client to the server
        }
      })
    end
  end




end