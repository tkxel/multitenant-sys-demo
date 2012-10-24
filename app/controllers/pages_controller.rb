class PagesController < ApplicationController
  before_filter :authenticate_user!

  def show
    @content = Page.all.first.content
  end

  def new
    @page = Page.new

       respond_to do |format|
         format.html # new.html.erb
         format.json { render json: @page }
       end
  end

  def create
    @page = Page.new(params[:page])

       respond_to do |format|
         if @page.save
           format.html { redirect_to @page, notice: 'Page was successfully created.' }
           format.json { render json: @page, status: :created, location: @page }
         else
           format.html { render action: "new" }
           format.json { render json: @page.errors, status: :unprocessable_entity }
         end
       end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])

       respond_to do |format|
         if @page.update_attributes(params[:page])
           format.html { redirect_to @page, notice: 'Page was successfully created.' }
           format.json { render json: @page, status: :created, location: @page }
         else
           format.html { render action: "new" }
           format.json { render json: @page.errors, status: :unprocessable_entity }
         end
       end
  end
end
