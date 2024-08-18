import requests
from flask import Blueprint, request, jsonify, current_app
import mysql.connector
from pymongo import MongoClient

bp = Blueprint('main', __name__)

@bp.route('/api/answers', methods=['POST'])
def get_answers():
    question = request.json.get('question')
    documents = request.json.get('documents')
    examples = request.json.get('examples')

    if not question or not documents:
        return jsonify({"error": "Invalid input"}), 400

    payload = {
        "question": question,
        "documents": documents,
        "examples": examples
    }

    try:
        response = call_external_api(
            url=f"{current_app.config['API_BASE_URL']}/answers",
            payload=payload
        )
        return jsonify({"response": response})
    except Exception as e:
        return jsonify({"error": str(e)}), 500

@bp.route('/api/moderations', methods=['POST'])
def check_moderation():
    input_text = request.json.get('input')

    if not input_text:
        return jsonify({"error": "Invalid input"}), 400

    payload = {
    "input": "Are you a fucking nigga?",
    "model": "text-moderation-latest"
}

    try:
        response = call_external_api(
            url=f"{current_app.config['API_BASE_URL']}/moderations",
            payload=payload
        )
        return jsonify({"response": response})
    except Exception as e:
        return jsonify({"error": str(e)}), 500

@bp.route('/api/classifications', methods=['POST'])
def classify_text():
    query = request.json.get('query')
    examples = request.json.get('examples')

    if not query or not examples:
        return jsonify({"error": "Invalid input"}), 400

    payload = {
        "query": query,
        "examples": examples
    }

    try:
        response = call_external_api(
            url=f"{current_app.config['API_BASE_URL']}/classifications",
            payload=payload
        )
        return jsonify({"response": response})
    except Exception as e:
        return jsonify({"error": str(e)}), 500

@bp.route('/api/completions', methods=['POST'])
def create_completion():
    prompt = request.json.get('prompt')
    model = request.json.get('model', 'gpt-4')
    max_tokens = request.json.get('max_tokens', 100)

    if not prompt:
        return jsonify({"error": "Invalid input"}), 400

    payload = {
        "model": model,
        "prompt": prompt,
        "max_tokens": max_tokens
    }

    try:
        response = call_external_api(
            url=f"{current_app.config['API_BASE_URL']}/completions",
            payload=payload
        )
        return jsonify({"response": response})
    except Exception as e:
        return jsonify({"error": str(e)}), 500

@bp.route('/api/chat/completions', methods=['POST'])
def chat():
    user_input = request.json.get('input')

    if not user_input:
        return jsonify({"error": "Invalid input"}), 400

    payload = {
    "model": "gpt-3.5-turbo-0301",
    "messages": [{
        "role": "system",
        "content": user_input,
        "name": "string"
    }],
    "temperature": 1,
    "top_p": 1,
    "n": 1,
    "stream": false,
    "stop": null,
    "max_tokens": "inf",
    "presence_penalty": 0,
    "frequency_penalty": 0,
    "logit_bias": null,
    "user": "user-1234"
}

    try:
        response = call_external_api(
            url=f"{current_app.config['API_BASE_URL']}/chat/completions",
            payload=payload
        )
        return jsonify({"response": response})
    except Exception as e:
        return jsonify({"error": str(e)}), 500

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

# Database connection utility
def get_database_connection():
    db_type = current_app.config['DATABASE_TYPE']

    if db_type == 'mysql':
        conn = mysql.connector.connect(
            host=current_app.config['DB_HOST'],
            user=current_app.config['DB_USER'],
            password=current_app.config['DB_PASSWORD'],
            database=current_app.config['DB_NAME']
        )
        return conn

    elif db_type == 'mongodb':
        client = MongoClient(current_app.config['DB_HOST'])
        db = client[current_app.config['DB_NAME']]
        return db

    else:
        raise ValueError("Unsupported database type")

@bp.route('/api/data', methods=['GET'])
def get_data():
    conn = get_database_connection()

    if isinstance(conn, mysql.connector.MySQLConnection):
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM your_table")
        data = cursor.fetchall()
        cursor.close()
        conn.close()
        return jsonify({"data": data})

    elif isinstance(conn, MongoClient):
        collection = conn.your_collection
        data = list(collection.find({}))
        return jsonify({"data": data})

    else:
        return jsonify({"error": "Unsupported database type"}), 400
