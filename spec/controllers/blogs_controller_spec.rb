require 'spec_helper'

describe BlogsController do

  # let(:valid_attributes) { { "artical" => "MyText" } }
  # let(:valid_session) { {} }

  describe "GET show" do
    it "assigns the requested blog as @blog" do
      blog = create(:blog)
      get :show, :id => blog
      expect(assigns(:blog)).to eq(blog)
    end

    it "render the :show template" do
      blog = create(:blog)
      get :show, :id => blog
      expect(response).to render_template :show
    end
  end

  # describe "GET index" do
  #   it "assigns all blogs as @blogs" do
  #     blog = Blog.create! valid_attributes
  #     get :index, {}, valid_session
  #     assigns(:blogs).should eq([blog])
  #   end
  # end

 

  # describe "GET new" do
  #   it "assigns a new blog as @blog" do
  #     get :new, {}, valid_session
  #     assigns(:blog).should be_a_new(Blog)
  #   end
  # end

  # describe "GET edit" do
  #   it "assigns the requested blog as @blog" do
  #     blog = Blog.create! valid_attributes
  #     get :edit, {:id => blog.to_param}, valid_session
  #     assigns(:blog).should eq(blog)
  #   end
  # end

  # describe "POST create" do
  #   describe "with valid params" do
  #     it "creates a new Blog" do
  #       expect {
  #         post :create, {:blog => valid_attributes}, valid_session
  #       }.to change(Blog, :count).by(1)
  #     end

  #     it "assigns a newly created blog as @blog" do
  #       post :create, {:blog => valid_attributes}, valid_session
  #       assigns(:blog).should be_a(Blog)
  #       assigns(:blog).should be_persisted
  #     end

  #     it "redirects to the created blog" do
  #       post :create, {:blog => valid_attributes}, valid_session
  #       response.should redirect_to(Blog.last)
  #     end
  #   end

  #   describe "with invalid params" do
  #     it "assigns a newly created but unsaved blog as @blog" do
  #       Blog.any_instance.stub(:save).and_return(false)
  #       post :create, {:blog => { "artical" => "invalid value" }}, valid_session
  #       assigns(:blog).should be_a_new(Blog)
  #     end

  #     it "re-renders the 'new' template" do
  #       Blog.any_instance.stub(:save).and_return(false)
  #       post :create, {:blog => { "artical" => "invalid value" }}, valid_session
  #       response.should render_template("new")
  #     end
  #   end
  # end

  # describe "PUT update" do
  #   describe "with valid params" do
  #     it "updates the requested blog" do
  #       blog = Blog.create! valid_attributes
  #       Blog.any_instance.should_receive(:update_attributes).with({ "artical" => "MyText" })
  #       put :update, {:id => blog.to_param, :blog => { "artical" => "MyText" }}, valid_session
  #     end

  #     it "assigns the requested blog as @blog" do
  #       blog = Blog.create! valid_attributes
  #       put :update, {:id => blog.to_param, :blog => valid_attributes}, valid_session
  #       assigns(:blog).should eq(blog)
  #     end

  #     it "redirects to the blog" do
  #       blog = Blog.create! valid_attributes
  #       put :update, {:id => blog.to_param, :blog => valid_attributes}, valid_session
  #       response.should redirect_to(blog)
  #     end
  #   end

  #   describe "with invalid params" do
  #     it "assigns the blog as @blog" do
  #       blog = Blog.create! valid_attributes
  #       Blog.any_instance.stub(:save).and_return(false)
  #       put :update, {:id => blog.to_param, :blog => { "artical" => "invalid value" }}, valid_session
  #       assigns(:blog).should eq(blog)
  #     end

  #     it "re-renders the 'edit' template" do
  #       blog = Blog.create! valid_attributes
  #       Blog.any_instance.stub(:save).and_return(false)
  #       put :update, {:id => blog.to_param, :blog => { "artical" => "invalid value" }}, valid_session
  #       response.should render_template("edit")
  #     end
  #   end
  # end

  # describe "DELETE destroy" do
  #   it "destroys the requested blog" do
  #     blog = Blog.create! valid_attributes
  #     expect {
  #       delete :destroy, {:id => blog.to_param}, valid_session
  #     }.to change(Blog, :count).by(-1)
  #   end

  #   it "redirects to the blogs list" do
  #     blog = Blog.create! valid_attributes
  #     delete :destroy, {:id => blog.to_param}, valid_session
  #     response.should redirect_to(blogs_url)
  #   end
  # end

end
