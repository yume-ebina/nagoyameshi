class AdminsController < ApplicationController
  def aggregate
    #無料ユーザー
    @free_users = User.where(premium_end_date: nil).count

    #プレミアムユーザー
    @premium_users = User.where.not(premium_end_date: nil).count

    #有効なプレミアムユーザー
    @effective_premium_user = User.where(premium_end_date: Time.now...).count
  end
end
