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


  # GET /wikis/1
  # GET /wikis/1.json
  def show
    @wiki = Wiki.find(params[:id])
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

    respond_to do |format|
      if @wiki.save
        format.html { redirect_to @wiki, notice: 'Wiki was successfully created.' }
        format.json { render json: @wiki, status: :created, location: @wiki }
      else
        format.html { render action: "new" }
        format.json { render json: @wiki.errors, status: :unprocessable_entity }
      end
    end
  end

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