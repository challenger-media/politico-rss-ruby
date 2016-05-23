require "politico_rss/version"

require 'nokogiri'
require 'open-uri'
require 'active_support/core_ext/hash/conversions' # enables .from_xml method
require 'plissken' # enables .to_snake_keys method

module PoliticoRSS
  # Request information about, and contents of, a given RSS feed.
  #
  # @param [String] feed_name The name of the POLITICO RSS feed. Get this from the feed's URL.
  #
  # @example PoliticoRSS.feed("politics08")
  #
  # @return [Hash]
  #
  def self.feed(feed_name)
    feed_url = "http://www.politico.com/rss/#{feed_name}.xml"

    doc = Nokogiri::XML(open(feed_url))

    response = Hash.from_xml(doc.to_s)
    response = response["rss"]["channel"]
    response = response.to_snake_keys # rename "pubDate" attribute to "pub_date", and rename any other camel-cased keys that might exist in the future
    response[:link] = response[:link][0][:href] # simplify "link" attribute from a Hash to a String
    response[:items] = response.delete(:item) # rename "item" attribute to "items"

    return response
  end
end
