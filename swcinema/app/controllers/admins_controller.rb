class AdminsController < ApplicationController
  before_action :set_admin, only: [:show, :change, :seat, :upseat, :edit, :update, :destroy]

  # GET /admins
  # GET /admins.json
  def index
    @admins = Admin.all
  end
  def home
    @admins = Admin.all
  end
  def seat

  end
  def change
    @tmp=params[:pays]
    
  end
  
  def upseat
    @tmp=params[:choices]
    @p = Admin.where(id: @tmp[0]).first 
    for i in 0..@tmp.size
      @admin = Admin.where(id: @tmp[i])
      @admin.update(status: "1")
    end
    respond_to do |format|

      if 1
        format.html { redirect_to admins_pay_url(@p.id,@tmp.size) }
        format.json { render :show, status: :ok, location: @admin }
      end
    end
  end
  # GET /admins/1
  # GET /admins/1.json
  def show
  end

  # GET /admins/new
  def new
    @admin = Admin.new
  end

  # GET /admins/1/edit
  def edit
  end

  # POST /admins
  # POST /admins.json
  def create
    @tmp = Admin.new(admin_params)
    for i in 1..35
      @admin = Admin.new(id_movie: @tmp.id_movie,name: @tmp.name,time: @tmp.time,duration: @tmp.duration,price: @tmp.price,id_seat: i,status:"0")
      @admin.save
    end
    respond_to do |format|
      if @admin.save
        format.html { redirect_to @admin, notice: 'Movie was successfully created.' }
        format.json { render :show, status: :created, location: @admin }
      else
        format.html { render :new }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admins/1
  # PATCH/PUT /admins/1.json
  def update
    @tmp = Admin.new(admin_params)
    @a=@tmp.id
    @b=@tmp.id_movie
    #Admin.where(id_movie: @tmp.id_movie).update_all ("name= @a,time= @b,duration= @c,price= @d")
    #@admin = Admin.where(id_movie: @tmp.id_movie).update_all ("name= '@tmp.name',time= '@tmp.time',duration= '@tmp.duration',price= '@tmp.price'")
    @admin = Admin.where(id_movie: @b).first
    @a=@admin.id
    @admin.update(id_movie: @tmp.id_movie,name: @tmp.name,time: @tmp.time,duration: @tmp.duration,price: @tmp.price)
    for i in 1..34
      @a=@a+1
      @admin = Admin.where(id: @a)
      @admin.update(id_movie: @tmp.id_movie,name: @tmp.name,time: @tmp.time,duration: @tmp.duration,price: @tmp.price)
    end

    respond_to do |format|

      if 1
      #if Admin.where(id_movie: @tmp.id_movie).update_all ("name= @a,time= @b,duration= @c,price= @d")
        format.html { redirect_to admins_url, notice: 'Movie was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin }
      else
        format.html { render :edit }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admins/1
  # DELETE /admins/1.json
  def destroy
    for i in 1..35
      @admin = Admin.find_by(id_movie: @admin.id_movie)
      @admin.destroy
    end
    respond_to do |format|
      format.html { redirect_to admins_url, notice: 'Admin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin
      @admin = Admin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_params
      params.require(:admin).permit( :id, :id_movie, :name, :time, :duration, :price, :id_seat, :status)
    end
end
