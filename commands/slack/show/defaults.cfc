/**
 * Register global default webhook
 *
 **/
component {

	property name="SlackCommandUtils" inject="SlackCommandUtils@slack-commandbox-commands";

	function run(
		  string  webhookUrl
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
		var defaults = SlackCommandUtils.getDefaults();

		print.line( "" );
		print.line( "Slack message defaults:" );
		print.line( "=======================" );
		print.line( "" );
		print.line( "webhookUrl:       " & SerializeJson( defaults.webhookUrl       ?: ""    ) );
		print.line( "color:            " & SerializeJson( defaults.color            ?: ""    ) );
		print.line( "title:            " & SerializeJson( defaults.title            ?: ""    ) );
		print.line( "titleLink:        " & SerializeJson( defaults.titleLink        ?: ""    ) );
		print.line( "pretext:          " & SerializeJson( defaults.pretext          ?: ""    ) );
		print.line( "thumbnail:        " & SerializeJson( defaults.thumbnail        ?: ""    ) );
		print.line( "author:           " & SerializeJson( defaults.author           ?: ""    ) );
		print.line( "authorLink:       " & SerializeJson( defaults.authorLink       ?: ""    ) );
		print.line( "authorIcon:       " & SerializeJson( defaults.authorIcon       ?: ""    ) );
		print.line( "footer:           " & SerializeJson( defaults.footer           ?: ""    ) );
		print.line( "footerIcon:       " & SerializeJson( defaults.footerIcon       ?: ""    ) );
		print.line( "includeTimestamp: " & SerializeJson( defaults.includeTimestamp ?: false ) );
		print.line( "" );
		print.line( "" );

		return;
	}

}
