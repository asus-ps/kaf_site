class PeopleController < ApplicationController
  def index
  end

    def create
    @person = Person.new(params[:person])

    respond_to do |format|
      if @person.save
        #flash[:notice] = 'Студент успешно занесён в базу'
        format.html { redirect_to(students_path, :notice => 'Информация о студенте успешно добавлен!') }
        format.xml  { render :xml => @person, :status => :created, :location => @person }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @person.errors, :status => :unprocessable_entity }
      end
    end
  end
end
