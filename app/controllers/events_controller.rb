class EventsController < ApplicationController
  before_action :authenticate_user
  before_action :ensure_correct_user, {only: [:edit, :update, :delete]}

  def index
    @event = Event.all.order("created_at DESC")
    @event.each do |event|
      str_start = event.startdate
      event.startdate = str_start[0,4]+"年"+str_start[5,2]+"月"+str_start[8,2]+"日"+str_start[11,2]+"時"+str_start[14,2]+"分"
      str_end = event.enddate
      event.enddate = str_end[0,4]+"年"+str_end[5,2]+"月"+str_end[8,2]+"日"+str_end[11,2]+"時"+str_end[14,2]+"分"
    end
  end
  def show
    @event = Event.find_by(id: params[:id])
  end
  def new
    @event = Event.new
  end
  def create
    @event = Event.new(startdate: params[:startdate], enddate: params[:enddate], name: params[:name], location: params[:location], memo: params[:memo], user_id: @current_user.id)
    if @event.save
      redirect_to("/events/index")
    else
      render("events/#{@event.id}/show")
    end
  end
  def edit
    @event = Event.find_by(id: params[:id])
  end
  def update
    @event = Event.find_by(id: params[:id])
    @event.startdate = params[:startdate]
    @event.enddate = params[:enddate]
    @event.name = params[:name]
    @event.location = params[:location]
    @event.memo = params[:memo]
    @event.save
    redirect_to("/events/#{@event.id}/show")
  end
  def delete
    @event = Event.find_by(id: params[:id])
    @event.destroy
    redirect_to("/events/index")
  end
  def ensure_correct_user
    if @event.user_id ==  @current_user.id
      flash[:notice] = "権限がありません！"
      redirect_to("events/index")
    end
  end
end
