class Manage::PositionsController < Manage::BaseController
  def index
    @positions = Position.all
    @newposition = Position.new
    respond_to do |format|
      format.html
      format.xml { render :xml => @position }
    end
  end

  def new
  end

  def edit
    @positions = Position.all
    @newposition = Position.find(params[:id])
    respond_to do |format|
      format.html
      format.xml { render :xml => @position }
    end
  end


  def create
    @position = Position.new(params[:position])

    respond_to do |format|
      if @position.save
        format.html { redirect_to(manage_positions_path, :notice => 'Учёная степень была успешно создана') }
        format.xml  { render :xml => @position, :status => :created, :location => @position }
      else
        format.html { render :action => "index" }
        format.xml  { render :xml => @position.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @position = Position.find(params[:id])

    respond_to do |format|
      if @position.update_attributes(params[:position])
        format.html { redirect_to(manage_positions_path, :notice => 'Учёная степень была успешно изменена') }
        format.xml  { head :ok }
      else
        format.html { render :action => "index" }
        format.xml  { render :xml => @position.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @position = Position.find(params[:id])
    @position.destroy

    respond_to do |format|
      format.html { redirect_to(manage_positions_url) }
      format.xml  { head :ok }
    end
  end

end
