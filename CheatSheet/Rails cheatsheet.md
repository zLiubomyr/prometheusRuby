# Ruby on Rails

## Rails CLI

```ruby
# Create a new rails app
$ rails new project_name 

# Start the Rails server
$ rails s

# Rails console
$ rails c

# Install dependencies
$ bundle install

# View all routes
$ rails routes

# Toggle rails caching
$ rails dev:cache
```



## Rails generators CLI

```ruby
# CRUD Scaffold (model, migrations, controller, views, test)
rails g scaffold Product name:string price:decimal

# CRUD Scaffold with one to many relationship field
rails g scaffold Invoice customer:references

# Delete scaffold created files
rails destroy scaffold Product

# Controller (name, action1, action2, ...)
$ rails g controller Products index show

# Model, migration and table columns
$ rails g model Product name:string active:boolean
```



## Migration

```ruby
# Create new table migration
rails g migration Invoices

# Update existing table migration
rails g migration add_comment_to_invoices comment:text

# Run migration
$ rails db:migrate

# Rollback last migration
$ rails db:rollback

# Run database seed code
$ rails db:seed

# Delete and re-create db and run migrations
$ rails db:reset

# Create table migration exemple
create_table :products do |t|
  t.string :name
  t.decimal :price, precision: 8, scale: 2
  t.timestamps
end

# Create table with foreign key
create_table :invoices do |t|
  # null: false = dont allow null value in this db field
  t.references :customer, null: false, foreign_key: true
  t.timestamps
end

# Change table migration exemple
add_column :invoices, :comment, :text
```



## Routes

```ruby
# Route maps to controller#action
get 'welcome', to: 'pages#home'

# Root page (root_path name helper)
root 'pages#home' 

# Named route 
get 'exit', to: 'sessions#destroy', as: :logout

# Create all the routes for a RESTful resource
resources :items

# HTTP    Verb Path    Controller#Action  Named Helper
# GET     /items           items#index    items_path
# GET     /items/new       items#new      new_item_path
# POST    /items           items#create   items_path
# GET     /items/:id       items#show     item_path(:id)
# GET     /items/:id/edit  items#edit     edit_item_path(:id)
# PUT     /items/:id       items#update   item_path(:id)
# DELETE  /items/:id       items#destroy  item_path(:id)

# Only for certain actions
resources :items, only: :index

# Resource with exceptions 
resources :items, except: [:new, :create]

# Nested resources
resources :items do
  resources :reviews
end
# create 7 RESTful for items and reviews 
# :reviews will have /items/item:id prefixing each routes
# GET /items/:item_id/reviews  reviews#index  item_reviews_path 

# Dynamic segment: params['id']
get 'products/:id', to: 'products#show'
# Query String: url /products/1?user_id=2
# params will be {'id' 'user_id'}

# Namespace Admin::ArticleController
# and prefix '/admin'
namespace :admin do
  resources :articles
end

# only prefix '/admin'
scope '/admin' do
  resources :articles, :comments
end

# Redirect
get '/stories', to: redirect('/articles')
```



## Model

```ruby
# Model validation
validates :title, :description, :image_url, presence: true
validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Must be a valid email address'}
validates :price, numericality: { greater_than_equal_to: 0.01 }
validates :title, uniqueness:  true
validates :title, length: { minimum: 3, maximum: 100 }
validates :type, inclusion: types.keys

# Model relationship
belongs_to :customer

# Relation with cascade delete
has_many :invoices, dependent: :destroy

#One to one
has_one :profile

# Hook methods 
before_destroy :ensure_not_reference_by_any_invoices 
before_save :downcase_email 

# create virtual password and password_confirmation 
# and bcrypt password_digest
# add method to model: user.authenticate(params[:password])
has_secure_password
```



## Controllers

