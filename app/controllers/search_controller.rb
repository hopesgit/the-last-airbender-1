class SearchController < ApplicationController
  def index
    conn = Faraday.new(url: "https://last-airbender-api.herokuapp.com/api/v1/")
    response = conn.get("characters") do |c|
      c.params[:affiliation] = params[:nation].sub("_", " ")
      c.params[:perPage] = 100
    end

    @characters = JSON.parse(response.body, symbolize_names: true)
  end
end
