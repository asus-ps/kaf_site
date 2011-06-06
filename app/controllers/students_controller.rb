class StudentsController < ApplicationController
  def index
    @students = Student.all(:include => [:person, :speciality], :conditions => ['speciality_id = :q AND year_income = :t',{:q => speciality_id, :t => year_income}])
  end

  def show
    @students = Student.all(:include => [:person, :speciality], :order => 'people.last_name')
    @student = Student.find(params[:id],:include => [:person, :speciality])
  end

end
