# Invocations

[ ![Codeship Status for cffc/invocations_rails](https://codeship.io/projects/3d507700-fa9a-0131-1e8f-52190bbde1aa/status)](https://codeship.io/projects/29068)

This is the "Invocations" application for the [Central Florida Freethought Community](http://cflfreethought.org/)

## Ruby on Rails

This application requires:

- Ruby 2.2.0
- Rails 4.2.0

Learn more about [Installing Rails](http://railsapps.github.io/installing-rails.html).

## Getting Started

To develop the application, you can either setup Rails according to the previous instructions, or just use Vagrant. Setup instructions for Windows have also been supplied.

### Development with Windows
Currently, RailsInstaller is only supporting version 2.1.5. To develop directly
on Windows, you will need up update (but don't check in!) `.ruby_version` and
`Gemfile` listed version of ruby to match. 

1. Download and install [RailsInstaller](http://railsinstaller.org/en)
2. Install the missing SSL certificate via these [instructions](http://stackoverflow.com/a/27298128)
3. From the Sites directory created with RailsInstaller, run `git clone https://jktravis@bitbucket.org/cffc/invocations_rails.git`
3. `cd` into the `invocations_rails` directory.
4. Prepare Puma install by downloading OpenSSL. Extract to something like `C:\opt\openssl` for easy access. (see [Puma install on Windows](https://github.com/hicknhack-software/rails-disco/wiki/Installing-puma-on-windows))
5. Run `gem install puma -- --with-opt-dir=C:\opt\openssl`. Replace directory with actual openssl directory. 
6. Download and Install [MySQL](http://dev.mysql.com/downloads/mysql/). I prefer the zip archive, personally. Just extract to `C:\opt\mysql`. 
7. Launch the server with `C:\opt\mysql\bin\mysqld -u root`
1. Copy the `config/database.yml.example` to `config/database.yml`and update the necessary values (e.g. database user, password, etc.)
8. Delete or comment out ('#') the following two lines from `config/database.yml`:
    - cucumber:
    -    <<: \*test
10. It seems that Windows does not want to use the `.env` file, so you'll need to add these to the config manually instead. Run `bundle exec rake secret` and place the returne value in the `config/secrets.yml` for both the `secret_key_base` and `devise_secret`.
12. Run `bundle exec rake db:setup`
13. Run `bundle exec rails server`
14. The application should now be running. Point your browser to [http://localhost:3000](http://localhost:3000) to see if it works. Loging with the username and password configured in `config/secrets.yml`.


### Development with Vagrant

The `Vagrantfile` provides a way to quickly set up a [Vagrant](http://vagrantup.com) development box with everything needed for the application. To use it, 

1. [Install Vagrant](http://docs.vagrantup.com/v2/installation/index.html), 
2. Install the `librarian-chef` plugin for Vagrant: `vagrant plugin install vagrant-librarian-chef`. 
3. Pull down the Git submodules, by running `git submodule init` and `git submodule update`
4. From the project directory run `vagrant up` to start provisioning the server.
5. After the virtual Machine is running, you can login to it with `vagrant ssh`. 
6. `apt-get install libffi-dev` [ruby-build/issues/690#issuecomment-68113987](https://github.com/sstephenson/ruby-build/issues/690#issuecomment-68113987)
7. `rbenv install 2.2.0`
8. `rbenv global 2.2.0`
9. From the `/vagrant` directory, run `bundle install` to pull down the application dependencies.

### Configure environment variables
1. Rename the `.env.example` file to `.env` and populate it with your values.
2. Run `rake secret` to generate some values for both the `DEVISE_SECRET` and `SECRET_KEY_BASE`. 

## Database setup
To configure the database settings, rename the `config/database.yml.example` file to `config/database.yml`, change any necessary values, and then run `bundle exec rake db:setup` to create the database, perform the migrations, and create the admin user account.
Set up will seed the database and create a new admin user account with the email and password specified in the `config/secrets.yml` file, which will use the `.env` variables. This should be fine for development but feel free to change them.


#### Launch the server
After all of the above, restart the VM and with `vagrant reload`. To launch the server, log back in run `cd /vagrant && bundle exec rails server -b 0.0.0.0` to start the app. Using `-b 0.0.0.0` tells Puma (the rails server) to respond to all IPs and is necessary to circumvent an issue where VirtualBox. Point your browser to [http://localhost:3000](http://localhost:3000).

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
