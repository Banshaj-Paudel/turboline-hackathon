function sendMessage() {
    // Get the value from the text box
    var message = document.getElementById('messageInput').value;

    // Create a new XMLHttpRequest object
    var xhr = new XMLHttpRequest();

    // Define the HTTP method and the URL of the API
    xhr.open('POST', 'http://127.0.0.1:5000/api/chat/answer', true);

    // Set the request header to specify that the request body contains JSON
    xhr.setRequestHeader('Content-Type', 'application/json');

    // Set up a callback function to handle the response
    xhr.onload = function () {
        if (xhr.status >= 200 && xhr.status < 300) {
            // Successfully received a response
            var response = JSON.parse(xhr.responseText);
            var responseMessage = response.response.choices[0].message.content;

            // Display the response in the responseContainer div
            document.getElementById('responseContainer').innerText = responseMessage;
        } else {
            // Handle errors
            console.error('Request failed. Status:', xhr.status);
        }
    };

    // Set up a callback function to handle errors
    xhr.onerror = function () {
        console.error('Request failed');
    };

    // Construct the JSON payload
    var payload = JSON.stringify({ input: message });

    // Send the request with the JSON payload
    xhr.send(payload);
}
