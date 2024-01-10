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

        # Way 3 - since there are other pages for suppliers for example like new, edit and show. the link does not get highlighted so you can use
        # the controller_name so that all actions or pages under that controller will highlight the side bar
        controller_name === 'suppliers'

    ```


9. Diving deep to the Active Record Associate or creation of relationship between models/tables.
    ```ruby

        # a "supplier" belongs to a user who created him/her. instead of user_id we created created_by field.
        # you can use the "created_by_user" to access the data from user model.
        belongs_to :created_by_user, class_name: 'User', foreign_key: 'created_by', optional: true

        # sample usage:
        @supplier.created_by_user.email

        #output
        #jnbrnplbr@gmail.com

    ```

10. Update the error message throw per field. 
    ```ruby
    # on  models/supplier.rb
    # name is the field to modify the error message whenever triggered.
    validates :name, presence: { message: 'Supplier name is required.' }

    # Change error.full_message to error.message
    <%= form_with(model: supplier) do |form| %>
        <% if supplier.errors.any? %>
            <div class="mt-5">
                <% supplier.errors.each do |error| %>
                    <div class="alert alert-warning alert-dismissible fade show font-monospace text-start" role="alert">
                        #from <%= error.full_message %> 
                        <%= error.message %>
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                <% end %>
            </div>
        <% end %>
    <% end %>
    ```

11. Use rails command line. Some of the useful command.
    ```ruby 
        Model.column_names # shows the column names
        Model.all # shows all the data
    ```

12. Fully recreate the schema
    ```ruby
        # 1. Drop the database
        rails db:drop

        # 2. Recreate it
        rails db:create

        # 3. Migrate the tablesS
        rails db:migrate

        #Note: This is only applicable for a development who still starting and use's dummy data. Doing this will wipe all the data on the existing database.

    ```

13. When ddding new column to an existing table make sure to add the new field on the permitted fields on the controller. 

    ```ruby
    # eg. controllers/suppliers_controller.rb
    
    # added the new fields such as :email, :point_person, :contact_number
    def supplier_params
      params.require(:supplier).permit(:name, :email, :point_person, :contact_number, :created_by)
    end
    
    ```

14. For select tag form. You can use the select_tag 
```html
    # Make sure to return the all suppliers.
    <div class="form-floating mb-3">
        <%= select_tag "supplier", options_from_collection_for_select(@suppliers, "id","name"),class: "form-control" %>
        <%= form.label :supplier, for: "floatingInput", class: "font-monospace" %>
    </div>
```

15. Currency format method helper
```ruby
    # by default it uses the dollar sign as money sign.
    number_to_currency(fund.amount, :unit=>"₱")
```

