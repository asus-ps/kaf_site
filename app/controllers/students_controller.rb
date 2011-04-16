class StudentsController < ApplicationController
  def index
    @students = Student.all(:include => :person)
    respond_to do |format|
      format.html
      format.xml { render_to :xml => @students }
    end
  end

  def new
    @student = Student.new
    @student.build_person
    respond_to do |format|
      format.html
      format.xml { render_to :xml => @student }
    end
  end

  def edit
  end

  def show
  end

  def create
    @student = Student.new(params[:student])
    @student.person_id = (params[:person])

    respond_to do |format|
      if @student.save
        #flash[:notice] = 'Студент успешно занесён в базу'
        format.html { redirect_to(@student, :notice => 'Информация о студенте успешно добавлен!') }
        format.xml  { render :xml => @student, :status => :created, :location => @student }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @student.errors, :status => :unprocessable_entity }
      end
    end
  end

end
