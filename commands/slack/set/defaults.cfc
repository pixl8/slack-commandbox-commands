/**
 * Register global default settings for sending messages to slack
 * with the 'slack send message' command.
 *
 **/
component {
	property name="slackCommandUtils" inject="SlackCommandUtils@slack-commandbox-commands";

	/**
	 * @webhook.hint          Default webhook to use when no webhook supplied to slack message command
	 * @channel.hint          Default channel for all slack messages (if different from that configured in webhook)
	 * @username.hint         Default username for all slack messages (if different from that configured in webhook)
	 * @emoji.hint            Default emoji for all slack messages (if different from that configured in webhook)
	 * @title.hint            Default title for all slack messages
	 * @titleLink.hint        Default title link for all slack messages
	 * @color.hint            Default highlight color for all slack messages. Can be a hex value, or one of 'good', 'warning' or 'danger'
	 * @pretext.hint          Default pretext that will appear before message attachments
	 * @thumbnail.hint        Default thumbnail (URL) that will appear to the right of slack messages
	 * @author.hint           Default author name to use with messages
	 * @authorLink.hint       Default hyperlink for the author
	 * @authorIcon.hint       Default icon (URL) for the author
	 * @footer.hint           Default footer text to appear at the bottom of slack messages
	 * @footerIcon.hint       Default icon to accompany the message footer
	 * @includeTimestamp.hint Default choice of whether or not to include a timestamp in messages
	 **/
	function run(
		  string  webhook
		, string  channel
		, string  username
		, string  emoji
		, string  color
		, string  title
		, string  titleLink
		, string  pretext
		, string  thumbnail
		, string  author
		, string  authorLink
		, string  authorIcon
		, string  footer
		, string  footerIcon
		, boolean includeTimestamp
	) {
		SlackCommandUtils.setDefaults( argumentCollection=arguments );

		print.line( "" );
		print.greenLine( "Thank you, global defaults have been set." );

		command( "slack show defaults" ).run();

		return;
	}

}
