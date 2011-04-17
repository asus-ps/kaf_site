class TeachersController < ApplicationController
  def index
    @teachers = Teacher.all(:include => :person, :include => :speciality, :include => :position, :include => :degree)
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
    @teacher.person.update_attributes(params[:teacher])
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
    @teacher.save ? redirect_to(teacher_path(@teacher)) : render(:action => "new")
  end

  def update
    @teacher = Teacher.find(params[:id])
    @teacher.update_attributes(params[:teacher]) ? redirect_to(teacher_path(@teacher)) : render(:action => :edit)
  end

  def destroy
    @teacher = Teacher.find(params[:id])
    @teacher.destroy

    respond_to do |format|
      format.html { redirect_to(teachers_url) }
      format.xml  { head :ok }
    end
  end
end
