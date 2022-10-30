# authorization-rails

## Using instance variables within a Rails AR model (this branch)

This branch contains an extension to the original repo in order to
demonstrate the technique of using an instance variable within a Rails
ActiveRecord model. This technique is discussed in the following blog
post:

https://www.vector-logic.com/blog/posts/using-instance-variables-within-rails-active-record-objects


## Original repo (main branch)

The repo contains the source code referenced in the VectorLogic blog
post entitled "Authorizing controller endpoints in Rails":

https://vector-logic.com/admin/blog/posts/authorizing-controller-endpoints-in-rails

The blog post examines some of the popular authorization libraries that
can be incorportated into a Rails project. These options are examined
in the context of a simple blog post controller.

## Set up the project

```
  > git pull
  > bundle install
  > bundle exec rake db:drop && bundle exec rake db:migrate && bundle exec rake db:seed
```


## Run the tests

```
  > bundle exec rake
```
