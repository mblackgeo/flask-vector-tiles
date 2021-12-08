import bjoern

from flaskvectortiles_app import create_app

bjoern.listen(wsgi_app=create_app(), host="0.0.0.0", port=8000, reuse_port=True)
bjoern.run()
