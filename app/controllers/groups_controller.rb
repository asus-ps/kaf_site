class GroupsController < ApplicationController
  def index
    @specialities = Speciality.all
  end

  def show
  end

end
