class DisciplinesTeachersController < ApplicationController
  def index
    @dts= DisciplinesTeacher.all
    @newdt = DisciplinesTeacher.new
    @disciplines = Discipline.all
    @teachers = Teacher.all( :include => :person )
    respond_to do |format|
      format.html
      format.xml { render :xml => @dts }
    end
  end

  def edit
    @dts= DisciplinesTeacher.all
    @dt = DisciplinesTeacher.find(params[:id])
    @disciplines = Discipline.all
    @teachers = Teacher.all( :include => :person )
    respond_to do |format|
      format.html
      format.xml { render :xml => @dt }
    end
  end

  def new
  end


  def create
    @disciplines_teacher = DisciplinesTeacher.new(params[:disciplines_teacher])

    respond_to do |format|
      if @disciplines_teacher.save
        format.html { redirect_to(disciplines_teachers_path, :notice => 'Учёная степень была успешно создана') }
        format.xml  { render :xml => @disciplines_teacher, :status => :created, :location => @disciplines_teacher }
      else
        format.html { render :action => "index" }
        format.xml  { render :xml => @disciplines_teacher.errors, :status => :unprocessable_entity }
      end
    end
  end


  def update
    @dt = DisciplinesTeacher.find(params[:id])

    respond_to do |format|
      if @dt.update_attributes(params[:dt])
        format.html { redirect_to(disciplines_teachers_path, :notice => 'URL was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "index" }
        format.xml  { render :xml => @dt.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @dt = DisciplinesTeacher.find(params[:id])
    @dt.destroy

    respond_to do |format|
      format.html { redirect_to(disciplines_teachers_url) }
      format.xml  { head :ok }
    end
  end
end
