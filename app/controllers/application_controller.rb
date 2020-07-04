class ApplicationController < ActionController::API
  include JsonResponse

  before_action :authenticate_and_set_user
end
