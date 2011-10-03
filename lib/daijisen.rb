# TODO determine if I need these.
$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

module Daijisen
  require 'rubygems'
  require 'nokogiri'
  require 'open-uri'
  require 'cgi'

  # TODO: Incorporate SHIFT_JS encoding.  Only UTF-8 works for now.
  class Query
    attr_accessor :defs, :query, :url

    def initialize(query)
      @query = query
      @defs = []
      @url = ""
      get_raw_html()
    end
    
    def get_raw_html()
      @url = "http://dic.yahoo.co.jp/search?stype=0&ei=UTF-8&dtype=2&p=" + CGI::escape(@query)
      html = Nokogiri::HTML(open(url))
      
      # TODO Configurable and diggable
      html.css("#DSm1 ol > li").each do |daiji_def|
        @defs.push(Definition.new(daiji_def))
      end
    end

    def each
      @defs.each do |d|
        yield d
      end
    end
  end

  class Definition
    attr_accessor :link, :example, :reading

    def initialize(def_html)
      @link = def_html.css("h3 a")[0]['href']
      @reading = def_html.css("h3 a")[0].content
      @example = def_html.css("div")[0].content
    end
  end
end
