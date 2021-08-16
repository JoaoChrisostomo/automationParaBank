Dir[File.join(File.dirname(__FILE__), '../../sections/*/*.rb')].sort.each { |file| require file }

module Web
  module Pages
    module Results
      class Results < SitePrism::Page
        set_url '/'



      end
    end
  end
end

