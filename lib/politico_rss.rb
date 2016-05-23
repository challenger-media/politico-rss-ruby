require "politico_rss/version"

require 'nokogiri'
require 'open-uri'
require 'active_support/core_ext/hash/conversions' # enables .from_xml method
require 'plissken' # enables .to_snake_keys method

# A module for parsing POLITICO RSS feeds (http://www.politico.com/rss).
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
    response[:link] = response[:link][0][:href] unless response[:link].kind_of?(String) # simplify "link" attribute from a Hash to a String (if necessary - sometimes its just a string)
    response[:items] = response.delete(:item) # rename "item" attribute to "items"
    response[:items] = [response[:items]] unless response[:items].kind_of?(Array) # ensure the "items" attribute is an array, even if there is only one item, in which case it was a hash

    return response
  end
end
