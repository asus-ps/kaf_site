class Manage::DisciplinesController < Manage::BaseController
  #paginate :disciplines, :per_page => 3

  def index
    
    @disciplines = Discipline.search(params[:search],params[:page])
    #@discipline_pages,@disciplines = paginate(:discipline,:order => 'name')
    @discipline = Discipline.new
    respond_to do |format|
      format.html
      format.xml { render :xml => @discipline }
    end
  end

  def new
  end

  def edit
    @disciplines = Discipline.all
    @discipline = Discipline.find(params[:id])
    respond_to do |format|
      format.html
      format.xml { render :xml => @discipline }
    end
  end


  def create
    @discipline = Discipline.new(params[:discipline])
    @disciplines = Discipline.search(params[:search],params[:page])
    respond_to do |format|
      if @discipline.save
        format.html { redirect_to(manage_disciplines_path, :notice => 'Дисциплина была успешно создана') }
        format.xml  { render :xml => @discipline, :status => :created, :location => @discipline }
      else
        format.html { render :action => :index }
        #format.html { redirect_to(manage_disciplines_path, :notice => 'Дисциплина не была создана') }
        format.xml  { render :xml => @discipline.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @discipline = Discipline.find(params[:id])
    @disciplines = Discipline.search(params[:search],params[:page])
    respond_to do |format|
      if @discipline.update_attributes(params[:discipline])
        format.html { redirect_to(manage_disciplines_path, :notice => 'Дисциплина была успешно изменена') }
        format.xml  { head :ok }
      else
        format.html { render :action => :edit }
        #format.html { redirect_to(edit_manage_discipline_path(@discipline), :notice => 'Дисциплина не была изменена') }
        format.xml  { render :xml => @discipline.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @discipline = Discipline.find(params[:id])
    @discipline.destroy

    respond_to do |format|
      format.html { redirect_to(manage_disciplines_url) }
      format.xml  { head :ok }
    end
  end
end
