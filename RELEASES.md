# API v2.2.1
**26/09/2018**

## New

_No new features_

## Changes

_No Changes_

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
