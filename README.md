# Bank Tech Test

## Running instructions

1. Clone this repository
2. Run ```bundle```
3. Launch ```irb -r './lib/account.rb'```

Create a bank account ```account = Account.new```

You can now deposit any amount ```account.deposit(1000)```

Withdraw a certain amount ```account.withdraw(500)```

And display your transaction history. ```account.show_transactions```


## Approach

When designing the program with the specifications and OOD principles in mind, I saw 2 distinct responsibilities. One part of the program (the Account class) should be responsible for interacting with the customer and handling their requests and balance, and the other (the History class) to store and display the transaction history. The Account methods would communicate with the History class to store whatever request was made.

Account --> deposit (adds amount to balance)
                  --> History --> add_deposit (stores transaction)


Account --> withdraw (removes amount from balance)
                  --> History --> add_withdrawal (store transaction)

Account --> show_transactions
                  --> History --> display (pretty prints transactions array)

## Testing

I tested each class separately and mocked the History class within the Account class tests. I also mocked Time to test storing the transaction date.

## Gems used

- Rspec for Testing
- Simplecov for test coverage (100%)
- Rubocop for code quality
- Timecop for stubbing Time

## Edge cases

- I made sure that the user would not be able to withdraw money if there wasn't enough money available on the account. Possible extensions for the program would be to allow user to go below 0 by a certain amount, or have a minimum or maximum amount for deposits or withdrawals, for example.
