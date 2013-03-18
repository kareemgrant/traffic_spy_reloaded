module TrafficSpy
  class Source
    attr_reader :identifier, :root_url, :errors

    def initialize(params)
      @identifier = params[:identifier]
      @root_url = params[:root_url]
    end

    def valid?
      @errors = []

      if @identifier.nil?
        @errors.push(ValidationError.new(category: :missing_identifier, message: "Identifier missing"))
      end

      if @root_url.nil?
        @errors.push(ValidationError.new(category: :missing_root_url, message: "RootUrl missing"))
      end

      if Source.exists?(identifier)
        @errors.push(ValidationError.new(category: :duplicate_identifier, message: "Identifier already exists"))
      end

      @errors.empty?
    end

    def self.exists?(identifier)
      all.any?{|source| source.identifier == identifier}
    end

    def self.all
      @sources ||= []
    end

    def save
      Source.all.push(self)
      self
    end

    def self.count
      all.count
    end

    def self.destroy_all
     all.clear 
    end

  end
end
