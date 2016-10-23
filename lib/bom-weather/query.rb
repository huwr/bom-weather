module BOMWeather
  class Query
    attr_accessor :uri

    def initialize(uri="ftp://ftp2.bom.gov.au/anon/gen/fwo/IDA00100.dat")
      @uri = uri
    end

    def execute
      Parser.new(`curl "#{@uri}"`)
    end
  end
end