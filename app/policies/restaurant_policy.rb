class RestaurantPolicy < ApplicationPolicy
    def resolve
      # show all restaurants
      scope.all
    end

    def show?
      # everyone can access the show endpoint
      true
    end

    def update?
      # only restaurant owners can update it
      # record = current restaurant
      record.user == user
    end

    def create?
      #any logged in user can create a restaurant
      !user.nil?
    end

    def destroy?
      update?
    end
end
