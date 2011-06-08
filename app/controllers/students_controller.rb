class StudentsController < ApplicationController
  def index
    @students = Student.all(:include => [:person, :speciality], :conditions => ['speciality_id = ? AND year_income = ?',params[:speciality_id], params[:year_income]])
  end

  def show
    @students = Student.all(:include => [:person, :speciality], :order => 'people.last_name')
    @student = Student.find(params[:id],:include => [:person, :speciality])
  end

end
