# 1.7.11 - ET3 v3.2.4, ET1 v4.2.8

**13/05/2019**

## New


## Changes

* ET1, ET3: Added welsh banner to show downtime

## Fixes


## Security


## Performance


## Technical Debt Reduction



## Info

Deployment by Gary

No downtime expected/observed

No risk expected/observed

# 1.7.10 - API v2.8.1, Admin v1.8.6, ATOS v1.3.7, ET3 v3.2.2, ET1 v4.2.6

**07/05/2019**

## New


## Changes

* API, Admin, ATOS,ET1, ET3: Enable Azure staging deployments

## Fixes


## Security


## Performance


## Technical Debt Reduction



## Info

Deployment by Stath

Note: This deployment was to Azure Staging ahead of Penetration Testing

No downtime expected/observed

No risk expected/observed

# 1.7.9 - ATOS v1.3.6, ET1 v4.2.5, ET3 v3.2.1

**03/05/2019**

## New


## Changes

* ATOS: Add Azure configuration for file storage

## Fixes

* ET1: Fix a non-production bug in ET1

## Security


## Performance


## Technical Debt Reduction

* ATOS, ET1, ET3: Low risk library updates (RST-1871, RST-1861, RST-1872)

## Info

Deployment by Stath

No downtime expected - ET1 had some downtime due to a faulty instance

No risk expected - ET1 users may have been unable to access ET1 due to the above

# 1.7.8 - Admin v1.8.5, API v2.8.0, ET3 v3.2.0

**30/04/2019**

## New

* ET3: Add footer and legal pages to ET (RST-1616, 1742, 1754, 1755)

## Changes

* API: Add office data to metadata when creating a claim (RST-1657)

## Fixes


## Security


## Performance


## Technical Debt Reduction

* ADMIN, API, ET3: Low risk library updates done (RST-1854, RST-1853, RST-1566, RST-1568)

## Info

Deployment by Stath

No downtime expected/observed

No risk expected/observed

# 1.7.7 - ET1 v4.2.4, ET3 v3.1.2, API v2.7.6, Admin v1.8.4, ATOS v1.3.5

**25/04/2019**

## New

* API side validation of csv file in preparation for azure phase 2 (not yet used)
* Duplicate filtering - When ET1 retries, any duplicates generate will now be filtered at API level
* Import claim command added in API ready for azure phase 2
* System is now more configurable ready for azure


## Changes

* ET3 Clears session at the beginning of the form to ensure noone elses data can be viewed from previous session

## Fixes

* RST-1824 - Email was trying to be sent before pdf was generated - raising sentry error

## Security

* Updates to fix vulnerability in 'libxslt' linux library in all 5 services

## Performance

* 

## Technical Debt Reduction

* Low risk library updates done

## Info

Deployment by Gary

No downtime expected/observed

No risk expected/observed



# 1.7.6 - ET1 v4.2.3, ET3 v3.1.0, API v2.7.4, Admin v1.8.3, ATOS v1.3.4

**14/03/2019**

## New

_No new functionality_

## Changes

*

## Fixes

* Fixes for azure in all systems (not yet used)
* API now does file transfer work as a background job - ensuring the web server comes back quicker - reducing timeouts in ET1

## Security

* All systems upgraded to Rails 5.2.2.1 due to a critical vulnerability

## Performance

*

## Technical Debt Reduction

*

## Info

Deployment by Gary

No downtime expected/observed

No risk expected/observed



# 1.7.5 - ET1 v4.2.2, ET3 v3.0.2, API v2.7.3, Admin v1.8.2, ATOS v1.3.3

**25/02/2019**

## New

_No new functionality_

## Changes

* API create response (ET3 submission) can now handle azure file data - ready for changes to ET3 (in progress)
* API create claim (ET1 submission) can now handle azure file data - ready for changes to ET1 (in progress)
* Admin now azure ready (switchable - not yet in use)

## Fixes

* ATOS file transfer application now boots in azure mode (not yet used)

## Security

* Admin has had its login system (devise) upgraded to latest version

## Performance

* API Web server changed to higher performance 'puma' to hopefully address timeout issues or at least reduce them
* Logging improvements
* Reduce code base by removing old payment code from when fees were removed 2 years ago
* Simplified the 'state' of a claim to reduce sidekiq errors

## Technical Debt Reduction

* Gem updates (low risk) simply to get the code base up to date (ET1 and ET3)

## Info

Deployment by Gary

No downtime expected/observed

No risk expected/observed


# 1.7.4 - API v4.2.1

**15/02/2019**

## New

_No new functionality_

## Changes

Several changes getting ready for azure, none of which are enabled yet

## Fixes

* Bug Fix - RST-1711 API - Live Issue - CSV file was failing

## Security

_No security fixes_

## Performance

_No performance changes_

## Info

Deployment by Gary

No downtime expected/observed

No risk expected/observed

