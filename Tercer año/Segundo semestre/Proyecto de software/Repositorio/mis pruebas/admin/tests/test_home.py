from src.web import create_app

app = create_app()
client = app.test_client()

def test_home():
    response = client.get('/')
    assert response.status_code == 200
    assert response.data == b"Hello, World!"


