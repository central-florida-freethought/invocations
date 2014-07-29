# Invocations

This is the "Invocations" application for the [Central Florida Freethought Community](http://cflfreethought.org/)

## Ruby on Rails

This application requires:

- Ruby 2.1.2
- Rails 4.1.4

Learn more about [Installing Rails](http://railsapps.github.io/installing-rails.html).

## Getting Started

To develop the application, you can either setup Rails according to the previous instructions, or just use Vagrant.

### Development with Vagrant

The `Vagrantfile` provides a way to quickly set up a [Vagrant](http://vagrantup.com) development box with everything needed for the application. To use it, first [install Vagrant](http://docs.vagrantup.com/v2/installation/index.html), and then from the project directory run the `vagrant up` command to start everything.

After the virtual Machine is running, you can login to it with `vagrant ssh` and from the `/vagrant` directory, run `bundle install` to pull down the application dependencies.

To configure the database settings, rename the `database.yml.example` file to `database.yml` and then run `bundle exec rake db:setup` to create the database, perform the migrations, and create the admin user account.

## Developing the app

If you seed the database, it will create a new admin user account with the email and password specified in the `config/secrets.yml` file. This should be fine for development but feel free to change them.

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
