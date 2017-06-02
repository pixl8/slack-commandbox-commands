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
		  required string message
		, required string webhookUrl
		,          string color = ""
	) {
		var result = "";
		var message = {
			"text" = arguments.message
		};

		if ( Len( Trim( arguments.color ) ) ) {
			message[ "color" ] = arguments.color;
		}

		http url=arguments.webhookUrl method="POST" timeout=30 result="result" {
			httpparam type="header" name="Content-Type" value="application/json";
			httpparam type="body" value=SerializeJson( { "attachments"=[ message ] } );
		}

		return result;
	}
}
