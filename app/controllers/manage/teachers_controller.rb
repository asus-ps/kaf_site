class Manage::TeachersController < Manage::BaseController
  def index
    @teachers = Teacher.search(params[:search],params[:page])
    respond_to do |format|
      format.html
      format.xml { render_to :xml => @teachers }
    end
  end

  def new
    @teacher = Teacher.new
    @teacher.build_person
    @degrees = Degree.all
    @positions = Position.all
    respond_to do |format|
      format.html
      format.xml { render_to :xml => @teacher }
    end
  end

  def edit
    @teacher = Teacher.find(params[:id])
    @degrees = Degree.all
    @positions = Position.all
    respond_to do |format|
      format.html
      format.xml { render_to :xml => @teacher }
    end
  end

  def show
    @teacher = Teacher.find(params[:id], :include => :person, :include => :speciality, :include => :position, :include => :degree)
    respond_to do |format|
      format.html
      format.xml { render_to :xml => @teacher }
    end
  end

  def create
    @teacher = Teacher.new(params[:teacher])
    @teacher.person.nature = 't'
    @degrees = Degree.all
    @positions = Position.all
    respond_to do |format|
      if @teacher.save
        format.html { redirect_to(manage_teacher_path(@teacher), :notice => 'Сведения о преподавателе были успешно добавлены') }
        format.xml  { render :xml => @teacher, :status => :created, :location => @teacher }
      else
        format.html { render :action => :new }
        format.xml  { render :xml => @teacher.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @teacher = Teacher.find(params[:id])
    @teacher.person.nature = 't'
    @degrees = Degree.all
    @positions = Position.all
    respond_to do |format|
      if @teacher.update_attributes(params[:teacher])
        format.html { redirect_to(manage_teacher_path(@teacher)) }
        format.xml  { render :xml => @teacher, :status => :created, :location => @teacher }
      else
        format.html { render :action => :edit }
        format.xml  { render :xml => @teacher.errors, :status => :unprocessable_entity }
      end
    end

   # @teacher.update_attributes(params[:teacher]) ? redirect_to(manage_teacher_path(@teacher)) : render(:action => :edit)
  end

  def destroy
    @teacher = Teacher.find(params[:id])
    @teacher.destroy

    respond_to do |format|
      format.html { redirect_to(manage_teachers_url) }
      format.xml  { head :ok }
    end
  end
end
