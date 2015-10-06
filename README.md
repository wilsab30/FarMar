# FarMar Finder

In this assignment we will be creating an application to look up farmers markets and their related vendors, products, and sales. We will use __CSV__ files as our _database_.

## Setup

1. You'll be working with an assigned pair.
1. Clone the project master repo and create a new branch with your team's initials.
1. Push your branch so it will show in the list of branches on the project master.
1. Choose one person to fork and clone the repo.
1. Add the second individual as a collaborator to the forked repo.
1. Both individuals will clone the forked repo: `$ git clone [YOUR FORKED REPO URL]`
1. Both individual will switch to the team's branch by doing `git checkout [YOUR BRANCH NAME]`. *Do not work on the master branch*.
1. Both individuals `cd` into the dir created: `$ cd far_mar`
1. Both individuals install needed tools via Terminal:
  - `$ gem install rspec`
  - `$ gem install simplecov`
1. We will cover rspec more in depth later, but for now, take a moment to add color output to rspec: `$ echo --color >> ~/.rspec`


## Expectations

### Project Structure
Build classes to query the CSV data including objects and methods listed below. Before going into the requirements and methods listed in tiers below, build a system to read the CSV files and turn each row of data into an _instance_ of the appropriate Ruby _class_.

To manage our data classes we will use a file named `/lib/far_mar.rb`. It should look something like:

```ruby
require 'csv'
require 'time'
require 'lib/market'
# ... require all needed classes
```

Each _class_ you build will live in the `/lib/far_mar/` directory, and belong to the `FarMar` _module_:

```ruby
module FarMar
  class Market
    # Your code goes here
  end
end
```

The module provides a _namespace_ for the application. A _namespace_ ensures the _classes_ we create will not 'collide' or 'overlap' with a _class_ that could exist elsewhere in a codebase (like in a gem).

For example, `Sale` is a very generic _class_ name that could very realistically exist in many codebases. Creating a module called `FarMar` allows us to specify _which_ `Sale` we're talking about; `FarMar::Sale` is much more explicit and likely to be unique.

### Project Data
#### FarMar::Market
Each individual market has many vendors associated with it. The `FarMar::Market` data, in order in the CSV, consists of:

1. ID - (Fixnum) a unique identifier for that market
2. Name - (String) the name of the market (not guaranteed unique)
3. Address - (String) street address of the market
4. City - (String) city in which the market is located
5. County - (String) county in which the market is located
6. State - (String) state in which the market is located
7. Zip - (String) zipcode in which the market is located

#### FarMar::Vendor
Each vendor belongs to a market, the `market_id` field refers to the `FarMar::Market` ID field.
Each vendor has many products for sell. The `FarMar::Vendor` data, in order in the CSV, consists of:

1. ID - (Fixnum) uniquely identifies the vendor
2. Name - (String) the name of the vendor (not guaranteed unique)
3. No. of Employees - (Fixnum) How many employees the vendor has at the market
4. Market_id - (Fixnum) a reference to which market the vendor attends

#### FarMar::Product
Each product belongs to a vendor. The `vendor_id` field refers to the `FarMar::Vendor` ID field. The `FarMar::Product` data, in order in the CSV, consists of:

1. ID - (Fixnum) uniquely identifies the product
2. Name - (String) the name of the product (not guaranteed unique)
3. Vendor_id - (Fixnum) a reference to which vendor sells this product

#### FarMar::Sale
Each sale belongs to a vendor __AND__ a product. The `vendor_id` and `product_id` fields refer to the `FarMar::Vendor` and `FarMar::Product` ID fields, respectively. The `FarMar::Sale` data, in order in the CSV, consists of:

1. ID - (Fixnum) uniquely identifies the product
2. Amount - (Fixnum) the amount of the transaction, in cents (i.e., 150 would be $1.50)
3. Purchase_time - (Datetime) when the sale was completed
4. Vendor_id - (Fixnum) a reference to which vendor completed the sale
5. Product_id - (Fixnum) a reference to which product was sold

# Requirements

Before you begin on these requirements, take some time to build the classes discussed above. You should be able to create instances of these classes that know about their associated data file.

## Baseline

