class TeachersController < ApplicationController
  def index
    @teachers = Teacher.all(:include => [:person, :degree, :position], :order => 'people.last_name')
    @disciplines = Discipline.all(:order => 'name')
  end

  def show
    @teacher = Teacher.find(params[:id],:include => [:person, :degree, :position])
    @teachers = Teacher.all(:include => [:person, :degree, :position], :order => 'people.last_name')
    @disc = DisciplinesTeacher.all(:include => [:teacher,:discipline], :conditions => ['teacher_id = ?', params[:id]])
  end

end
