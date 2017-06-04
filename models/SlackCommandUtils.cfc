component {
	property name="configService" inject="configService";

	function init() {
		return this;
	}

	public void function setDefaults() {
		var configSettings = configService.getConfigSettings();

		configSettings[ 'modules' ][ 'slack-commandbox-commands' ] = configSettings[ 'modules' ][ 'slack-commandbox-commands' ] ?: {};
		for( var key in arguments ) {
			if ( !IsNull( arguments[ key ] ?: NullValue() ) ) {
				configSettings[ 'modules' ][ 'slack-commandbox-commands' ][ key ] = arguments[ key ];
			}
		}

		configService.setConfigSettings( configSettings );
	}

	public any function getDefaultSetting( required string settingName, any defaultValue="" ) {
		var configSettings = configService.getConfigSettings();

		return configSettings[ 'modules' ][ 'slack-commandbox-commands' ][ arguments.settingName ] ?: arguments.defaultValue;
	}

	public struct function getDefaults() {
		var configSettings = configService.getConfigSettings();

		return configSettings[ 'modules' ][ 'slack-commandbox-commands' ] ?: {};
	}

	public void function clearDefaults() {
		var configSettings = configService.getConfigSettings();

		configSettings[ 'modules' ][ 'slack-commandbox-commands' ] = {};
	}

	public string function sendMessage(
		  required string  message
		, required string  webhook
		,          string  channel          = ""
		,          string  username         = ""
		,          string  emoji            = ""
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
		var result  = "";
		var payload = {};
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

		payload = { "attachments"=[ message ] };

		if ( Len( Trim( arguments.channel ) ) ) {
			payload[ "channel" ] = arguments.channel;
		}
		if ( Len( Trim( arguments.username ) ) ) {
			payload[ "username" ] = arguments.username;
		}
		if ( Len( Trim( arguments.emoji ) ) ) {
			payload[ "icon_emoji" ] = ":#arguments.emoji#:";
		}

		http url=arguments.webhook method="POST" timeout=30 result="result" {
			httpparam type="header" name="Content-Type" value="application/json";
			httpparam type="body" value=SerializeJson( payload );
		}

		if ( ( result.statuscode ?: "" ) contains "200" ) {
			return "";
		}

		return result.fileContent;
	}

	public numeric function getEpoch( date localDate=Now() ) {
		var nineteenSeventy = DateConvert( 'utc2Local', CreateDateTime( 1970, 1, 1, 0, 0, 0 ) )
	    return DateDiff( 's', nineteenSeventy, localDate );
	}
}
