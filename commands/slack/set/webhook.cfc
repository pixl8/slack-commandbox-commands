/**
 * Register global default webhook
 *
 **/
component {

	property name="SlackCommandUtils" inject="SlackCommandUtils@slack-commandbox-commands";

	/**
	 * @webhookurl.hint Default webhook to use when no webhook supplied to slack message command
	 **/
	function run(
		required string webhookUrl
	) {
		while( !arguments.webhookUrl.len() ) {
			arguments.webhookUrl = shell.ask( "Enter your slack Webhook URL: " );
		}

		SlackCommandUtils.setDefaultWebhook( argumentCollection=arguments );

		print.greenLine( "Thank you, global default slack webook has been set to [#arguments.webhookUrl#]" );

		return;
	}

}
