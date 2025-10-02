from gradio_client import Client

client = Client("ram3ez/cyberSec")
result = client.predict(
	url="goo2gle.com",
	api_name="/predict"
)
print(result)