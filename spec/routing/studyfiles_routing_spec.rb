require "spec_helper"

describe StudyfilesController do
  describe "routing" do

    it "routes to #index" do
      get("/studyfiles").should route_to("studyfiles#index")
    end

    it "routes to #new" do
      get("/studyfiles/new").should route_to("studyfiles#new")
    end

    it "routes to #show" do
      get("/studyfiles/1").should route_to("studyfiles#show", :id => "1")
    end

    it "routes to #edit" do
      get("/studyfiles/1/edit").should route_to("studyfiles#edit", :id => "1")
    end

    it "routes to #create" do
      post("/studyfiles").should route_to("studyfiles#create")
    end

    it "routes to #update" do
      put("/studyfiles/1").should route_to("studyfiles#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/studyfiles/1").should route_to("studyfiles#destroy", :id => "1")
    end

  end
end
