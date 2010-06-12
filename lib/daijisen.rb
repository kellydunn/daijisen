$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

=begin
Yahoo Daijisen Japanese Dictionary Scraper
Author:  Kelly Dunn
=end

module Daijisen
  require 'rubygems'
  require 'nokogiri'
  require 'open-uri'
  require 'cgi'

  # Query Object.
  # Effectively scrapes The Yahoo Daijisen Dictionary
  # And finds definitions of the Japanese String passed in
  #
  # TODO: Incorporate SHIFT_JS encoding.  Only UTF-8 works for now.
  class Query
    attr_accessor :defs, :query

    def initialize(query)
      @query = query
      @defs = []
      get_raw_html()
    end
    
    # Scraping function.
    def get_raw_html()
      url = "http://dic.yahoo.co.jp/search?stype=0&ei=UTF-8&dtype=2&p=" + CGI::escape(@query)
      html = Nokogiri::HTML(open(url))
      html.css("span.s115").each do |daiji_def|
        @defs.push(Definition.new(daiji_def))
      end
    end

    def each
      @defs.each do |d|
        yield d
      end
    end

    private :get_raw_html
  end

  # For delicious Ruby Modularity, Definitions will be OOPified.
  class Definition
    attr_accessor :link, :example, :reading

    def initialize(def_html)
      @link = def_html.css("a")[0]['href']
      @reading = def_html.css("a")[0].content
      @example = def_html.css("small")[0].content
    end
  end
end
