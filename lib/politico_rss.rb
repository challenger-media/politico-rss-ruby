require "politico_rss/version"

module PoliticoRSS
  # Request information about, and contents of, a given RSS feed.
  #
  # @param [String] feed_name The name of the POLITICO RSS feed. Get this from the feed's URL.
  #
  # @example PoliticoRSS.feed("politics08")
  def self.feed(feed_name)
    puts feed_name
  end
end
