class Ability
  include CanCan::Ability

  # user ||= User.new
  # # 管理者はモデルの操作を行うことができて管理者画面を閲覧可能
  # if user && user.admin?
  #   can :access, :rails_admin
  #   can :manage, :all

  # # プレミアムユーザーはモデルの操作を行うことができるが、管理者画面は閲覧不可能
  # elsif user && user.where(premium_end_date: Time.current...)
  #   can :manage, :all
  #   cannot :access, :rails_admin

  # # role が read_only のユーザーはモデルの操作を行うことができず閲覧のみ可能、管理者画面は閲覧不可能
  # else
  #   can :read, :all
  #   cannot :access_admin_page, :all
  # end

  def initialize(user)
    if user && user.admin?
      can :access, :rails_admin
      can :manage, :all
    end

  #   if user && User.where(premium_end_date: Time.current...)
  #     can :manage, :Like
  #     can :manage, :Reservation
  #     can :manage, :Review
  #   end
  end
end
