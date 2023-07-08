## Mission 2: UX for depositing & withdrawing funds (writing, UX & UI design)

Goto http://localhost:3000/dashboard/index#
Here I have tried to give you the mockup of the dashboard, its not exact thing I have in my mind, but just a snapshot.

User navigation flow:
- User after securely logged in, he will see the dashboard page
- On dashboard page he will see navigation links with his account information
- As a part of account information ( we will only show user name and amount will not be displayed as privacy concern, it will be visible only on click of the user)
- Dashboard will have Fund transfer link, Investment link

Fund Transfer:
- List all the users personal accounts which he has added as payee
- GIve option to transfer to some other bank account
- Fund transfer process should be easy process, we will just need to take user card number for verification.

Security Areas:
- Do not allow user to refresh the page
- Do not allow user to edit the URL of the site
- Any clicks on the site url should logout the user and ask him to re login
- Do not show user balance on dashboard page, it should be visible only when user ask to see it
- Do not allow page back
- session timeout is necessary

## Mission 3: Customer support (writing)

### 1. Debugging

- Communicate to customer that we are looking into the issue, will update them asap
- Get the customer details, his account number and other details
- Inform your team mates or manager about this issue, if anyone of them are aware of any new feature regression they can give you some hints or atleast it keep your team and manager informed about the issue, keep them in loop.

- I will first check if bank api is giving the data for that user
  
Case 1: If bank api is not giving the information

- Communicate to the bank, check the logs, corss check if there is any update from the bank which we missed to incorparate

Case 2: if bank api is giving the user transaction and its not appearing in our system

- Check error logs
- Check recent code changes around that feature
- check who worked recently on that area
- Are there any condition stopping transaction from creating
- check why transaction for this user is not appearing step by step.
- we might doing some operation with our transaction table, check any model filter we have applied.
- check if its the date issue which is why we are not showing any data on UI
- which jobs we run daily, are there any changes done on that backgound job

Followup: email customer for the update on the issue

### 2. Email writting

Dear Dr Horrible,

I hope this email finds you well. I am writing to bring an important matter to your attention regarding the recent wire transfer you made to our bank. I regret to inform you that due to a bug in our code, your transaction was inadvertently filtered out during our process of cleaning the transaction history. As a result, we were unaware of the wire transfer, and we deeply apologize for the oversight.

We have verified the transaction records and confirmed that your wire transfer of $10,000 was indeed received by our bank. We apologize for the confusion caused by the transaction not being reflected in your account during the week.

If you have any questions or require further clarification, please feel free to contact us directly.

Thank you,
PogoBank
