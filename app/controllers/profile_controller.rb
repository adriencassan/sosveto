class ProfileController < ApplicationController

  def show
    @profile = policy_scope(Profile).find(params[:id])
    authorize @profile
  end

  def update
    @profile = policy_scope(Profile).find(params[:id])
    authorize @profile
    @profile.update(profile_params)
    redirect_to profile_path @profile
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :adr_line1, :adr_line2, :adr_zip, :adr_city, :adr_country, :adr_map, :avatar, :avatar_cache, :role, :clinic, :admin)
  end
end
