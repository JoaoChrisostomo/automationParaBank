require_relative 'simple_js_runnable.rb'

module PageHelper
  module KillModals
    def self.kill_modals
      Capybara.page.execute_script(
        "$('.lightbox-close-btn').click();")
    end

    def load
      super
      KillModals.kill_modals
    end
  end

  module KillPopUps
    def kill_popups
      puts 'killing poop ups 💩'
      KillModals.kill_modals
    end
  end
end
