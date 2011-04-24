class Manage::StudentsController < Manage::BaseController
  def index
    @students = Student.all(:include => :person, :include => :speciality)
    respond_to do |format|
      format.html
      format.xml { render_to :xml => @students }
    end
  end

  def new
    @manage_student = Student.new
    @manage_student.build_person
    @manage_specialities = Speciality.all
    respond_to do |format|
      format.html
      format.xml { render_to :xml => @student }
    end
  end

  def edit
    @student = Student.find(params[:id])
    @student.person.update_attributes(params[:student])
    @specialities = Speciality.all
    respond_to do |format|
      format.html
      format.xml { render_to :xml => @student }
    end
  end

  def show
    @student = Student.find(params[:id],:include => :person, :include => :speciality)
    respond_to do |format|
      format.html
      format.xml { render_to :xml => @student }
    end
  end

  def create
    @student = Student.new(params[:student])
    @student.person.nature = 's'
    @student.save ? redirect_to(student_path(@student)) : render(:action => "new")  
  end

  def update
    @student = Student.find(params[:id])
    @student.person.nature = 's'
    @student.update_attributes(params[:student]) ? redirect_to(student_path(@student)) : render(:action => :edit)
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy

    respond_to do |format|
      format.html { redirect_to(students_url) }
      format.xml  { head :ok }
    end
  end

end
