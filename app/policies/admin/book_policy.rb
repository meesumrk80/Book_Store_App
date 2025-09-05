module Admin
  class BookPolicy < ApplicationPolicy
    def index?    = user.admin?
    def show?     = user.admin?
    def create?   = user.admin?
    def new?      = create?
    def update?   = user.admin?
    def edit?     = update?
    def destroy?  = user.admin?

    class Scope < Scope
      def resolve
        user.admin? ? scope.all : scope.none
      end
    end
  end
end
