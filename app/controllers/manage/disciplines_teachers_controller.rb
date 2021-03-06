class Manage::DisciplinesTeachersController < Manage::BaseController
  def index
    @dts= DisciplinesTeacher.search(params[:search],params[:page])
    @newdt = DisciplinesTeacher.new
    @disciplines = Discipline.all(:order => 'name')
    @teachers = Teacher.all( :include => :person )

    respond_to do |format|
      format.html
      format.xml { render :xml => @dts }
    end
  end

  def edit
    @dts= DisciplinesTeacher.all
    @newdt = DisciplinesTeacher.find(params[:id])
    @disciplines = Discipline.all
    @teachers = Teacher.all( :include => :person )

    respond_to do |format|
      format.html
      format.xml { render :xml => @newdt }
    end
  end

  def new
  end


  def create
    @disciplines_teacher = DisciplinesTeacher.new(params[:disciplines_teacher])
    @dts= DisciplinesTeacher.search(params[:search],params[:page])

    respond_to do |format|
      if @disciplines_teacher.save
        format.html { redirect_to(manage_disciplines_teachers_path, :notice => 'Связь была успешно добавлена') }
        format.xml  { render :xml => @disciplines_teacher, :status => :created, :location => @disciplines_teacher }
      else
        format.html { render :action => :index }
        format.xml  { render :xml => @disciplines_teacher.errors, :status => :unprocessable_entity }
      end
    end
  end


  def update
    @disciplines_teacher = DisciplinesTeacher.find(params[:id])
    @dts= DisciplinesTeacher.search(params[:search],params[:page])

    respond_to do |format|
      if @disciplines_teacher.update_attributes(params[:disciplines_teacher])
        format.html { redirect_to(manage_disciplines_teachers_path, :notice => 'Связь была успешно изменена') }
        format.xml  { head :ok }
      else
        format.html { render :action => :edit }
        format.xml  { render :xml => @disciplines_teacher.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @dt = DisciplinesTeacher.find(params[:id])
    @dt.destroy

    respond_to do |format|
      format.html { redirect_to(manage_disciplines_teachers_url) }
      format.xml  { head :ok }
    end
  end
end
