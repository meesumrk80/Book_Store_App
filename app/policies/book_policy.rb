class BookPolicy < ApplicationPolicy
  def index?
    true # Everyone can view books
  end

  def show?
    true # Everyone can view a book
  end

  def create?
    user&.admin? # Only admins can create books
  end

  def edit?
    user&.admin? # Only admins can edit books
  end

  def update?
    user&.admin? # Only admins can update books
  end

  def destroy?
    user&.admin? # Only admins can delete books
  end
end
