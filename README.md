Slack Commands for CommandBox
-----------------------------

A super simple commandbox command to post messages to Slack.

## Installation

Install into Commandbox with `install slack-commandbox-commands`.

## Usage

First, [register a webhook with Slack](https://slack.com/apps/A0F7XDUAZ-incoming-webhooks). Then, in CommandBox:

```
# set global default webhook URL (do this once)
box slack set webhook $webhook_url;

# send messages
box slack message "hello world";
```
