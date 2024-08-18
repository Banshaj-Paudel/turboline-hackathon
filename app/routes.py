import requests
from flask import Blueprint, request, jsonify, current_app

bp = Blueprint('main', __name__)

@bp.route('/api/chat/answer', methods=['POST'])
def chat():
    user_input = request.json.get('input')
    
    if not user_input:
        return jsonify({"error": "Invalid input"}), 400

    # Moderation check
    if not is_input_safe(user_input):
        return jsonify({"error": "Your input seems like NSFW content, please try again"}), 403

    payload_input = f"Give an answer to this: {user_input}"
    
    payload = {
        "model": "gpt-3.5-turbo",
        "messages": [{
            "role": "system",
            "content": payload_input,
            "name": "string"
        }]
    }

    try:
        response = call_external_api(
            url=f"{current_app.config['API_BASE_URL']}/chat/completions",
            payload=payload
        )
        return jsonify({"response": response})
    except Exception as e:
        return jsonify({"error": str(e)}), 500

# Internal function to perform moderation check
def is_input_safe(input_text):
    payload = {
        "input": input_text,
        "model": "text-moderation-latest"
    }

    try:
        response = call_external_api(
            url=f"{current_app.config['API_BASE_URL']}/moderations",
            payload=payload
        )
        # Assuming the moderation API returns a field 'flagged' which is True if content is NSFW
        flagged = response.get('results', [{}])[0].get('flagged', False)
        return not flagged
    except Exception as e:
        print(f"Moderation check failed: {str(e)}")
        return False

# Utility function to call external API
def call_external_api(url, payload):
    headers = {
        'Content-Type': 'application/json',
        'X-TL-Key': '829218ab50a74714826ed54fad5c9e29'
    }
    response = requests.post(url, json=payload, headers=headers)

    if response.status_code == 200:
        return response.json()
    else:
        raise Exception(f"API request failed with status code {response.status_code}: {response.text}")