```ruby
# Hook before running any code
before_action :set_post, only: [:show, :edit, :update, :destroy]

# If you use Devise (authentification)
before_action :authenticate_user!

# 7 Restfull action short exemple 
def index
  # Search input name :q
  if session[:q].present?
    params[:page] = 1
    # Create instance variable @
    @posts = Post.where "title like ?", "%" + session[:q] + "%"
  else
    @posts = Post.all
  end
  @posts = @posts.order("created_at DESC")
  # Pagination with will_paginate gem
  @posts = @posts.paginate(page: params[:page], per_page: 3)
  session[:q] = nil
end

# By convention all action (even empty one)
# run hook before_action and render view template
def show
end

def new
  @post = Post.new
end

def edit
end

def create
  @post = Post.new(post_params)
    if @post.save
      redirect_to @post, notice: 'Created successfully!'
    else
      render :new 
    end
end

def update
  if @post.update(post_params)
      redirect_to @post, notice: 'Updated successfully!'
    else
      render :edit 
    end
end

  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Delete successfully!' 
  end

private
  # Use callbacks to share common methods between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:title, :body, :image_url)
  end
end

# render text
render plain: 'Hello User'
```



## Active Record

```ruby
# Active record common methods
Article.all
# Throw error if not found
Article.find(params[:id])
# Do not throw error if not found
Article.find_by(product_id: product_id)
@category = Category.find_by!(slug: params['slug']) # Return Not Found Error (404 page in production)
Article.group(:product_id).sum(:quantity)
Article.where('quantity > 1')
Article.where(cat_id: cat_id, model: model)
Article.where(model: model).or(Article.where(cat_id: cat_id))
Article.join(:categories).where(categories: { id: 2 } )
Article.where("title LIKE ?", "%" + params[:q] + "%")
Article.count
Article.first
Article.last
Article.column_names # ['id', 'name', 'price']
Category.delete_all # delete all rows in Category table
product.category = Category.all.sample # random for Faker data
@products = Product.offset(5).limit(10).all # skip 5, take 10
```



## Template

```ruby
<%# Comment tag %>

<%# Output return expression tag %>
<%= @user.name %>

<%# No output return expression tag %>
<% if @user.name == 'Mike' %>

<%# Layout file : app/view/layouts/application.html.erb %>

<%# In layout file replace expression with page content %>
<%= yield %>

<%# View for the route name helper path %>
<%= link_to 'About', about_path, class: 'nav-link' %>

<%# View for the route name helper path with params %>
<%= link_to 'Item record', item_path(@item) %>

<%# auto object to route map (/products/:id) %>
<%= link_to 'Show', @product %>

<%# Delete link %>
<%= link_to 'Destroy', product, method: :delete, data: { confirm: 'Are you sure?' } %>

<%# Post link %>
<%= button_to 'Add to Cart', line_items_path(product_id: product) %>

# link_to with slot
<%= link_to category_path do %>
  <%= @product.category.name %>
<% end %>

<%# Button form %>
<%= button_to 'Logout', logout_path, method: :delete %>

<%# Image asset (app/assets/images) %>
<%= image_tag "rails.png" %>

<%# Format currency %>
<%= number_to_currency(product.price) %>

<%# Safe Html render %>
<%= sanitize(product.description) %>

<%# Enable caching %>
<%= cache @products do %>

<%# Check url %>
<%= request.path.include?('post') ? 'active' : '' %>">

<%# Check current page %>
<%= current_page?('about') ? 'active' : '' %>">

<%# Render shared partial _navbar.html.erb %>
<%= render partial: 'shared/navbar' %>

<%# Render partial _form.html.erb %>
<%= render 'form', product: @product %>

<%# data tables iterations %>
<% @users.each do |user| %> <% end %>

<%# Render a for each _user.html.erb %>
<%= render @users %> 

<%# Conditional %>
<% if current_user.signed_in? %> 
  ...
<% else %> 
  ...
<% end %>

<%# Display errors %>
<% if @post.errors.any? %> 
<% if form.object.errors.any? %>

<% if @post.errors.empty? %>
<% @post.errors.full_messages.each do |message| %>
  <p class='error'><%= message %></p>
<%= user.errors.count %>
<%= post.errors[:description] %>

<%# Flash messages %>
<% flash.each do |msg_type, msg| %>
  <div class="alert alert-<%= msg_type %>">
    <%= msg %>
  </div>
<% end %>
```



