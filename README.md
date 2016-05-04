# Testing Workshop

 It will be aimed at more intermediate to advanced topics. I'll introduce you to my basic workflow of testing code with MiniTest and some other tips and tricks along the way.

Testing workshop recording available at: https://www.youtube.com/watch?v=9w8QRDZy9Kw

We'll focus on testing:

• Models

• Controllers

• Helpers

• Model Concerns in isolation (can be tricky)

• Controller Concerns in isolation (can be even trickier)

• ApplicationController methods in isolation

• Dependencies on external services, mocking or VCR

• Acceptance testing with Capybara (if time permits)

• Gem testing (if time permits)

Additionally, I will touch briefly on organizing your code in a smart way so you avoid overtesting, talk about what not to test, and touch on some helpful testing tools along the way.

## Getting started

* Create a config/database.yml file for your machine like in config/database-sample.yml

* Create a config/application.yml file for your machine like in config/application-sample.yml *This is only used for Giphy API key*

* Run bundle, rake db:create, rake db:migrate per usual

