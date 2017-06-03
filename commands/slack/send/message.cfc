/**
 * Sends a message to a slack webhook
 *
 **/
component {

	property name="SlackCommandUtils" inject="SlackCommandUtils@slack-commandbox-commands";

	/**
	 * @message.hint          The message you wish to send. Check the Slack docs for formatting tips.
	 * @title.hint            Optional title of the slack message
	 * @titleLink.hint        Optional link for the slack message title
	 * @color.hint            Highlight color for the message. Can be a hex value, or one of 'good', 'warning' or 'danger'
	 * @pretext.hint          Pretext that will appear before the message attachment
	 * @thumbnail.hint        Thumbnail (URL) that will appear to the right of the slack message.
	 * @author.hint           Author name to use with the message
	 * @authorLink.hint       Hyperlink for the author
	 * @authorIcon.hint       Icon (URL) for the author
	 * @footer.hint           Footer text to appear at the bottom of the slack message
	 * @footerIcon.hint       Icon to accompany the message footer
	 * @includeTimestamp.hint Whether or not to include a timestamp
	 * @timestamp.hint        Timestamp (epoch time) of the message. Only used when includeTimestamp is true + defaults to the current time.
	 * @webhookurl.hint       Webhook to send message too. If not supplied, the global default webhook registered with 'slack set webhook' will be used.
	 **/
	function run(
		  required string  message
		,          string  color            = ""
		,          string  title            = ""
		,          string  titleLink        = ""
		,          string  pretext          = ""
		,          string  thumbnail        = ""
		,          string  author           = ""
		,          string  authorLink       = ""
		,          string  authorIcon       = ""
		,          string  footer           = ""
		,          string  footerIcon       = ""
		,          boolean includeTimestamp = false
		,          numeric timestamp
		,          string  webhookUrl = slackCommandUtils.getDefaultWebhook()
	) {
		while( !arguments.message.len() ) {
			arguments.message = shell.ask( "Enter the message you wish to send" );
		}

		while( !arguments.webhookUrl.len() ) {
			arguments.webhookUrl = shell.ask( "Enter your slack Webhook URL: " );
		}

		SlackCommandUtils.sendMessage( argumentCollection=arguments );

		return;
	}

}
