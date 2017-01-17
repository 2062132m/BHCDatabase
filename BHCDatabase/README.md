## Getting started

To get started with the app, clone the repo and then install the needed gems:

```
$ bundle install --without production
```

Next, migrate the database:

```
$ rails db:migrate
```

Alternatively, can instead run rails db:setup which will migrate but also populate the db with the 4 initial areas and 6 user accounts for each developer. Email: forename@forename.com. Password: forename123.

```
$ rails db:setup
```

Finally, run the test suite to verify that everything is working correctly:

```
$ rails test
```

If the test suite passes, you'll be ready to run the app in a local server:

```
$ rails server
```