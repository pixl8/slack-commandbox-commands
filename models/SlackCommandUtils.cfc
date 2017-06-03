component {
	property name="configService" inject="configService";

	function init() {
		return this;
	}

	public void function setDefaultWebhook( required string webhookUrl ) {
		var configSettings = configService.getConfigSettings();

		configSettings[ 'modules' ][ 'slack-commandbox-commands' ][ 'defaultWebhook' ] = arguments.webhookUrl;

		configService.setConfigSettings( configSettings );
	}

	public string function getDefaultWebhook() {
		var configSettings = configService.getconfigSettings();

		return configSettings[ 'modules' ][ 'slack-commandbox-commands' ][ 'defaultWebhook' ] ?: "";
	}

	public struct function sendMessage(
		  required string  message
		, required string  webhookUrl
		,          string  color            = ""
		,          string  title            = ""
		,          string  titleLink        = ""
		,          string  pretext          = ""
		,          string  author           = ""
		,          string  authorLink       = ""
		,          string  authorIcon       = ""
		,          string  footer           = ""
		,          string  footerIcon       = ""
		,          string  thumbnail        = ""
		,          boolean includeTimestamp = false
		,          numeric timestamp        = getEpoch()
	) {
		var result = "";
		var message = {
			"text" = arguments.message
		};

		if ( Len( Trim( arguments.color ) ) ) {
			message[ "color" ] = arguments.color;
		}
		if ( Len( Trim( arguments.title ) ) ) {
			message[ "title" ] = arguments.title;
		}
		if ( Len( Trim( arguments.titleLink ) ) ) {
			message[ "title_link" ] = arguments.titleLink;
		}
		if ( Len( Trim( arguments.pretext ) ) ) {
			message[ "pretext" ] = arguments.pretext;
		}
		if ( Len( Trim( arguments.thumbnail ) ) ) {
			message[ "thumb_url" ] = arguments.thumbnail;
		}
		if ( Len( Trim( arguments.author ) ) ) {
			message[ "author_name" ] = arguments.author;
		}
		if ( Len( Trim( arguments.authorLink ) ) ) {
			message[ "author_link" ] = arguments.authorLink;
		}
		if ( Len( Trim( arguments.authorIcon ) ) ) {
			message[ "author_icon" ] = arguments.authorIcon;
		}
		if ( Len( Trim( arguments.footer ) ) ) {
			message[ "footer" ] = arguments.footer;
		}
		if ( Len( Trim( arguments.footerIcon ) ) ) {
			message[ "footer_icon" ] = arguments.footerIcon;
		}
		if ( arguments.includeTimestamp ) {
			message[ "ts" ] = arguments.timestamp;
		}

		http url=arguments.webhookUrl method="POST" timeout=30 result="result" {
			httpparam type="header" name="Content-Type" value="application/json";
			httpparam type="body" value=SerializeJson( { "attachments"=[ message ] } );
		}

		return result;
	}

	private numeric function getEpoch( date localDate=Now() ) {
		var nineteenSeventy = DateConvert( 'utc2Local', CreateDateTime( 1970, 1, 1, 0, 0, 0 ) )
	    return DateDiff( 's', nineteenSeventy, localDate );
	}
}
