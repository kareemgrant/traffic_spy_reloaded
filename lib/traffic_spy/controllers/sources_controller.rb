module TrafficSpy
  class SourcesController < Sinatra::Application
    def self.create(params)
      source = Source.new(identifier: params[:identifier], root_url: params[:rootUrl])
      if source.valid?
        source.save
        Response.new(body: "created '#{source.identifier}' source for url '#{source.root_url}'", status: 200)
      else
        status = status_for(source.errors.first.category)
        body = source.errors.collect{|error| error.message}.join(", ")
        
        Response.new(body: body, status: status)
      end

    end

    private

    def self.status_for(flag)
      case flag
        when :missing_identifier then 400
        when :missing_root_url then 400
        when :duplicate_identifier then 403
        else raise "No return status defined for flag #{flag.inspect}"
      end
    end
  end
end
