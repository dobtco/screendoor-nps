screendoor-nps
----

We love the concept of [dogfooding](https://en.wikipedia.org/wiki/Eating_your_own_dog_food) at DOBT. Even though we're not a government agency ourselves, we're always on the lookout for new opportunities to use [Screendoor](https://www.dobt.co/screendoor/) for ourselves. So when our Customer Success team mentioned that they were looking at different tools to conduct a Net Promoter Score (NPS) survey with our users, we immediately thought, "hey, we can build that with Screendoor!"

This repo is a simple static site, generated with Jekyll, that hosts a small bit of HTML and JavaScript that makes collecting your NPS with Screendoor a piece of cake. The end result is a set of links that you can send in an email to your users, each with a value from 0-10. When a user clicks the link, their response will be saved to Screendoor immediately, and they will see a form to add more feedback:

![feedback form](https://dobt-captured.s3.amazonaws.com/ajb/Screen_Shot_2016-09-02_at_11.24.55_AM.png)

If they submit additional feedback, they'll see a nice "Thank you" note:

![thank you note](https://dobt-captured.s3.amazonaws.com/ajb/Screen_Shot_2016-09-02_at_11.25.01_AM.png)

On the backend, we then get to use Screendoor's powerful response dashboard in order to view our results:

![screendoor response dashboard](http://take.ms/bOkpp)

## Configuration

Using this code to collect your NPS is easy, and can even be done with a free Screendoor account. (Don't have one yet? You can [sign up here](https://www.dobt.co/screendoor/signup/?ref=nps).)

First, create a Screendoor project using `project_template.yml`, the project template that we've created for you. (New to project templates? [Read the docs here](http://help.dobt.co/articles/screendoor/projects/templates.html).)

Then, fork this repo so that you can start modifying it. You'll need to customize the following in `config.yml`:

- Change the `title` to whatever you wish
- Update the `contact_email` that will be shown when a user completes the survey
- Change the `screendoor_project_id` to match your newly-created project's ID (You can find it on your "Settings" page in Screendoor)
- Change the `screendoor_response_field_ids` to match your response field IDs in Screendoor. (You can find these in the form builder, at the bottom of the left pane.)

You'll also want to upload a new logo to `images/logo.png`, unless your application happens to be called "Screendoor" too.

Now, run `bundle exec jekyll serve` and visit http://localhost:4000/?score=1&email=example@user.com. You did it!

Finally, you'll want to deploy your site. We deploy using GitHub Pages, but since we use custom plugins, we're using [grunt-gh-pages](https://github.com/tschaub/grunt-gh-pages) to handle our deployments. We'll leave this part up to you.

## Usage

Now, the fun part! Send an email with 10 links to each user that you wish to collect your NPS from. The links should look like this:

- `http://screendoor-nps.dobt.co/?score=1&email=adam@dobt.co&cohort=fall2016`
- `http://screendoor-nps.dobt.co/?score=2&email=adam@dobt.co&cohort=fall2016`
- `http://screendoor-nps.dobt.co/?score=3&email=adam@dobt.co&cohort=fall2016`
- ...etc

Our email looks like this:

![nps email](http://dobt-misc.s3.amazonaws.com/Screen-Shot-2017-11-21-at-11.51.36-AM.png)

(The "cohort" parameter is optional, but it allows you to collect NPS from the same user again in the future by changing the `cohort` value.)

When a user visits the page, their response will be persisted immediately. If they choose to fill out the "comments" section, their response will be amended with that data. We also persist a token to localstorage, so if they visit the page again, it does not create duplicate records inside of Screendoor.

Finally, visit your project in Screendoor and watch your responses roll in.


## License

MIT