## Form

```ruby
<%# Model form %>
<%= form_with(model: product), local: true do |form| %>
  <%= form.label :title %>
  <%= form.text_field :title, class: 'form-control' %>

  <%= form.submit %>
<% end %>

<%# Generic form %>
<%= form_with url: "/search", method: :get, local: true do |form| %>
  <%= form.label :query, "Search for:" %>
  <%= form.text_field :query, placeholder: 'search' %>
  <%= form.submit "Search", class: 'btn btn-primary' %>
<% end %>

<%# Multi-lines memo %>
<%= form.text_area :description, rows: 10, cols: 60 %>

<%# Collection Select (field, collection, key, value, label) %>
<%= form.collection_select :category_id, Category.all, :id, :name, {include_blank: '- Select a Category -'}, {class: 'form-select'}

<%# Select %>
<%= form.select :type, Customer.types.keys, prompt: 'Select a type' %>
<%= form.select :rating, (1..5) %>

<%# if form in new or edit mode change submit text %> 
<%= form.submit @product.new_record? ? 'Create' : 'Update', class: "mt-4 btn btn-primary" %>
```



## Flash, Session and Cookie

```ruby
# Create flash (reset every new request)
flash[:success] = 'User created with success!'

# Create flash.now (reset every new view render)
flash.now[:error] = 'Please select s user!'

# Create session (reset every browser close)
session[:user_id] = user.id

# Check if session exist
session[:user_id].nil?

# Remove
session.delete(:user_id)

# Remove all
reset_session      

# Create cookie (reset at expiration date)
cookies.permanent[:remember_token] = remember_token

# Encrypted cookie
cookies.permanent.encrypted[:user_id] = user.id

# Delete cookie
cookies.delete(:user_id)
```



## Database seed with faker

```
# bundle install 
$ gem 'faker' 

# db/seeds.rb
Customer.delete_all
10.times do |n|
    customer = Customer.new
    customer.name = Faker::Name.name
    customer.phone = Faker::PhoneNumber.phone_number
    customer.save
end

# Run seed script
$ rails db:seed
```



## Devise Gem (authentification)

```ruby
# Install
gem devise
bundle install
rails g devise:install # follow on-screen instruction
rails generate devise User
rails db:migrate

# Customize devise login, register, etc. views
rails generate devise:views

# Add in existing controllers
before_action :authenticate_user!

# User shared globals
user_signed_in?
current_user

# Logout link_to exemple
<%= link_to "Logout", destroy_user_session_path, method: :delete %>
```



## Trix Editor

```ruby
gem ‘image_processing'
rails action_text:install
bundle install
rails db:migrate

# Add to model class 
has_rich_text :body 

# Template use
<%= form.rich.text_area %>

# actiontext.scss (if using boostrap only)
trix-editor { 
  &.form-control { 
    height: auto; 
  } 
} 
```



## MISC

```ruby
# Edit credentials encrypted list (API keys, secrets, etc.)
$ EDITOR="code --wait" bin/rails credentials:edit --environment=development
```



## Clone a Rails project from Github

```ruby
$ git clone https://github/myprojet…
$ cd projet_name
$ bundle install
$ yarn install --check-files
$ rails dev:cache # not always needed
$ rails db:migrate
$ rails db:seed
$ rails s
```



## Heroku deployment

```ruby
# Change Gemfile production database to Postgress
group :development do
 gem 'sqlite3'
end

group :production do
  gem 'pg'
end

# Create git and push to Heroku
$ heroku create
$ git remote
$ bundle install --without production
$ git status
$ git add -A
$ git commit -m 'heroku deployment'
$ git push origin master
$ git push heroku master
$ heroku run rails db:migrate
$ heroku run rails db:seed

# launch the upload site
$ heroku open 
```



