"""Initialize Flask Application."""
from flask import Flask

__version__ = "0.1.0"
__all__ = ["__version__", "create_app"]


def create_app() -> Flask:
    """Construct the core application."""
    app = Flask(__name__)

    with app.app_context():
        from . import routes  # noqa: F401

        return app
