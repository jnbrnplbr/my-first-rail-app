module ApplicationHelper
    def page_without_navbar 
        routes = ['/users/sign_in', '/users/sign_up']
        return !(routes.include?request.path)
    end
end
