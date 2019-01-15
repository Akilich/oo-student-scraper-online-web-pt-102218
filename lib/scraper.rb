require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    doc = open(index_url).read
    html = Nokogiri::HTML(doc)

    html.css('div.student-card').map do |student|
      {
        name: student.css('a div.card-text-container h4').text,
        location: student.css('a div.card-text-container p').text,
        profile_url: student.css('a').attribute('href').value
      }
    end
  end
  end

  def self.scrape_profile_page(profile_url)
    
  end

end

