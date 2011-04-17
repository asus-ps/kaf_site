class DiplomasController < ApplicationController
  def index
    @diplomas = Diploma.all(:include => :student, :include => :teacher, :include => :person)
    respond_to do |format|
      format.html
      format.xml { render_to :xml => @diplomas }
    end
  end

  def edit

  end

  def new
    @diploma = Diploma.new
    @students = Student.all(:include => :person)
    @teachers = Teacher.all(:include => :person)
    respond_to do |format|
      format.html
      format.xml { render_to :xml => @diploma }
    end
  end

  def show
  end

end
