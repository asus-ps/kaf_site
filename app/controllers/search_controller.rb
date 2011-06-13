class SearchController < ApplicationController
  def index
    @students = Student.all(:include => [:person, :speciality],
               :conditions => ['people.first_name LIKE :q OR people.last_name LIKE :q OR people.patronymic_name LIKE :q OR people.phone LIKE :q OR people.email LIKE :q OR specialities.name LIKE :q OR year_income=:t',{:q => "%#{params[:search]}%",:t => "#{params[:search]}"}], :order => 'people.last_name')
    @teachers = Teacher.all(:include => [:person, :degree, :position],
               :conditions => ['people.first_name LIKE :q OR people.last_name LIKE :q OR people.patronymic_name LIKE :q OR people.phone LIKE :q OR people.email LIKE :q OR degrees.name LIKE :q OR positions.name LIKE :q ',{:q => "%#{params[:search]}%"}], :order => 'people.last_name')
    @articles = Article.all(:conditions => ['title LIKE :q OR body LIKE :q OR priority=:t',{:q => "%#{params[:search]}%",:t => "#{params[:search]}"}],:order => :created_at)
  end

end
