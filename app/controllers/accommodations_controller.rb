class AccommodationsController < ApplicationController
    before_action :set_accommodation, only: [:edit, :update, :destroy, :show]
  
    def new
      @accommodation = Accommodation.new
      @accommodation.current_step = session[:accommodation_step] || 'details'
    end
  
    def create
      @accommodation = Accommodation.new(accommodation_params)
      #@accommodation = Accommodation.new
      @accommodation.current_step = params[:accommodation][:current_step]

        if params[:previous_button]
         @accommodation.previous_step
        elsif @accommodation.next_step
          render 'new' #1
        elsif @accommodation.valid? && @accommodation.next_step
          session[:accommodation_step] = @accommodation.current_step
          #render 'new'
        #elsif params[:accommodation][:availability]
          #availability = Date.new(
         #   params[:accommodation]["availability(1i)"].to_i,
           # params[:accommodation]["availability(2i)"].to_i,
           # params[:accommodation]["availability(3i)"].to_i
          #)
           # @accommodation.availability = availability
        #else
        if @accommodation.last_step?
          @accommodation.save
          session[:accommodation_step] = nil
          redirect_to anfitriao_dashboard_path, notice: 'Acomodação criada com sucesso!'
          #@accommodation.save
          #session[:accommodation_step] = nil
          #redirect_to anfitriao_dashboard_path, notice: 'Acomodação criada com sucesso!'
          #render 'new'
        #end
          else
             render 'new'
          end  
        else 
          render 'new' 
        end
      end

    def index
      @accommodations = Accommodation.all
    end

    def show
      @accommodation = Accommodation.find(params[:id])
    #rescue ActiveRecord::RecordNotFound
     # redirect_to anfitriao_dashboard_path
    end
  
    private
  
    def set_accommodation
      @accommodation = Accommodation.find(params[:id])
    end
  
    def accommodation_params
      params.require(:accommodation).permit(
        :title, 
        :description, 
        :accommodation_type, 
        :vacancies, 
        :address, 
        :city, 
        :state, 
        :postal_code, 
        { amenities: [] }, 
        { photos: [] }, 
        :min_stay, 
        :max_stay, 
        { available_dates: [] },
        :volunteer_preferences, 
        :work_schedule, 
        :tasks_description, 
        :current_step
      )
    end
    
end
