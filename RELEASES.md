# v1.1.1 - Admin v1.4.1 & API v2.4.1
**Scheduled 11/10/2018**

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

No downtime expected

No risk expected

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
