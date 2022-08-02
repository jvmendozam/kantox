# Basket test
The test consists of creating a basket that contains different products.
The products have different promotions that must be applied according to a minimum amount required.


### Objectives:
- Evaluation of programming style
- Evaluation of language knowledge
- Evaluation of testing approach

### Technical requirements:

- Use Ruby language (not Ruby on Rails)
- Use TDD (Test-Driven Development) methodology
- Use github as public repository
- Use of DB is not required

### Approach
The main difficulty is not using Rails and only Ruby.
This is why to perform the simulation of objects and their attributes I used attr_accessor. And to create various objects I used the factory_bot gem.

I created a Checkout service that is in charge of receiving the different products (as requested in the document). And also,
I created a service to do the calculations `PriceCalculationService` (single-responsibility principle).

### TODO
In the `PriceCalculationService` you can add methods to add a special discount for the entire basket. Or also put tax calculations on the products

### Requirements
- ruby 2.6.8p205
- gem rspec (3.11.0) [and dependencies]
- gem factory_bot (6.2.1)
