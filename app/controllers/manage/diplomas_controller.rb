class Manage::DiplomasController < Manage::BaseController
  def index
    @diplomas = Diploma.search(params[:search],params[:page])

    respond_to do |format|
      format.html
      format.xml { render_to :xml => @diplomas }
    end
  end

  def edit
    @diploma = Diploma.find(params[:id])
    @students = Student.all(:include => :person)
    @teachers = Teacher.all(:include => :person)
    @people = Person.all

    respond_to do |format|
      format.html
      format.xml { render_to :xml => @diploma }
    end
  end

  def new
    @diploma = Diploma.new
    @students = Student.all(:include => :person)
    @teachers = Teacher.all(:include => :person)
    @people = Person.all

    respond_to do |format|
      format.html
      format.xml { render_to :xml => @diploma }
    end
  end

  def show
    @diploma = Diploma.find(params[:id], :include => [:teacher, :student])

    respond_to do |format|
      format.html
      format.xml { render_to :xml => @diploma }
    end
  end

  def create
    @diploma = Diploma.new(params[:diploma])

    respond_to do |format|
      if @diploma.save
        format.html { redirect_to(manage_diplomas_path, :notice => 'Сведения о дипломе были успешно добавлены') }
        format.xml  { render :xml => @diploma, :status => :created, :location => @diploma }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @diploma.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @diploma = Diploma.find(params[:id])
    @diploma.update_attributes(params[:diploma]) ? redirect_to(manage_diploma_path(@diploma)) : render(:action => :edit)
  end


  def destroy
    @diploma = Diploma.find(params[:id])
    @diploma.destroy

    respond_to do |format|
      format.html { redirect_to(manage_diplomas_url) }
      format.xml  { head :ok }
    end
  end
end
