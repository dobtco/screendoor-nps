screendoor-nps
----

Using Screendoor to collect Screendoor's Net Promoter Score.

## Usage

Send an email with 10 links, numbered 1-10. The `href` attributes should look like this:

- `http://screendoor-nps.dobt.co/?score=1&email=adam@dobt.co&cohort=fall2016`
- `http://screendoor-nps.dobt.co/?score=2&email=adam@dobt.co&cohort=fall2016`
- `http://screendoor-nps.dobt.co/?score=3&email=adam@dobt.co&cohort=fall2016`
- ...etc

When a user visits the page, their response will immediately be persisted. If they choose to fill out the "comments" section, their response will be amended with that data.

We also persist a token to localstorage, so if they visit the page again, it does not create duplicate records inside of Screendoor.

If you intend to collect a follow-up response from the *same* user, make sure to change the `cohort` parameter in your links.

## Check the data in Screendoor

https://screendoor.dobt.co/dobt/screendoor-nps
