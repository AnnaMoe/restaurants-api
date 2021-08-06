class RestaurantPolicy < ApplicationPolicy
    def resolve
      # show all restaurants
      scope.all
    end

    def show?
      # everyone can access the show endpoint
      true
    end
end
