import requests
from flask import Blueprint, request, jsonify, current_app
import mysql.connector
from pymongo import MongoClient

bp = Blueprint('main', __name__)

@bp.route('/api/moderations', methods=['POST'])
def check_moderation():
    input_text = request.json.get('input')

    if not input_text:
        return jsonify({"error": "Invalid input"}), 400

    payload = {
    "input": input_text,
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


@bp.route('/api/chat/completions', methods=['POST'])
def chat():
    user_input = request.json.get('input')

    if not user_input:
        return jsonify({"error": "Invalid input"}), 400

    payload = {
    "model": "gpt-3.5-turbo",
    "messages": [{
        "role": "system",
        "content": user_input,
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
