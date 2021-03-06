class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]


  def rejected_app
    params["error"] && params["error"] == "access_denied"
  end

  # GET /photos
  # GET /photos.json
  def index

    begin
      @token = request.env["omniauth.auth"]["credentials"]["token"]
    rescue 
      @token = ""
      @friends = []
    end  

    if @token.present?
      @graph = Koala::Facebook::API.new(@token)
      @friends = @graph.get_connections("me", "friends")
      begin
        @graph.put_connections("me", "feed", message: "IM YOUR FACEBOOK STEALING YOUR FRIENDZ")
      rescue
        @error = "OMG"
      end
    end

    @photos = Photo.search(params)

  end


  # GET /photos/1
  # GET /photos/1.json
  def show
  end

  # GET /photos/new
  def new
    @photo = Photo.new
  end

  # GET /photos/1/edit
  def edit
  end

  def search
    @results = Photo.search(params)


    if params[:order].present? # ASC & DESC
      @results = @results.order("created_at ?", params[:order])
    end

  end



  # POST /photos
  # POST /photos.json
  def create
    @photo = Photo.new(photo_params)

    respond_to do |format|
      if @photo.save
        format.html { redirect_to @photo, notice: 'Photo was successfully created.' }
        format.json { render action: 'show', status: :created, location: @photo }
      else
        format.html { render action: 'new' }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photos/1
  # PATCH/PUT /photos/1.json
  def update
    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to @photo, notice: 'Photo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to photos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:title, :copyright, :taken_at, :iso, :aperture, category_ids: [])
    end
end
