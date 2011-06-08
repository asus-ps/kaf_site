class GroupsController < ApplicationController
  def index
    @specialities = Speciality.all
    @disciplines = Discipline.all
  end

  def show
  end
end
