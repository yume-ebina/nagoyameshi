class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin?
      can :access, :rails_admin
      can :manage, :all

    # プレミアムユーザーは管理者画面の閲覧のみ不可能
    elsif user.premium_end_date.present? && user.premium_end_date > Time.zone.today
      can :manage, :all
      cannot :access, :rails_admin
      cannot :aggregate, AdminsController

    # 一般ユーザーはCRUD操作を制限し、管理者画面は閲覧不可能
    else
      can :read, :all
      cannot :aggregate, AdminsController
    end
  end
end
