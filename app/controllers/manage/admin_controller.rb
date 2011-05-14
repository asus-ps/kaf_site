class Manage::AdminController < Manage::BaseController
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @admin }
    end
  end

  def uploadFile
    post = Admin.save(params[:upload])
    render :text => "File has been uploaded successfully"
  end

end
