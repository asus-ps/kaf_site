class StudentsController < ApplicationController
  def index
    @students = Student.all(:include => [:person, :speciality, :diploma], :order => 'people.last_name')
    @student = Student.find(params[:id],:include => [:person, :speciality, :diploma])
  end

  def show
    @students = Student.all(:include => [:person, :speciality, :diploma], :order => 'people.last_name')
    @student = Student.find(params[:id],:include => [:person, :speciality, :diploma])
  end

end
