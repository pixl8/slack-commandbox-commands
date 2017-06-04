/**
 * Show global slack default settings for message sending
 *
 **/
component {

	property name="SlackCommandUtils" inject="SlackCommandUtils@slack-commandbox-commands";

	function run() {
		var defaults = SlackCommandUtils.getDefaults();

		print.line( "" );
		print.line( "Slack message defaults:" );
		print.line( "=======================" );
		print.line( "" );
		print.line( "webhook          : " & SerializeJson( defaults.webhook          ?: ""    ) );
		print.line( "channel          : " & SerializeJson( defaults.channel          ?: ""    ) );
		print.line( "username         : " & SerializeJson( defaults.username         ?: ""    ) );
		print.line( "emoji            : " & SerializeJson( defaults.emoji            ?: ""    ) );
		print.line( "color            : " & SerializeJson( defaults.color            ?: ""    ) );
		print.line( "title            : " & SerializeJson( defaults.title            ?: ""    ) );
		print.line( "titleLink        : " & SerializeJson( defaults.titleLink        ?: ""    ) );
		print.line( "pretext          : " & SerializeJson( defaults.pretext          ?: ""    ) );
		print.line( "thumbnail        : " & SerializeJson( defaults.thumbnail        ?: ""    ) );
		print.line( "author           : " & SerializeJson( defaults.author           ?: ""    ) );
		print.line( "authorLink       : " & SerializeJson( defaults.authorLink       ?: ""    ) );
		print.line( "authorIcon       : " & SerializeJson( defaults.authorIcon       ?: ""    ) );
		print.line( "footer           : " & SerializeJson( defaults.footer           ?: ""    ) );
		print.line( "footerIcon       : " & SerializeJson( defaults.footerIcon       ?: ""    ) );
		print.line( "includeTimestamp : " & SerializeJson( defaults.includeTimestamp ?: false ) );
		print.line( "" );
		print.line( "" );

		return;
	}

}
