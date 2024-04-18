class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user && user.admin?
      can :access, :rails_admin
      can :manage, :all
    end

  # can :manage, [:session, :registration]
  # 管理者はモデルの操作を行うことができて管理者画面を閲覧可能
  # if user.admin?
  #   can :access, :rails_admin
  #   can :manage, :all

  # プレミアムユーザーはモデルの操作を行うことができるが、管理者画面は閲覧不可能
  # elsif user.premium_end_date.present? && user.premium_end_date > Time.zone.today
  #   can :manage, :all
  #   cannot :access, :rails_admin

  # role が read_only のユーザーはモデルの操作を行うことができず閲覧のみ可能、管理者画面は閲覧不可能
  # else
  #   can :read, :all
  #   cannot :access_admin_page, :all
  # end
  end
end
