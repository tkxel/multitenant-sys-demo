Multitenant Demo
====================

Demonstration project of a multitenant system.

This is a demo showing the implementation of a multitenant system in Rails. The shared DB, multiple schemeas approach for a multitenant system is implemented. The code is built on top of the guide (http://blog.jerodsanto.net/2011/07/building-multi-tenant-rails-apps-with-postgresql-schemas/) provided by Jerod Santo.

## Running the demo


    gem install bundler
    bundle install
    bundle exec rake db:create
    bundle exec rake db:migrate
    rails s


After installation, hit the following URL in the browser
    http://www.lvh.me:3000/tenants

It would allow you to create a new tenant and its page.
In order to check the tenant created, hit following URL.

    tenant-name..lvh.me:3000