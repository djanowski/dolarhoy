require "nokogiri"
require "net/http"
require "uri"

module DolarHoy
  VERSION = "0.3.0"

  def self.fetch(html = self.html)
    doc = Nokogiri::HTML(html)

    currencies = []

    doc.css("body > div table[@bgcolor='#000000']").each do |table|
      values = table.css("font[@size='3']")
      next unless values.size > 1

      currency = Currency.new(
        table.at_css("td:first").inner_text,
        values[0].inner_text,
        values[1].inner_text
      )

      currencies << currency
    end

    currencies
  end

  def self.html
    response = Net::HTTP.start(URI.parse('http://www.dolarhoy.com').host) do |http|
      http.get('/indexx.php', 'Referer' => 'http://www.dolarhoy.com')
    end

    if RUBY_VERSION > "1.9"
      response.body.force_encoding("ISO-8859-1").encode("UTF-8")
    else
      response.body
    end
  end
end

require "dolarhoy/currency"
