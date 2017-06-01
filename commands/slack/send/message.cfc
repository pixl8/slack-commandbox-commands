/**
 * Sends a message to a slack webhook
 *
 **/
component {

	property name="SlackCommandUtils" inject="SlackCommandUtils@slack-commandbox-commands";

	/**
	 * @webhookurl.hint Webhook to send message too. If not supplied, the default webhook registered with slack add webhook will be used.
	 **/
	function run(
		  required string message
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
