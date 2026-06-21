import xmltodict

class XMLService:
    def __init__(self):
        pass

    def parse_to_dict(self, xml_string: str) -> dict:
        """Helper to parse XML string to dictionary.

        Args:
            xml_string (str): The XML string.

        Returns:
            dict: The dictionary.

        Raises:
            ValueError: If input is not a valid XML.
        """        
        try:
            return xmltodict.parse(xml_string)
        except Exception as e:
            raise ValueError(f"Invalid XML: {e}")
