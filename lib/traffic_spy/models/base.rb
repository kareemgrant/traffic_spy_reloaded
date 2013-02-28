module TrafficSpy

  if ENV["TRAFFIC_SPY_ENV"] == "test"
    DB = Sequel.sqlite database_file
    database_file = 'db/traffic_spy-test.sqlite3'
  else
    DB = Sequel.postgres "traffic_spy"
  end

end

#
# Require all the files within the model directory here...
#
# @example
#
# require 'traffic_spy/models/request'