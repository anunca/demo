import os
from diagrams import Diagram
from diagrams.aws.compute import EC2
from diagrams.aws.network import ELB
from diagrams.aws.database import RDS

output_dir = "/app/diagram"
filename = os.path.join(output_dir, "Simple Web Service")

with Diagram(name=filename, show=False):
    ELB("Load Balancer") >> EC2("Web Server") >> RDS("Database")
