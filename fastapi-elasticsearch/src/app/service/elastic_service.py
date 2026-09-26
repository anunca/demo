import os
from elasticsearch import Elasticsearch
from elasticsearch.exceptions import RequestError

class ElasticService:
    index_name: str = "usage_collector"
    mapping: dict = {
        "mappings": {
            "properties": {
                "tenant_id": {"type": "text"},
                "guid": {"type": "text"},
                "personal_parameters": {"type": "object"},
            }
        }
    }
    index_message = f"Indsex '{index_name}'"

    def __init__(self):
        self.es = Elasticsearch(f"http://{os.getenv('ELASTICSEARCH_HOST')}:{os.getenv('ELASTICSEARCH_PORT')}")

    def create_index(self) -> str:
        if not self.es.indices.exists(index=self.index_name):
            try:
                self.es.indices.create(index=self.index_name, body=self.mapping)
                return f"{self.index_message} created."
            except RequestError as e:
                return f"Error creating index: {e.info}"
        else:
            return f"{self.index_message} already exists."

    def show_index(self) -> str:
        if self.es.indices.exists(index=self.index_name):
            return self.es.indices.get(index=self.index_name)
        else:
            return f"{self.index_message} does not exist."

    def delete_index(self) -> str:
        if self.es.indices.exists(index=self.index_name):
            self.es.indices.delete(index=self.index_name)
            return f"{self.index_message} deleted."
        else:
            return f"{self.index_message} does not exist."

    def upsert(self, data: dict) -> None:
        """Upsert data.
        Args:
            data (dict): The data to upsert.

        Returns:
            None:
        """
        self.es.update(
            index=self.index_name,
            id=id,
            body={
                "doc": data,
                "doc_as_upsert": True  # Creates the doc if it doesn't exist
            },
        )
