# Automated Testing

This test suite accesses an external system, which can be the test servers provided in this package or there are no
reasons (but some precautions to take) why you could not use this on an externally provisioned server such as the dev, staging
or even live (think you would have to be mad or extremely confident to do that though !!).

The test suite is also going to be slow, filling in all those forms to generate a PDF is a slow process. But, we often have
decent spec machines to run them on so parallel running needs to be considered.

Parallel running means scaling up the test processes at first, but in a coordinated way.  We already have a tool for doing this
(parallel_tests gem in ruby).
But, there will still be bottlenecks and we might want to scale up other things such as running multiple ET1 front ends, multiple
API servers etc.. etc...

We will not worry too much about when or even if we do any of these things, but it is important to have a few strategies in mind
right from the beginning.

Lets look at some now :-

## Unique Data - Keeping In & Out Known

If we had a way of all tests being able to generate their own unique string (could be a number or anything) that they add on
to a key piece of data in the input to the testing process and as a result of using this, we know what to look for in the
output of the process, then not only will we have a nice robust test suite, but it is more likely to work when running in parallel.

Lets look at an example - we will not use personas in here simply so I can demonstrate the problem better

### Unique Data - Bad Example 1

```

    Given I am "Fred Bloggs"
    And I am the Claimant
    When I complete an online ET1 form and submit the form
    Then my entered data is formatted into a PDF format file with a filename ending "ET1_Fred_Bloggs" and is available for ATOS to download

```

This is bad for 2 reasons

1. Without any cleanup processes (to be mentioned later) - if this test was run once, the second time it is run - we could get false positives as
   the file will already be there.
2. If we had multiple tests doing similar setup steps - i.e. creating a claim for 'Fred Blogs' - they would all trigger each others false positives

### Unique Data - Bad Example 2

```

    Given I am "Fred Bloggs"
    And I am the Claimant
    When I complete an online ET1 form and submit the form
    Then I should see an extra zip file in the landing folder

```

This may well be a resolution to problem 1 - as we know the system should accept multiple claims for the same person so that
should not cause a problem (but imagine if it did not allow that one day - we would have a lot of tests to change).  However,
checking for an increase in the number of zip files in the landing folder is fine if this test process is the only one
using the server(s) - but if you are running against an external server or if you are running in parallel - this is not the case
and you could get a false positive because that extra zip file you found was someone elses.

### Unique Data - Good Example

```

    Given I am "Fred10001 Bloggs"
    And I am the Claimant
    When I complete an online ET1 form and submit the form
    Then I should see a zip file containing a file with name ending "ET1_Fred10001 Bloggs" in the landing folder

```

So, here - we know what we are putting in and we know what to expect out - so whilst it is less efficient to look inside
each zip file to find a given filename, it makes this test much more robust, easy to run in parallel, safer to use on an external system
etc.. etc..

So, this number - in this case '10001' - it needs to be unique.  We could use some form of counter but this would need to be stored somewhere
that all test processes can get to it - and needs to remain between test runs etc.. etc..

But, one thing we all know is unique in a perfect world is the current date and time.  So, this number could be something like

'20180301123105015' which is the current date / time with milliseconds

In the non perfect world that we live in though, different machines have different times.

So, we could add our ip address, we could add our mac address - we could even use UUID's like '7ec36048-a996-42a4-8122-7a710c02479e'

We will, however, need to get a balance between :-

1. Guaranteed uniqueness - are we prepared to accept that it might still go wrong once in a blue moon and accept occasional randomness in the tests ?
2. Human readability - how important is it that we can read this number out to a colleague sitting opposite us who is helping ?  Imagine reading out that UUID !!
3. Restrictions placed upon us by the system - The first and last names are used to generate the filename so they are handy fields to use.
   However, they may have restrictions in terms of what characters they accept, how many characters they accept etc..


We do not need to choose which one we use until the time comes to write it, but if we keep this generator in a central place
so it can be easily changed / improved etc.. then we are on to a winner.

### Avoiding Global State Changes Within Reason

When I refer to global state, I mean something in the database as an example.  But, you could argue that adding a claim
affects global state - and it does because it increases the number of claims in the database.
However, what I really mean is shared global state such as a setting for the whole application, adding a global 'discount' in
en e-commerce system etc.. etc.. Changing this sort of global state in our tests can be harmful to our sanity anyway unless
we make sure we put them back to what they were straight away afterwards.

But, even if we do put it back after - what happens if another process comes along and adds something to the basket of the
e-commerce system we are testing whilst our test has a discount in place (our test takes 20 seconds so the chances are very high)
It would mean that the price of the second test's shopping basket has the discount applied and it may well be checking that
the price shown is correct - and it won't be - so we will have a sporadically failing test - not good - very brittle.

When we are running all of our tests in series we won't have this problem (unless we were testing against an external system where
someone had applied a global discount - but not sure what we would do about that !!).  However, when we go to do things in parallel
we will find strange and hard to identify problems.