# 1.7.3 - ET1 v4.2.1

**12/02/2019**

## New

_No new functionality_

## Changes

_No functionality changes_

## Fixes

_No bug fixes_

## Security

_No security fixes_

## Performance

* ET1 - Attempt at reducing the number of timeouts reported in sidekiq (RST-1706)

## Info

Deployment by Gary

No downtime expected/observed

No risk expected/observed

# 1.7.2 - ET3 v3.0.1

**07/02/2019**

## New

_No new functionality_

**NB: Welsh will be enabled in prod with this release**

## Changes

* **ET3:** Request claimant's full name (RST-1530)

## Fixes

* **ET3:** Two string amendments for Welsh (RST-1645, RST-1646)

## Security

* **ET3:** Gem updates

## Info

Deployment by Stath

No downtime expected/observed

No risk expected/observed

_Note: Welsh to be enabled in production by Ben_

# 1.7.1 - API v2.7.1, ATOS File Transfer v1.3.2

**31/01/2019**

## New

_No new functionality_

## Changes

* API and ATOS File Transfer - RST 1654 & RST 1666 - No functionality changes, this is simply to allow developers to switch into azure mode for testing etc...  

## Fixes

* Bug Fix - RST-1674 - API should handle case insensitive ET1 filename for csv and rtf, causing problems for ET1 claims when using uppercase file extensions

## Security

* _No security updates_

## Info

Deployment by Gary

No downtime expected/observed

No risk expected/observed


# 1.7.0 - Admin v1.8.1, API v2.7.0, ET1 v4.2.0, ET3 v3.0.0
**23/01/2019**

## New

* **ET1:** Add tracking for all sidekiq failed jobs (RST-1622)
* **API:** Add ability to use different template, such as EN/CY email templates (RST-1511)
* **ET3:** Welsh translation of ET3 is hidden behind an environment variable (RST-1510)
* **ET3:** Add test coverage (non-prod)

## Changes

* **ET1:** Ensure empty hash is sent to API when 'no address' is meant (RST-1630)
* **API:** Add handling for the above (RST-1629)
* **Admin:** Improve performance on Claims page by removing dropdown filters (RST-1621)
* **API:** Refactor test code to prevent warnings (non-prod change)
* **ET3:** Request representative's full name (RST-1610)
* **ET3:** Request respondent's full name (RST-1611)

## Fixes

* **API:** Fix a bug preventing ET1 from performing postcode lookups (RST-1627)

## Security

* **Admin:** Update Rubyzip gem (RST-1501)
* **API:** Upgrade pg, unicorn, site_prism, aws-sdk-s3 and pdf-forms gems. (RST-1568)
* **API:** Remove puma gem (RST-1568)
* **ET3:** Upgrade chromedriver-helper, selenium-webdriver, gecko-webdriver, faker, dotenv-rails, webmock and capybara screenshot (RST-1566)
* **ET3:** Upgrade unicorn, uk_postcode, dropzonejs-rails, uglifier and remove puma (RST-1568)

## Info

Deployment by Stath

No downtime expected/observed

No risk expected/observed

# 1.6.0 - Admin v1.8.0, API v2.6.0, ATOS v1.3.1, ET1 v4.1.2, ET3 v2.3.2
**20/12/2018**

## New

_No new features_

## Changes

* **API, ATOS, ET3:** Upgrade some dependencies (RST-1566)
* **Admin, API:** Refactor ET1 claim data to support `primary_respondent`, `secondary_respondent` and `primary_representative` (RST-1533)

## Fixes

* **API:** Fix a database seeding issue that mainly impacted on testing (RST-1583)
* **ET1**: Fix date fields allowing two digit dates that defaulted to the 1900s (RST-1557)

## Security

* **Admin, API, ATOS, ET1, ET3:** Upgrade to Rails 5.2.2 (RST-1548)

## Info

Deployment by Stath

No downtime expected

No risk expected

# 1.5.1
**12/12/2018**

## New

_No new features_

## Changes

* ADMIN: Added the ability to specify a month and year for the Policy Data CSV.

## Fixes

_No fixes_

## Security

_No security updates_

## Info

Deployment by Stath

No downtime expected/observed

No risk expected/observed

# v1.5.0
**14/11/2018**

## New

Added ability to send claims and responses to multiple output queues ready for ATOS box rebuild (RST-1516)

## Changes

_No other changes_

## Fixes

_No fixes_

## Security

_No security updates_

## Info

Deployment by Gary

No downtime expected/observed

No risk expected/observed


# v1.4.0 - ET1 v4.0.0
**14/11/2018**

## New

* **ET1:** Now with added Welsh!

## Changes

_No other changes_

## Fixes

_No fixes_

## Security

_No security updates_

## Info
Deployment by Stath

No downtime expected/observed

No risk expected/observed

# v1.3.0 - ATOS v1.2.3, ET3 v2.3.1, Admin v1.6.0 & API v2.5.1
**12/11/2018**

