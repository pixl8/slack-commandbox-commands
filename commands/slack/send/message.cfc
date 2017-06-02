/**
 * Sends a message to a slack webhook
 *
 **/
component {

	property name="SlackCommandUtils" inject="SlackCommandUtils@slack-commandbox-commands";

	/**
	 * @message.hint    The message you wish to send. Check the Slack docs for formatting tips.
	 * @color.hint      Highlight color for the message. Can be a hex value, or one of 'good', 'warning' or 'danger'
	 * @webhookurl.hint Webhook to send message too. If not supplied, the global default webhook registered with 'slack set webhook' will be used.
	 **/
	function run(
		  required string message
		,          string color      = ""
		,          string webhookUrl = slackCommandUtils.getDefaultWebhook()
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
