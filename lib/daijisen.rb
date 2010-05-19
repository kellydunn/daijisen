$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

module Daijisen
  VERSION = '0.0.1'
  require 'rexml/document'
  require 'open-uri'
  require 'cgi'

  class Query
    @attr_accessor :query

    def initialize(query)
      get_raw_html(query)
    end

    # Recursive helper function.
    # Grabs all associated data for this paticular 
    # definition of the current query.
    def find_def(x, build)
      test = x.gets
      if !test.include? "</span>"
        return test+find_def(x, build)
      end
      return ""
    end

    def get_raw_html(query)
      doc = ""
      url = "http://dic.yahoo.co.jp/search?stype=0&ei=UTF-8&dtype=2&p=" + CGI::escape(query)
      open(url) do |file|
        file.each_line do |line|
          if line.include? "s115"
            doc+=find_def(file, "")
          end
        end
      end
      puts doc
    end

    private :find_def
  end
end