## New

* **Admin:** Add validation to new (and existing) usernames. (RST-1435)

## Changes

* **API:** Reference the updated ATOS gem, with increased security. (RST-1500)
* **ET3:** Improve testing around the RTF upload. (RST-1473)

## Fixes

## Security

* **API:** Update minio for testing uploads
* **Admin, API, ATOS & ET3:** Update loofah gem, as a vulnerability was discovered in the version we were using. (RST-1492)
* **ATOS:** Update other vulnerable gems (RST-1492)

## Info
Deployment by Stath

No downtime expected/observed

No risk expected/observed

# v1.2.0 - ET1 v3.1.0, ET3 v2.3.0, Admin v1.5.0 & API v2.5.0
**01/11/2018**

## New

* **ET1 & ET3:** Add Google Tag Manager for better analytics. (RST-1424) 
* **Admin:** Add rake task for Policy Team's data extraction. (RST-1483 & RST-1488)

## Changes

* **ET1:** Refactored views to remove Rails presenters as they add complexity.
ET1 views are now easier for developers to work with. (RST-1440)
* **ET1:** Allow PDFs to be flattened based upon environment configuration.
We can now retrieve answers more easily in environments other than test,
although this is still flattened by default in production.
* **ET3:** Removed bootsnap for developers and test builds as it causes issues while debugging.
It remains as is in production environments.
* **ET3:** Add the ability to run a developer version of S3.
This means we can test the rtf upload more reliably. (RST-1277)
* **API:** Make changes in the database to ensure `employment_details` are properly shown as empty when a Claim is first made. (RST-1483)

## Fixes

* **API:** Fix a bug where hidden UTF characters were preventing ATOS from working properly.
This will enable some cases which were held in sidekiq to go through.
* **API:** Backdate the change to empty `employment_details` on all existing Claims. (RST-1483)

## Security
_No updates_

## Info
Deployment by Stath

No downtime expected / observed

Potential risk as a data migration will take place on production data for Claims.
This has been tested locally with no issues.

No risks were observed.

# v1.1.1 - Admin v1.4.1 & API v2.4.1
**11/10/2018**

## New

_No new features_

## Changes

* **Admin:** Logging changes

## Fixes

* **Admin:** Remove spaces from the front and end of usernames. This caused users from the CSV import to have difficulty logging in as their usernames were incorrect. (RST-1416)
* **API:** Fix a bug where an ET3 RTF could be overwritten if two were uploaded in a short space of time. (RST-1457) 

## Security
_No changes_

## Info
Deployment by Stath

No downtime expected/observed

No risk expected/observed

# v1.1.0 - Bug fix for ET1

## Security

No changes

## New

No new functionality

## Changes

No changes

## Fixes

* ET1 v3.0.1 - RST-1447 Claims in dead queue on sidekig.  A bug fix to allow a post code such as '1086' through which validates ok, but the pdf code failed

# API 2.4.0, ET1 3.0.0 and ET3 2.2.1
**9/10/2018**

## New

## Security

* Updated vulnerable gems in ET3 (RST-1432)

## Changes

* API change to V2 - no functionality will change as a result of this, but this enables us to get away from the old XML way of doing things and should resolve the problems that we get when sending large csv files from ET1
* ET3 Header change on confirmation page (RST-1426)

## Fixes

None

# Admin v1.4.0 & API v2.3.0
**01/10/2018**

## New

* **ADMIN:** Admins and Super Users can now create, edit and delete users via the admin portal, without requiring a CSV file. Super users cannot assign administrator role. (RST-1314)

## Changes

* **API:** Migrations in API DB to support admin user roles. (RST-1314)

## Fixes

_No new features_

## Info
Deployment by Stath

No downtime expected/observed

No risk expected/observed

# API v2.2.1 and ET1 v2.0.1
**26/09/2018**

## New

_No new features_

## Changes

* ET1 - Improved logging

## Fixes

* RST-1354 - PRODUCTION PROBLEM: UTF-8 encoded files. All files going to ethos will now be in 'windows-1252' code page (suitable for windows server 2003).  This has been verified as working with CGI

## Info
Deployed by Gary

No downtime expected/observed

As this changes the files going to ETHOS, there is a risk that ETHOS may reject these files.  This has been mitigated by producing an example file and requesting that this was tested.

# API v2.2.0 & ET3 v2.2.0
**24/09/2018**

## New

_No new features_

## Changes

* The ET3 form submission page and ET3 confirmation email no longer show the time of submission. However, they show the day of submission as per London local time, i.e. 11pm could be the next day depending on BST or GMT. (RST-1422)
* The ET3 session expiry page link now says "Return to Employment Tribunal Response" instead of "Service Homepage". (RST-1282)

## Fixes

_No new features_

## Info
Deployed by Stath

No downtime expected/observed

No risks expected/observed
