def test_health(client):
    response = client.get("/health")
    assert response.status_code == 200


def test_home_get(client):
    response = client.get("/")
    assert response.status_code == 200
