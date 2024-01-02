# README

1. Embedded Ruby Links
    ```ruby
        eg: <%= link_to "About Me", home_about_path %>
        #where home_about = prefix gave after you run the command "rails routes (for newer versions) or rake routes (for version below 6.0)
    ```

2. Partials (Imports)
    ```ruby
        #partials should start with "underscore" eg: _navbar.html.erb
    ```

3. Added CSS Framework | Bootstrap 5
    - refer to the link for the guide: https://www.rubydoc.info/gems/bootstrap/5.3.2

4. Added new gem - devise
    - refer to the link for the installation: https://github.com/heartcombo/devise
    - Note: you should generate the views (<small><b>``` rails generate devise:views ```</b></small>) to customize the design or some info on the authentications.

5. Getting current URL by prefix (can't be done) - as other way around I tried adding application helper functions and use the exact url path
```ruby
# app/helpers/application_helper.rb

    #added new function/method
    def page_without_navbar 
        routes = ['/users/sign_in', '/users/sign_up']
        return !(routes.include?request.path)
    end

```

6. Added new custom css file for some additional customization.
```ruby
    #1 Add the custom.scss or custom.css file inside the assets/stylesheets/ folder
    
    #2 add the code below inside the config/initializers/assets.rb file.
    Rails.application.config.assets.precompile += %w( custom.css )
```

7. Errors Encountered and Fixes
    - ActiveRecord::RecordNotUnique: RuntimeError: UNIQUE constraint failed:
        - to fix the issue, remove the or comment out the data from test/fixtures/users.yml which trigger the error since it doesn't provide any valid data which is used for the testing.
        ```ruby
            #one: {}
            # column: value

            #
            #two: {}
            # column: value
        ```

8. Added Dynamic Elements depending on the current route looking for specific substring.
    ```ruby
        # Way 1 - use the request.path and include helper function/method to check if the current route contains the specific substring.
        request.path.include?"/edit"

        # Way 2 - You can use the current_page helper where you supply the specific controller and method used.
        # For some instances, this code below doesn't work with conditional if false.
        current_page?(controller: 'suppliers', action: 'edit')
    ```