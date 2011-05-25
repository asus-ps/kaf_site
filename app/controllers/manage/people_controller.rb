class Manage::PeopleController < Manage::BaseController
  def index
    @people = Person.search(params[:search])
    respond_to do |format|
      format.html
      format.xml { render :xml => @people }
    end

  end

    def create
    @person = Person.new(params[:person])
    if @people.valid?
    respond_to do |format|
      if @person.save
        format.html { redirect_to(manage_students_path) }
        format.xml  { render :xml => @person, :status => :created, :location => @person }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @person.errors, :status => :unprocessable_entity }
      end
    end
    end
  end
end