# Rails ERB helpers

![img](/Users/liubomyrzhovtulia/RubymineProjects/prometheusRuby/CheatSheet/rails_architecture.png)

### ERB

| er      | <% %>                                          |
| ------- | ---------------------------------------------- |
| pe      | <%= %>                                         |
| pc      | <%# %>                                         |
| if      | <% if %>...<% end %>                           |
| ife     | <% if %>...<% else %>...<% end %>              |
| else    | <% else %>                                     |
| elsif   | <% elsif %>                                    |
| unlsess | <% unless %>...<% end %>                       |
| end     | <% end %>                                      |
| st      | <%= submit_tag ..., ... %>                     |
| tft     | <%= text_f­iel­d_tag ..., ... %>               |
| pft     | <%= passwo­rd_­fie­ld_tag ..., ... %>          |
| lblt    | <%= label_tag ..., ... %>                      |
| lt      | <%= link_to ..., ... %>                        |
| each    | <% @thing­s.each do \|thing\| %> ... <% end %> |
| ff      | <%= form_for(@ ) do \|f\| %> ... <% end %>     |
| t       | <%= t('@') %>                                  |

# RVM 

| RVM Homepage: | [https:­//r­vm.io](https://cheatography.com/"h­ttp­s:/­/rv­m.i­o") |
| ------------- | ------------------------------------------------------------ |
|               |                                                              |

### Install curl and RVM

If it is not installed already, install `curl`.  To check if it is installed, run the command `which curl`. If there is not output, run the following command: `apt-get install curl`  `curl -L get.rvm.io | bash -s stable`  close and reopen your terminal window after running this command. To make sure it installed and is available, type `which rvm` or `rvm --verion`; but only after reopening your terminal window.

See [https:­//r­vm.i­o/­rvm­/in­stall](https://rvm.io/rvm/install) and [http:/­/rv­m.i­o/r­vm/­ins­tal­lation/](http://rvm.io/rvm/installation/)

in your terminal: 

```
rvm help
```

### Install Ruby

| `rvm install 1.9.3`                | Latest known patch level                               |
| ---------------------------------- | ------------------------------------------------------ |
| `rvm install 1.9.3 -j #`           | Parallel compile, replace *#* with number of CPU cores |
| `rvm install 1.9.3 --patch falcon` | Use a patch (*falcon* for perfor­mance)                |
| `rvm install 1.9.2-p318`           | Patch level 318                                        |
| `rvm install rbx --1.9`            | Rubinius with 1.9 mode set as default                  |

### Update RVM

```
rvm get stable
```

In case of problems try first with develo­pment version
(maybe it's already fixed):



```
rvm get head
```

Very old instal­lations might not support those update methods, just run the installer and reopen your terminal.

### Install Ruby Depend­encies

Follow the instru­ctions from running: `rvm requir­ements`

### List Known Rubies

```
rvm list known
```

### List All Rubies and Gemsets

| `ruby list`        | List rubies only              |
| ------------------ | ----------------------------- |
| `rvm list gemsets` | List rubies and gemsets       |
| `rvm gemset list`  | List gemsets for current ruby |

### Selecting Ruby for Work

| `rvm system`                   | For system ruby with fallback to default |
| ------------------------------ | ---------------------------------------- |
| `rvm use jruby`                | For current session only                 |
| `rvm use --default 1.9.3`      | For current and new sessions             |
| `rvm use --ruby­-ve­rsion rbx` | For current session and this project     |

RVM will automa­tically use a ruby and gemset when you 

```
cd
```

 to a project directory.

Read more on project files:

\- [https:­//r­vm.i­o/­wor­kfl­ow/­pro­jec­ts/­#ru­by-­ver­sions](https://rvm.io/workflow/projects/#ruby-versions)

### Using ruby and gems

After selecting Ruby work as usual:  `ruby -v` `gem install haml` `haml`

### Tempor­arily selecting another Ruby or gemset

| `rvm 1.8.7 do gem install rspec`       | in the given ruby                 |
| -------------------------------------- | --------------------------------- |
| `rvm 1.8.7,­1.9.2 do gem install haml` | in these two rubies               |
| `rvm @global do gem install gist`      | in @global gemset of current ruby |

### Gemsets

RVM by default allows creating multiple enviro­nments for one ruby - called *gemsets*.  Gemsets can be specified together with ruby name using gemsets separa­tor(@):  - ruby-1.9.3­-p­125­@my­-pr­oject  During instal­lation of Ruby, RVM creates two gemsets:  - default - automa­tically selected when no @gemset specified: rvm use 1.9.3 - global - super gemset, inherited by all other gemsets for the given ruby

### Working with gemsets

| `rvm use 1.8.7`                         | use the ruby to manage gemsets for |
| --------------------------------------- | ---------------------------------- |
| `rvm gemset create projec­t_name`       | create a gemset                    |
| `rvm gemset use projec­t_name`          | use a gemset in this ruby          |
| `rvm gemset list`                       | list gemsets in this ruby          |
| `rvm gemset delete projec­t_name`       | delete a gemset                    |
| `rvm 1.9.1@­oth­er_­pro­jec­t_name`     | use another ruby and gemset        |
| `rvm 1.9.3@­_pr­oject --create --rvmrc` | use and create gemset & .rvmrc     |

A selection of popular Ruby gems/libraries:

| **gem/library** | **Description**                                           | **URL**                                                      |
| --------------- | --------------------------------------------------------- | ------------------------------------------------------------ |
| Rails           | The famous Web application framework                      | [http://www.rubyonrails.com](http://www.rubyonrails.com/)    |
| Rake            | A Ruby based build system(like a Ruby equivalent of make) | [http://rake.rubyforge.org](http://rake.rubyforge.org/)      |
| Capistrano      | A tool for automatic remote deployment tasks              | [http://capify.org](http://capify.org/)                      |
| Mongrel         | A Ruby Web server and HTTP daemon library                 | [http://mongrel.rubyforge.org](http://mongrel.rubyforge.org/) |
| rspec           | A "Behavior Driven Development" (BDD) framework           | [http://rspec.info](http://rspec.info/)                      |
| camping         | A tiny web framework                                      | http://code.whytheluckystiff.net/camping                     |

Information about RubyGems can be found at: [http://www.rubygems.org](http://www.rubygems.org/)

# Create a new application

Install the Rails gem if you haven't done so before

```
$ gem install rails
```

Generate a new Rails app w/ Postgres support

```
$ rails new my_app --database=postgresql
```

Initialize the database

```
$ rake db:create
```

Start the Rails server

```
$ rails s
```

### Ruby Interpreter Arguments

| -c        | Check code                       |
| --------- | -------------------------------- |
| -d        | Debug                            |
| -e "..."  | Execute a single line expression |
| -h        | Help                             |
| -rLibrary | require the specified library    |
| -v        | Verbose mode                     |
| -w        | Display code warnings            |
| -y        | Enable compiler debug mode       |
| -rubygems | Loads RubyGem support            |

### Routes

Create a route that maps a URL to the controller action

```
# config/routes.rb
get 'welcome' => 'pages#home'
```

Shorthand for connecting a route to a controller/action

```ruby
# config/routes.rb
get 'photos/show'

# The above is the same as: 
get 'photos/show', :to 'photos#show'
get 'photos/show' => 'photos#show'
```

Automagically create all the routes for a RESTful resource

```
# config/routes.rb
resources :photos 
```

[![img](/Users/liubomyrzhovtulia/RubymineProjects/prometheusRuby/CheatSheet/75b73966-24d7-11e5-896a-06506648c4fe.png)

| HTTP Verb | Path             | Controller#Action | Used for                                     |
| --------- | ---------------- | ----------------- | -------------------------------------------- |
| GET       | /photos          | photos#index      | display a list of all photos                 |
| GET       | /photos_new      | photos#new        | return an HTML form for creating a new photo |
| POST      | /photos          | photos#create     | create a new photo                           |
| GET       | /photos/:id      | photos#show       | display a specific photo                     |
| GET       | /photos/:id/edit | photos#edit       | return an HTML form for editing a photo      |
| PATCH/PUT | /photos/:id      | photos#update     | update a specific photo                      |
| DELETE    | /photos/:id      | photos#destroy    | delete a specific photo                      |

Create resources for only certain actions

```
# config/routes.rb
resources :photos, :only => [:index]

# On the flip side, you can create a resource with exceptions 
resources :photos, :except => [:new, :create, :edit, :update, :show, :destroy]
```

Create a route to a static view, without an action in the controller

```
# config/routes.rb
# If there's a file called 'about.html.erb' in 'app/views/photos', this file will be 
#   automatically rendered when you call localhost:3000/photos/about
get 'photos/about', to: 'photos#about'
```

Reference: http://guides.rubyonrails.org/routing.html

#### Path Helpers

Creating a path helper for a route

```
# Creating a path helper for a route
get '/photos/:id', to: 'photos#show', as: 'photo'
# app/controllers/photos_controller.rb
@photo = Photo.find(17)
# View for the action
<%= link_to 'Photo Record', photo_path(@photo) %>
```

Path helpers are automatically created when specifying a resource in `config/routes.rb`

```
# config/routes.rb
resources :photos
```

### Controllers

Generate a new controller

**Note:** Name controllers in Pascal case and pluralize

```
$ rails g controller Photos
```

Generate a new controller with default actions, routes and views

```
$ rails g controller Photos index show
```

Reference: http://guides.rubyonrails.org/action_controller_overview.html

### Models

Generate a model and create a migration for the table

**Note:** Name models in Pascal case and singular

```
$ rails g model Photo
```

Generate a model and create a migration with table columns

```
$ rails g model Photo path:string caption:text
```

The migration automatically created for the above command:

```
class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :path
      t.text :caption
 
      t.timestamps null: false
    end
  end
end
```

Reference: http://guides.rubyonrails.org/active_model_basics.html

### 

# Migrations

- Creating Migrationrails g model [name] [options]
- rails g migration Add[na­me]­To[­table] [options]
- rails g migration Remove­[na­me]­Fro­m[t­able] [options]

### Migration Commands

| `bin/rails db:migrate`        | Update the database          |
| ----------------------------- | ---------------------------- |
| `bin/rails db:rol­lback`      | Undo the previous migration  |
| `bin/rails db:mig­rat­e:redo` | First rollback, then migrate |

### Rake

View all the routes in an application

```
$ rake routes
```

Seed the database with sample data from `db/seeds.rb`

```
$ rake db:seed
```

Run any pending migrations

```
$ rake db:migrate
```

Rollback the last migration performed

**NOTE:** Be VERY careful with this command in production, it's destructive and you could potentially lose data. Make sure you absolutely understand what will happen when you run it

```
$ rake db:rollback
```

**Rake Tasks**

| db:create                   |
| --------------------------- |
| db:migrate [VERSI­ON=#]     |
| db:mig­rat­e:redo [STEP=#]  |
| db:mig­rate:up [VERSI­ON=#] |
| db:rol­lback [STEP=#]       |
| db:reset                    |
| db:drop                     |
| db:seed                     |

### Supported Types

| binary       |
| ------------ |
| boolean      |
| date         |
| datetime     |
| decimal      |
| float        |
| integer      |
| primar­y_key |
| string       |
| text         |
| time         |
| timestamp    |

You can create your own types not supported by rails:
t.column :name, 'typeHere'

### Scaffolding

Scaffolding is great for prototypes but don't rely too heavily on it: http://stackoverflow.com/a/25140503

```
$ rails g scaffold Photo path:string caption:text
$ rake db:migrate
```

### 