So, lets help ourselves out here - we know that our test NEEDS to change global state - and we will put it back afterwards,
but we need a way to identify this test as being unable to run in parallel.

Now, I think that in this system this is going to be the exception rather than the rule - so we don't need to spend much time thinking
about it, lets just assume that all tests can be run in parallel - and mark the exceptions using the cucumber tag @no-parallel.
When we come to setup the parallel testing, we just ensure that all @no-parallel tests are run on their own first or even last.

For example :-

```
@no-parallel
Scenario: 10% Discount
    Given a global discount of 10% exists
    And I am shopping
    When I buy a chocolate bar that is normall £1.00
    Then I expect the shopping basket to show £0.90


```

Note the '@no-parallel' tag.

That harmless looking 'Given a global discount of 10% exists' will setup the discount - affecting this global state !!

Imagine if you didn't do this - how hard would it be to identify this in 3 months time when you have forgotten about it ?
You would have random failing tests and it would be really hard to find.

Note that there is still a problem, but it belongs in the next section (Housekeeping) - something needs to put that
discount back to what it was before the example else the next test, even if not running in parallel - will still have this discount
and it might matter - and it might not - but we don't want this brittleness.

### Housekeeping

Really, we want our tests to care about housekeeping - so tidy up when you are done.  If you added a claim, delete it - if you
changed that e-commerce site's global discount - change it back.  However, our tests are supposed to be meaningful to the business
and other non technical readers and we don't really want to clutter them with this sort of stuff.  Imagine if we had to do :

```
@no-parallel
Scenario: 10% Discount
    Given a global discount of 10% exists
    And I am shopping
    When I buy a chocolate bar that is normall £1.00
    Then I expect the shopping basket to show £0.90
    And I should empty my shopping basket
    And the global discount should be removed

```


Those last 2 lines - what a load of rubbish - we shouldn't really have to do this should we ?

Again, this sort of thing is a little easier in our apps as we generally don't have much global state, but we do want to
keep things tidy from the point of view that we don't want to be trawling through 10,000 zip files looking for a file because
we have been running the test suite for the last year - nor do we want the storage cost of them etc.. etc..

So, what can we do ?

#### Housekeeping - Using 'An Audit Trail'

We don't really want to be adding code into our cucumber steps to actually do the housekeeping - as deleting a claim might be
a case of just deleting the claim now, but in 6 months time - there may well be something else to do as well - I cant think of what
but there might.

So, we could simply use an audit trail of what we know we have done and that the test framework needs to 'Undo'.  In the example
of submitting a claim - lets say we had a step defined as follows

```

When(/^I complete an online ET1 form and submit the form$/) do
  start_a_new_et1_claim

  et1_answer_login
  et1_answer_claimant_questions
  et1_answer_group_claimants_questions
  et1_answer_representatives_questions
  et1_answer_respondents_questions
  et1_answer_employment_details_questions
  et1_answer_claim_type_questions
  et1_answer_claim_details_questions
  et1_answer_claim_outcome_questions
  et1_answer_more_about_the_claim_questions

  et1_submit_claim

end

```

in here, once as a developer writing the tests, we know that after 'et1_submit_claim' that we have created a claim - or should
I say 'POTENTIALLY created a claim' and that word is important - as we have not verified it - but lets not worry about that too much.

We could log what we know here as follows

```

audit_trail.add 'claim_created', id: "#{user.first_name} #{user.last_name}"

```

The name 'claim_created' is completely arbitrary, but consistency is key - dont call it 'claim_created' in one place and 'created_claim'
in another.  The 'id' is a way to uniquely identify the thing that you have added and it will mean something to the housekeeping
task for 'claim_created'.  These will have to be agreed / documented as they are used, again for consistency.

Then when we come to write the housekeeping process which runs at the end of every example AND at the end of a feature (not
sure if this is possible - but I can dream a little here), at the end of the entire test suite or even at the end of the test suite but only once a day.

So, we need to tell it when to clean up.  We will assume 'At the end of the test suite', but we can add other options such as

```

audit_trail.add 'claim_created', id: "#{user.first_name} #{user.last_name}", housekeeping: :example

```

Would mean tidy up after this example

or

```

audit_trail.add 'claim_created', id: "#{user.first_name} #{user.last_name}", housekeeping: :daily

```

would mean tidy up daily

etc.. etc..

The actual process of 'doing the housekeeping' is not part of the test, can use any 'cheating methods' that it chooses
(for example using the admin's REST JSON API instead of going via admin pages which is much slower).  The details of this will
be hidden away in features/support/housekeeping.rb for example.

When the underlying application changes and we notice that when a claim is created, some other thing is created to go along with
it (sorry, cannot think of an example) - but when it does - we change the housekeeping task to tidy that up as well.