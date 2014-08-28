# Invocations

[ ![Codeship Status for cffc/invocations_rails](https://codeship.io/projects/3d507700-fa9a-0131-1e8f-52190bbde1aa/status)](https://codeship.io/projects/29068)

This is the "Invocations" application for the [Central Florida Freethought Community](http://cflfreethought.org/)

## Ruby on Rails

This application requires:

- Ruby 2.1.2
- Rails 4.1.4

Learn more about [Installing Rails](http://railsapps.github.io/installing-rails.html).

## Getting Started

To develop the application, you can either setup Rails according to the previous instructions, or just use Vagrant.

### Development with Vagrant

The `Vagrantfile` provides a way to quickly set up a [Vagrant](http://vagrantup.com) development box with everything needed for the application. To use it, 

1. [Install Vagrant](http://docs.vagrantup.com/v2/installation/index.html), 
2. Install the `librarian-chef` plugin for Vagrant: `vagrant plugin install vagrant-librarian-chef`. 
3. Pull down the Git submodules, by running `git submodule init` and `git submodule update`
4. From the project directory run `vagrant up` to start provisioning the server.

After the virtual Machine is running, you can login to it with `vagrant ssh`. From the `/vagrant` directory, run `bundle install` to pull down the application dependencies.

### Configure environment variables
1. Rename the `.env.example` file to `.env` and populate it with your values.
2. Run `rake secret` to generate some values for both the `DEVISE_SECRET` and `SECRET_KEY_BASE`. 

## Database setup
To configure the database settings, rename the `config/database.yml.example` file to `config/database.yml`, change any necessary values, and then run `bundle exec rake db:setup` to create the database, perform the migrations, and create the admin user account.
Set up will seed the database and create a new admin user account with the email and password specified in the `config/secrets.yml` file, which will use the `.env` variables. This should be fine for development but feel free to change them.


#### Launch the server
After all of the above, restart the VM and with `vagrant reload`. To launch the server, log back in run `cd /vagrant && foreman run rails server` to start the app. Point your browser to [http://localhost:3000](http://localhost:3000).

Profit!

## Running tests
Before committing, or at least pushing, be sure your tests pass by running `foreman run rspec`. If you get an error regarding phantomjs, try manually install it via `sudo apt-get install phantomjs -y`. 

### File locations

| Directory | Description |
| -------- | -------- |
| `app/assets` | Images/Javascripts/Stylesheets for the app |
| `app/controllers` | Controllers for the app |
| `app/helpers` | Custom helper methods |
| `app/mailers` | Define custom mailers here |
| `app/models` | Models for the app that typically model the database |
| `app/services` | Custom service utilities |
| `app/views` | Customer-facing views |
| `config` | Contains configuration files for the application |
| `config/application.rb` | Settings common to all environments |
| `config/environments` | Environment-specific app settings |
| `config/initializers` | Settings that will be loaded during app startup |
| `deploy` | Used for configuring the settings for deploying the app |
| `db` | Database schema and migrations |
| `lib` | Extra Ruby libraries and Rake tasks |
| `log` | Applications logs |
| `public` | Static assets and error files |
| `spec` | RSpec files for testing |
| `Gemfile` | Spec for application dependencies |
