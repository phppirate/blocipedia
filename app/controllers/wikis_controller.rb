class WikisController < ApplicationController
  # GET /wikis
  # GET /wikis.json

  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @wikis = Wiki.all
  end


  def user_wikis
    @wikis = current_user.wikis
  end

  def collaborations
    @wikis = current_user.collaborated_wikis
  end

  def create_collaborations
    @wiki = Wiki.find(10)

    @users = []
    params[:user].each do |u|
      @users << User.find(u)
    end
    @user
  end

  # GET /wikis/1
  # GET /wikis/1.json
  def show
    @wiki = Wiki.find(params[:id])
    if current_user == @wiki.user
      @user_wiki = true
    else
      @user_wiki = false
    end

    if @user_wiki
      @edit_button = true
    else
      @edit_button = false
    end


  end

  # GET /wikis/new
  # GET /wikis/new.json
  def new
    @wiki = Wiki.new
  end

  # GET /wikis/1/edit
  def edit
    @wiki = Wiki.find(params[:id])
  end

  # POST /wikis
  # POST /wikis.json
  def create
    @wiki = current_user.wikis.new(params[:wiki])

    if !@wiki.private || current_user.premium
      respond_to do |format|
        if @wiki.save
          format.html { redirect_to @wiki, notice: 'Wiki was successfully created.' }
          format.json { render json: @wiki, status: :created, location: @wiki }
        else
          format.html { render action: "new" }
          format.json { render json: @wiki.errors, status: :unprocessable_entity }
        end
      end

    else

      flash[:notice] = "You are not authorized to create private wikis."
      render 'new'

    end
  end

  def collaborators
    @wiki = Wiki.find(params[:id])
    @users = User.all
  end


  # wiki = Wiki.find(params[:wiki_id])
  # params[:users].each do { |id| User.find(id).wikis << wiki}
  #   wiki.save


  # PUT /wikis/1
  # PUT /wikis/1.json
  def update
    @wiki = Wiki.find(params[:id])

    respond_to do |format|
      if @wiki.update_attributes(params[:wiki])
        format.html { redirect_to @wiki, notice: 'Wiki was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @wiki.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wikis/1
  # DELETE /wikis/1.json
  def destroy
    @wiki = Wiki.find(params[:id])
    @wiki.destroy

    respond_to do |format|
      format.html { redirect_to wikis_url }
      format.json { head :no_content }
    end
  end
end
