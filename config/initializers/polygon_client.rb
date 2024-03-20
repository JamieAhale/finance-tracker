require 'polygon_client'

POLYGON_CLIENT = Polygon::Client.new(Rails.application.credentials.polygon[:api_key])