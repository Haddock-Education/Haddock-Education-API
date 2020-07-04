class DocumentationsController < ApplicationController
  skip_before_action :authenticate_and_set_user, expect: :show

  def show

  end
end
