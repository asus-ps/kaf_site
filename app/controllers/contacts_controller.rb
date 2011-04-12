class ContactsController < ApplicationController
  def index
    if Contact.exists?
      @contact = Contact.find(1)
      respond_to do |format|
        format.html
        format.xml { render :xml => @contact }
      end
    else
      respond_to do |format|
        format.html { redirect_to(new_contact_path) }
        format.xml { head :ok }
      end
    end
  end

  def edit
    if Contact.exists?
      @contact = Contact.find(1)
    else
      respond_to do |format|
        format.html {redirect_to(new_contact_path) }
        format.xml {head :ok}
      end
    end
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])

    respond_to do |format|
      if @contact.save
        format.html { redirect_to(contacts_path, :notice => 'Contacts was successfully created.') }
        format.xml  { render :xml => @contact, :status => :created, :location => @contact }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @contact.errors, :status => :unprocessable_entity }
      end
    end

  end

  def update
    @contact = Contact.find(1)

    respond_to do |format|
      if @contact.update_attributes(params[:contact])
        format.html { redirect_to(contacts_path, :notice => 'Contacts was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @contact.errors, :status => :unprocessable_entity }
      end
    end
  end

end