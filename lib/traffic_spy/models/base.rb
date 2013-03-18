module TrafficSpy

  if ENV["TRAFFIC_SPY_ENV"] == "test"
    database_file = "traffic_spy_test"
  else
    database_file = "traffic_spy_development"
  end

  DB = Sequel.postgres(database_file)
end

#
# Require all the files within the model directory here...
#
# @example
#
# require 'traffic_spy/models/request'
