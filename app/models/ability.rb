# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Article, public: true

    return unless user.present?

    can :read, Article
    can :manage, :all if user.admin?
  end
end
