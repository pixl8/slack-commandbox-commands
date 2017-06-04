/**
 * Clear any defaults set for Slack messaging.
 *
 **/
component {

	property name="slackCommandUtils" inject="SlackCommandUtils@slack-commandbox-commands";

	function run() {
		SlackCommandUtils.clearDefaults();

		print.line( "" );
		print.greenLine( "Thank you, global defaults have been cleared." );

		command( "slack show defaults" ).run();

		return;
	}

}
