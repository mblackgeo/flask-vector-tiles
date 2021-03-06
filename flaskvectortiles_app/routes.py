from flask import Response
from flask import current_app as app
from flask import jsonify, render_template


@app.route("/health")
def health() -> Response:
    """Return a JSON response containing status OK. Used for automatic health checks
    Returns
    -------
    flask.Response
        200 OK response
    """
    return jsonify({"status": "ok"})


@app.route("/")
def home() -> str:
    """Render the homepage of the website (the LeafletJS map)

    Returns
    -------
    str
        HTML of page to display at "/"
    """
    return render_template("index.html")
