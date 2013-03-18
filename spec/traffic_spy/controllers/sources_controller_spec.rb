require 'spec_helper'

module TrafficSpy
  describe SourcesController do
    before(:each) do 
      Source.destroy_all
    end

    describe '.create' do
      it "accepts parameters" do 
        expect{ SourcesController.create({})}.to_not raise_error(ArgumentError)
      end

      context "given both the identifier and rootUrl" do 
        it "returns 200 status and a message" do 
          result = SourcesController.create({identifier: 'jumpstartlab', rootUrl: 'http://jumpstartlab.com'})

          expect(result.status).to eq 200
          expect(result.body.downcase).to include("created 'jumpstartlab' source for url 'http://jumpstartlab.com'")
        end
      end

      context "given an identifier that already exists" do 
        it "returns a 403 status and a message" do

          result = SourcesController.create({identifier: 'jumpstartlab', rootUrl: 'http://jumpstartlab.com'})
          dup_result = SourcesController.create({identifier: 'jumpstartlab', rootUrl: 'http://something.jumpstartlab.com'})

          expect(dup_result.status).to eq 403
          expect(dup_result.body.downcase).to include("identifier already exists")
        end
      end

      context "missing parameters" do 

        it "returns 400 and an error message when missing the identifier" do

          result = SourcesController.create({rootUrl: 'http://espn.com'})
          expect(result.status).to eq 400
          expect(result.body.downcase).to include("identifier missing")
        end

        it "returns 400 and an error message when missing the rooturl" do

          result = SourcesController.create({identifier: 'jumpstartlab'})
          expect(result.status).to eq 400
          expect(result.body.downcase).to include("rooturl missing")
        end
      end

    end
  end
end
