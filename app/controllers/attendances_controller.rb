class AttendancesController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index; end

  def new; end

  def create; end
end
