Slack Commands for CommandBox
-----------------------------

Send messages to Slack from the Commandbox command line.


## Installation

Install into Commandbox with `install slack-commandbox-commands`.

## Basic usage

First, [register a webhook with Slack](https://slack.com/apps/A0F7XDUAZ-incoming-webhooks). Then, in CommandBox:

```
# set global default webhook URL (do this once)
slack set defaults webhook=$webhook_url;

# send messages
box slack message "hello world";
```

## Full list of commands

Append `help` to each for documentation.

```
slack send message
slack set defaults
slack show defaults
slack clear defaults
```

## Full list of settable defaults

All defaults set become defaults for arguments that can be passed to `slack send message` command.

```
webhook           Default webhook to use when no webhook supplied to slack message command
channel           Default channel for all slack messages (if different from that configured in webhook)
username          Default username for all slack messages (if different from that configured in webhook)
emoji             Default emoji for all slack messages (if different from that configured in webhook)
color             Default highlight color for all slack messages. Can be a hex value, or one of 'good', 'warning' or 'danger'
title             Default title for all slack messages
titleLink         Default title link for all slack messages
pretext           Default pretext that will appear before message attachments
thumbnail         Default thumbnail (URL) that will appear to the right of slack messages
author            Default author name to use with messages
authorLink        Default hyperlink for the author
authorIcon        Default icon (URL) for the author
footer            Default footer text to appear at the bottom of slack messages
footerIcon        Default icon to accompany the message footer
includeTimestamp  Default choice of whether or not to include a timestamp in messages
```

