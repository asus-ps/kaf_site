class Manage::StudentsController < Manage::BaseController
  def index
    @students = Student.search(params[:search])
    respond_to do |format|
      format.html
      format.xml { render_to :xml => @students }
    end
  end

  def new
    @student = Student.new
    @student.build_person
    @specialities = Speciality.all
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
    
    respond_to do |format|
      if @student.save
        format.html { redirect_to(manage_student_path(@student), :notice => 'Сведения о студенте были успешно добавлены') }
        format.xml  { render :xml => @student, :status => :created, :location => @student }
      else
        
        format.html { redirect_to( new_manage_student_path,:notice => 'Сведения о студенте не были добавлены. Ошибка в данных') }
        format.xml  { render :xml => @student.errors, :status => :unprocessable_entity, :notice => 'Сведения о студенте не были добавлены' }
      end
    end
   end
#if @student.save
#  redirect_to(manage_student_path(@student))
#end
#if ((@student.valid?)&&(@student.person.valid?))
#    @student.save ? redirect_to(manage_student_path(@student)) : render(:action => "new")
#end


  def update
    @student = Student.find(params[:id])
    @student.person.nature = 's'
    respond_to do |format|
      if @student.update_attributes(params[:student])
        format.html { redirect_to(manage_student_path(@student))}
        format.xml { render :xml => @student, :status => :created, :location => @student }
      else
        format.html { redirect_to( edit_manage_student_path(@student),:notice => 'Сведения о студенте не были изменены. Ошибка в данных') }
        format.xml  { render :xml => @student.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy

    respond_to do |format|
      format.html { redirect_to(manage_students_url) }
      format.xml  { head :ok }
    end
  end

end
