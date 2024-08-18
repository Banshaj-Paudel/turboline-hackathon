from flask import Flask
from config import Config

def create_app():
    app = Flask(__name__)
    app.config.from_object(Config)

    # Import routes here to avoid circular import
    from app import routes
    app.register_blueprint(routes.bp)

    return app
