class StudentsController < ApplicationController
  def index
    @students = Student.all(:include => [:person, :speciality], :order => 'people.last_name')
  end

  def show
    @students = Student.all(:include => [:person, :speciality], :order => 'people.last_name')
    @student = Student.find(params[:id],:include => [:person, :speciality])
  end

end
