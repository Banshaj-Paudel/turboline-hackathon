from flask import Flask
from flask_cors import CORS  # Import CORS
from config import Config

def create_app():
    app = Flask(__name__)
    app.config.from_object(Config)

    # Initialize CORS with default settings (allowing all origins)
    CORS(app)
    CORS(app, resources={r"/api/*": {"origins": "*"}})

    # Import routes here to avoid circular import
    from app import routes
    app.register_blueprint(routes.bp)

    return app
