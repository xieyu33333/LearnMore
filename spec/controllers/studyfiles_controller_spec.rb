require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe StudyfilesController do

  # This should return the minimal set of attributes required to create a valid
  # Studyfile. As you add validations to Studyfile, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "filename" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # StudyfilesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all studyfiles as @studyfiles" do
      studyfile = Studyfile.create! valid_attributes
      get :index, {}, valid_session
      assigns(:studyfiles).should eq([studyfile])
    end
  end

  describe "GET show" do
    it "assigns the requested studyfile as @studyfile" do
      studyfile = Studyfile.create! valid_attributes
      get :show, {:id => studyfile.to_param}, valid_session
      assigns(:studyfile).should eq(studyfile)
    end
  end

  describe "GET new" do
    it "assigns a new studyfile as @studyfile" do
      get :new, {}, valid_session
      assigns(:studyfile).should be_a_new(Studyfile)
    end
  end

  describe "GET edit" do
    it "assigns the requested studyfile as @studyfile" do
      studyfile = Studyfile.create! valid_attributes
      get :edit, {:id => studyfile.to_param}, valid_session
      assigns(:studyfile).should eq(studyfile)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Studyfile" do
        expect {
          post :create, {:studyfile => valid_attributes}, valid_session
        }.to change(Studyfile, :count).by(1)
      end

      it "assigns a newly created studyfile as @studyfile" do
        post :create, {:studyfile => valid_attributes}, valid_session
        assigns(:studyfile).should be_a(Studyfile)
        assigns(:studyfile).should be_persisted
      end

      it "redirects to the created studyfile" do
        post :create, {:studyfile => valid_attributes}, valid_session
        response.should redirect_to(Studyfile.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved studyfile as @studyfile" do
        # Trigger the behavior that occurs when invalid params are submitted
        Studyfile.any_instance.stub(:save).and_return(false)
        post :create, {:studyfile => { "filename" => "invalid value" }}, valid_session
        assigns(:studyfile).should be_a_new(Studyfile)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Studyfile.any_instance.stub(:save).and_return(false)
        post :create, {:studyfile => { "filename" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested studyfile" do
        studyfile = Studyfile.create! valid_attributes
        # Assuming there are no other studyfiles in the database, this
        # specifies that the Studyfile created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Studyfile.any_instance.should_receive(:update_attributes).with({ "filename" => "MyString" })
        put :update, {:id => studyfile.to_param, :studyfile => { "filename" => "MyString" }}, valid_session
      end

      it "assigns the requested studyfile as @studyfile" do
        studyfile = Studyfile.create! valid_attributes
        put :update, {:id => studyfile.to_param, :studyfile => valid_attributes}, valid_session
        assigns(:studyfile).should eq(studyfile)
      end

      it "redirects to the studyfile" do
        studyfile = Studyfile.create! valid_attributes
        put :update, {:id => studyfile.to_param, :studyfile => valid_attributes}, valid_session
        response.should redirect_to(studyfile)
      end
    end

    describe "with invalid params" do
      it "assigns the studyfile as @studyfile" do
        studyfile = Studyfile.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Studyfile.any_instance.stub(:save).and_return(false)
        put :update, {:id => studyfile.to_param, :studyfile => { "filename" => "invalid value" }}, valid_session
        assigns(:studyfile).should eq(studyfile)
      end

      it "re-renders the 'edit' template" do
        studyfile = Studyfile.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Studyfile.any_instance.stub(:save).and_return(false)
        put :update, {:id => studyfile.to_param, :studyfile => { "filename" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested studyfile" do
      studyfile = Studyfile.create! valid_attributes
      expect {
        delete :destroy, {:id => studyfile.to_param}, valid_session
      }.to change(Studyfile, :count).by(-1)
    end

    it "redirects to the studyfiles list" do
      studyfile = Studyfile.create! valid_attributes
      delete :destroy, {:id => studyfile.to_param}, valid_session
      response.should redirect_to(studyfiles_url)
    end
  end

end
