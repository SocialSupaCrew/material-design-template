class UserMailsController < ApplicationController
  respond_to :json

  def create
    record = UserMail.new(params[:user])
    return render nothing: true if record.save
    render json: {errors: record.errors.full_messages}, status: 422
  end


  def show
    record = UserMail.find_by_email(params[:email])
    return render json: {error: 'Not found'}, statut: 404 if record.nil?
    render json: record
  end

  def update
    record = UserMail.find_by_email(params[:email])
    return render json: {error: 'Not found'}, statut: 404 if record.nil?
    record.update_attributes(user_mail_params)
  end

  def destroy
    record = UserMail.find_by_id(params[:id])
    return render json: {error: 'Not Found'}, status: 404 if record.nil?
  end

  def options
    render json: true
  end

  
  private

  def user_mail_params
    params.require(:user).permit(:newsletter, :firstname, :lastname, :present)
  end

end
