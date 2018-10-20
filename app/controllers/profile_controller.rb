class ProfileController < ApplicationController

  def show
    @profile = policy_scope(Profile).find(params[:id])
    authorize @profile
  end
end
