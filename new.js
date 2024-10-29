const response = await fetch("https://api.notifyz.dev/topics/34b570dd-502f-48db-9e05-b8d52934cbca/notify", {

	headers: {

		"Content-Type": "application/json",

		"X-Api-Key": "sk_O9QLEPQJNJQ910BCSPTNGLJ1YEFSMKF3"

	},

	method: "POST",

	body: JSON.stringify({

		title: "Hello world",

		body: "This is a test message",

		imageURL: "https://placehold.co/100x100",

		redirectURL: "https://notifyz.dev",

	})

});


if (response.ok) {

	console.log("Event sent successfully");

} else {

	console.error("Failed to send event -> ", response.statusText);

}