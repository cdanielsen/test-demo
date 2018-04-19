require 'faraday'
require 'nori'

RSpec.describe 'ZillowApi' do
  describe "The DeepSearch endpoint" do
    it "responds with the correct information for a valid request" do
      conn = Faraday.new(:url => 'https://www.zillow.com/')
      response = conn.get('webservice/GetDeepSearchResults.htm') do |req|
        req.params['zws-id'] = ENV['ZILLOW_KEY']
        req.params['address'] = '5305+NE+40th+Ave'
        req.params['citystatezip'] = 'Portland+OR+97211'
      end

      # Meta
      expect(response.success?).to eq(true)
      expect(response.status).to eq(200)

      # Raw response converted from xml => hash
      hashedResponse = Nori.new.parse(response.body)
      # Property information
      result = hashedResponse['SearchResults:searchresults']['response']['results']['result']
      
      expectedBedrooms = '2'
      actualBedrooms = result['bedrooms']
      expect(actualBedrooms).to eq(expectedBedrooms)
      
      expectedBathrooms = '1.0'
      actualBathrooms = result['bathrooms']
      expect(actualBathrooms).to eq(expectedBathrooms)

      expectedYearBuilt = '1949'
      actualYearBuilt = result['yearBuilt']
      expect(actualYearBuilt).to eq(expectedYearBuilt)

    end
  end
end