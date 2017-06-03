Slack Commands for CommandBox
-----------------------------

Send messages to Slack from the Commandbox command line.


## Installation

Install into Commandbox with `install slack-commandbox-commands`.

## Usage

First, [register a webhook with Slack](https://slack.com/apps/A0F7XDUAZ-incoming-webhooks). Then, in CommandBox:

```
# set global default webhook URL (do this once)
slack set defaults webhook=$webhook_url;

# send messages
box slack message "hello world";
```

## Full list of commands

```
slack send message
slack set defaults
slack show defaults
slack clear defaults
```

For all commands, append ` help` to see expected arguments and hints:

```
slack send message help
slack set defaults help
slack show defaults help
slack clear defaults help
```
