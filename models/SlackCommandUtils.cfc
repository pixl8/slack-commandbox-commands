component {
	property name="configService" inject="configService";

	function init() {
		return this;
	}

	public void function storeDefaultWebhook(
		required string webhookUrl
	) {
		var configKey = "defaultslackwebhook";

		configService.setSetting( "defaultSlackWebhook", arguments.webhookUrl );
	}

	public string function getDefaultWebhook() {
		return configService.getSetting( "defaultSlackWebhook", "" );
	}

	public struct function sendMessage( required string message, required string webhookUrl ) {
		var result = "";
		http url=arguments.webhookUrl method="POST" timeout=30 result="result" {
			httpparam type="header" name="Content-Type" value="application/json";
			httpparam type="body" value=SerializeJson( { "attachments"=[ { "text"=arguments.message } ] } );
		}

		return result;
	}
}
