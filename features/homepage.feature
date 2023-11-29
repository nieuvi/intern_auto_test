Feature: Home Page

        Scenario: Home Page with three Sliders only
            Given User is on the Books Shop Home page --slider
            Then The Home page should contain three Sliders only --slider

        Scenario: Home Page with three Arrivals only
            Given User is on the Books Shop Home page --arrival
            Then The Home page should contain three Arrivals only --arrival

        Scenario: Home page - Images in Arrivals should navigate
            Given User is on the Books Shop Home page --navigate
            When User clicks on "Selenium Ruby" image in the Arrivals --navigate
            Then User should be navigated to the next page to add that book to basket --navigate

        Scenario: Home page - Arrivals - Images - Description
            Given User is on the Books Shop Home page --description
            When User clicks on "Selenium Ruby" image in the Arrivals --description
            Then There should be a description regarding that book the user clicked on --description
                | Product Description |

        Scenario: Home page - Arrivals - Images - Reviews
            Given User is on the Books Shop Home page --reviews
            When User clicks on "Selenium Ruby" image in the Arrivals --reviews
            Then There should be a Reviews regarding that book the user clicked on --reviews
                | Reviews |

        Scenario: Home page - Arrivals - Images - Add to Basket
            Given User is on the Books Shop Home page --add
            When User clicks on "Selenium Ruby" image in the Arrivals --add
            And User clicks on Add to Basket button --add
            Then The cart should update item quantity in the basket --add
                | 1 item |

        # Scenario: 7. Home page - Arrivals-Add to Basket with more books
        # Cannot find the Stock.Ex

        Scenario: Home - Arrivals - Add to Basket - Items
            Given User is on the Books Shop Home page --items
            When User clicks on "Selenium Ruby" image in the Arrivals --items
            And User clicks Add to Basket button --items
            And User clicks on Item link --items
            Then User should be navigated to proceed to checkout page --items

        Scenario: Home - Arrivals - Add to Basket - Items - Coupon
            Given User is on the Books Shop Home page --coupon
            When User clicks on "Selenium Ruby" image in the Arrivals --coupon
            And User clicks Add to Basket button --coupon
            And User clicks on Item link --coupon
            And User applys "krishnasakinala" Coupon code --coupon
            Then There should be a successfully applied message displayed --coupon
                | Coupon code applied successfully. |

        Scenario: Home - Arrivals - Add to Basket - Items - Coupon value < 450
            Given User is on the Books Shop Home page --less 450
            When User clicks on "Mastering Javascript" image in the Arivals --less 450
            And User clicks Add to Basket button --less 450
            And User clicks on Item link --less 450
            And User applys "krishnasakinala" Coupon code --less 450
            Then There should be a error message displayes --less 450
                | The minimum spend for this coupon is ₹450.00. |

        Scenario: Home - Arivals - Add to Basket - Items - Remove book
            Given User is on the Books Shop Home Page --remove
            When User clicks on "Selenium Ruby" image in the Arrivals --remove
            And User clicks Add to Basket button --remove
            And User clicks on Item link --remove
            And User removes the "Selenium Ruby" book in basket --remove
            Then There should be a message displayed --remove
                | Selenium Ruby removed. Undo? |

        #both 12 and 14
        Scenario: Home - Arrivals - Add to Basket - Items - Add book - Update basket
            Given User is on the Books Shop Home Page --add book
            When User click on "Selenium Ruby" image in the Arrivals --add book
            And User clicks Add to Basket button --add book
            And User clicks on Item link --add book
            Then The update basket button should be unclickable --add book
            When User modifies quantity for "Selenium Ruby" and clicks on Update basket button --add book
            Then There should be a successfully updated message displayed --add book
                | Basket updated. |

        #both 13 and 15
        Scenario: Home - Arrivals - Add to Basket - Check out - Book Final price - Total & Sub-total condition
            Given User is on the Books Shop Home page --total
            When User click on "Selenium Ruby" image in the Arrivals --total
            And User clicks Add to Basket button --total
            And User clicks on Item link --total
            Then There should be the information to checkout for the books in basket --total
                | totalPrice | subtotal | tax    | total   |
                | ₹500.00    | ₹500.00  | ₹10.00 | ₹510.00 |
        #In more ordered books case, I have yet tested, I only test for one ordered book.

        Scenario: Home - Arrivals - Add to Basket - Items - Check out functionality
            Given User is on the Books Shop Home page --checkout
            When User click on "Selenium Ruby" image in the Arrivals --checkout
            And User clicks Add to Basket button --checkout
            And User clicks on Item link --checkout
            And User click on "Proceed to Checkout" button under total --checkout
            Then User should be navigated to payment gateway page --checkout
                | Billing Details |

        #both 17 and 18
        Scenario: Home - Arrivals - Add to Basket - Items - Check out - Payment Gateway
            Given User is on the Books Shop Home page --payment
            When User click on "Selenium Ruby" image in the Arrivals --payment
            And User clicks Add to Basket button --payment
            And User clicks on Item link --payment
            And User click on "Proceed to Checkout" button under total --payment
            And User fills information to payment and click "Place order" button --payment
                | First Name | Last Name | Email Address | Phone | Address | City | Postcode |
                | test       | test      | test@gmail.com| 1234  | test    | test | TEST     |
            Then There should be a successful payment message --payment
                | Thank you. Your order has been received. |

    Scenario: Verify that there are validation error messages displayed when clicking place order button without filling payment information
        Given User is on the Books Shop Home page --blank
        When User clicks on "Selenium Ruby" image in the Arrivals --blank
        And User clicks on Add to Basket button --blank
        And User clicks on Item Link --blank
        And User clicks on "Proceed to Checkout" button under total --blank
        And User clicks on "Place order" button --blank
        Then There should be validation error messages displayed above billing details --blank
            | Billing First Name is a required field.     |
            | Billing Last Name is a required field.      |
            | Billing Email Address is a required field.  |
            | Billing Phone is a required field.          |
            | Billing Address is a required field.        |
            | Billing Town / City is a required field.    |
            | Billing Postcode / ZIP is a required field. |

    Scenario: Verify that user can not apply coupon for sale book
        Given User is on the Books Shop Home page --sale
        And User clicks on ADD TO BASKET button of Thinking in HTML image in the Arrivals--sale
        And User clicks on ADD TO BASKET button of Selenium Ruby image in the Arrivals--sale
        And User clicks on "items" link --sale
        And User applys "krishnasakinala" coupon code for basket --sale
        Then There should be an error message displayed --sale
            | Sorry, this coupon is not valid for sale items. |

    Scenario: Verify that user can not apply coupon for book having price less 450
        Given User is on the Books Shop Home page --coupon less
        When User clicks on ADD TO BASKET button of Mastering Javascript image in the Arrivals --coupon less
        And User clicks on "items" link --coupon less
        And User applys "krishnasakinala" coupon code for basket --coupon less
        Then There should be an error message displayed --coupon less
            | The minimum spend for this coupon is ₹450.00. |
