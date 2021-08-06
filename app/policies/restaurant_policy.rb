class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # show all restaurants
      scope.all
    end
  end
end