- Create a class for each of the data types listed above. Each class should be inside the `FarMar` module.
- Create your `far_mar.rb` file which will bring together all classes created in the previous step.

## Primary Requirements
**For each of the data classes build the following methods:**

- `self.all` - returns a collection of Market instances, representing all of the markets described in the CSV
- `self.find(id)` - returns an instance of Market where the value of the `id` field in the CSV matches the passed parameter.

**Additional FarMar::Market Methods**

- `vendors` - returns a collection of `FarMar::Vendor` instances that are associated with the market by the `market_id` field.

**Additional FarMar::Vendor Methods**

- `market` - returns the `FarMar::Market` instance that is associated with this vendor using the `FarMar::Vendor` `market_id` field
- `products` - returns a collection of `FarMar::Product` instances that are associated by the `FarMar::Product` `vendor_id` field.
- `sales` - returns a collection of `FarMar::Sale` instances that are associated by the `vendor_id` field.
- `revenue` - returns the the sum of all of the vendor's sales (in cents)
- `self.by_market(market_id)` - returns all of the vendors with the given `market_id`

**Additional FarMar::Product Methods**

- `vendor` - returns the `FarMar::Vendor` instance that is associated with this vendor using the `FarMar::Product` `vendor_id` field
- `sales` - returns a collection of `FarMar::Sale` instances that are associated using the `FarMar::Sale` `product_id` field.
- `number_of_sales` - returns the number of times this product has been sold.
- `self.by_vendor(vendor_id)` - returns all of the products with the given `vendor_id`

**Additional FarMar::Sale Methods**

- `vendor` - returns the `FarMar::Vendor` instance that is associated with this sale using the `FarMar::Sale` `vendor_id` field
- `product` - returns the `FarMar::Product` instance that is associated with this sale using the `FarMar::Sale` `product_id` field
- `self.between(beginning_time, end_time)` - returns a collection of FarMar::Sale objects where the purchase time is between the two times given as arguments


### Optional Requirements: Part I
### FarMar::Market Methods

- `products` returns a collection of `FarMar::Product` instances that are associated to the market through the `FarMar::Vendor` class.
- `self.search(search_term)` returns a collection of `FarMar::Market` instances where the market name or vendor name contain the `search_term`. For example `FarMar::Market.search('school')` would return 3 results, one being the market with id 75 (Fox School Farmers FarMar::Market).
- `prefered_vendor` - returns the vendor with the highest revenue
- `prefered_vendor(date)` - returns the vendor with the highest revenue for the given date
- `worst_vendor` - returns the vendor with the lowest revenue
- `worst_vendor(date)` - returns the vendor with the lowest revenue on the given date

### FarMar::Vendor Methods

- `self.most_revenue(n)` returns the top n vendor instances ranked by total revenue
- `self.most_items(n)` returns the top n vendor instances ranked by total number of items sold
- `self.revenue(date)` returns the total revenue for that date across all vendors
- `revenue(date)` returns the total revenue for that specific purchase date and vendor instance

### FarMar::Product Methods

- `self.most_revenue(n)` returns the top `n` products instances ranked by total revenue

### Optional Requirements: Part II
**For All Classes**

- Write additional rspec tests for any methods in the data classes that don't already have test coverage.
- `self.find_by_x(match)` - where X is an attribute, returns a single instance whose X attribute case-insensitive attribute matches the match parameter. For instance, FarMar::Vendor.find_by_name("windler inc") could find a FarMar::Vendor with the name attribute "windler inc" or "Windler Inc".
- `self.find_all_by_x(match)` - works just like `find_by_x` but returns a collection containing all possible matches. For example `FarMar::Market.find_by_state("WA")` could return all of the FarMar::Market object with `"WA"` in their state field.
- Create a new _class_ that defines the shared/duplicated methods (i.e., `find`, `all`). Update your data classes to _inherit_ from this new parent class in order to _DRY_ up your code.

# Testing

To run our test suite use:

```bash
$ rspec
```
Our test suite will run tests to ensure that __some__ of our required methods are implemented correctly.

Note: It will be best to create the basic file for the four supporting classes before running our tests like...

```ruby
class FarMar::Market

end
```

and requiring them in `/lib/far_mar.rb`.
