#http://stackoverflow.com/questions/6833411/ruby-unable-to-bind-to-locking-port-7054-within-45-seconds-seleniumwebdrive
# Starting many firefoxen in parallel can easily take more than 45 (default) seconds
module Selenium
  module WebDriver
    module Firefox
      class Launcher
        remove_const(:SOCKET_LOCK_TIMEOUT)
      end
    end
  end
end
Selenium::WebDriver::Firefox::Launcher::SOCKET_LOCK_TIMEOUT = 90