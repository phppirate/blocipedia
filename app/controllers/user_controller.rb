class UserController < ApplicationController
  def show
    @user = current_user;

    @wikis = @user.wikis
    @private_wikis = []

    @wikis.each do |w|
      if w.private?
        @private_wikis << w
      end
    end
    @private_wikis
  end

end
