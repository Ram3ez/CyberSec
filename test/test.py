from gradio_client import Client

client = Client("R1shab/second_review")
result = client.predict(
	url="goo2gle.com",
	api_name="/predict"
)
print(result)