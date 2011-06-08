class TeachersController < ApplicationController
  def index
    @teachers = Teacher.all(:include => [:person, :degree, :position], :order => 'people.last_name')
  end

  def show
    @teacher = Teacher.find(params[:id],:include => [:person, :degree, :position])
    @teachers = Teacher.all(:include => [:person, :degree, :position], :order => 'people.last_name')
  end

end
