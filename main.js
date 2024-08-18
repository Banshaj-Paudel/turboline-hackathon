function toggleChat() {
    const chatbox = document.getElementById('chatbox');
    chatbox.style.display = chatbox.style.display === 'none' || chatbox.style.display === '' ? 'flex' : 'none';
}

function handleKeyPress(event) {
    if (event.key === 'Enter') {
        sendMessage();
    }
}

function sendMessage() {
    const userInput = document.getElementById('user-input');
    const message = userInput.value.trim();

    if (message === '') return;

    displayMessage(message, 'user');
    userInput.value = '';

    fetch('http://127.0.0.1:5000/api/chat/answer', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json', // Ensure this header is set
        },
        body: JSON.stringify({ input: message }), // Convert the message object to JSON string
        mode: 'no-cors'
    })
    .then(response => {
        if (!response.ok) {
            throw new Error('Network response was not ok');
        }
        return response.json();
    })
    .then(data => {
        const botMessage = data.response;
        displayMessage(botMessage, 'bot');
    })
    .catch(error => {
        console.error('There was a problem with the fetch operation:', error);
        displayMessage('Something went wrong. Please try again later.', 'bot');
    });
}

function displayMessage(message, sender) {
    const chatboxBody = document.getElementById('chatbox-body');
    const messageElement = document.createElement('div');
    messageElement.classList.add('chatbox-message');

    const messageText = document.createElement('p');
    messageText.textContent = message;

    if (sender === 'user') {
        messageText.style.backgroundColor = '#007bff';
        messageText.style.color = 'white';
    } else if (sender === 'bot') {
        messageText.style.backgroundColor = '#e9ecef';
        messageText.style.color = 'black';
    }

    messageElement.appendChild(messageText);
    chatboxBody.appendChild(messageElement);
    chatboxBody.scrollTop = chatboxBody.scrollHeight;
}
