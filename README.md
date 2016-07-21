# Part3-Test-gRPCAPI-Adapter-Docker

The docker compose bundle runs two containers: 
grpc container which runs the Test Grpc server and responsible for sharing the main.proto file using volumes and the other localhost container which adapter server on tomcat.

We make use of WinForms-based HTTP Client “I’m Only Resting” as the means of a test script to access the Test gRPC API via the JSON Adapter API. This is available at: http://www.swensensoftware.com/im-only-resting.

NOTE:
Ther following is specification for WinForms-based HTTP Client “I’m Only Resting”
  * The url to be provided would be of this format: http://{host-machine IP}:8080/generic-adapter/request
  * To read the proto file of the gRPC service to invoke appropriate service, the url to be provided would be of this format:      http://{host-machine IP}:8080/generic-adapter/readme
  * The method would be POST
  * The header would be of this format: content-type: application/x-www-form-urlencoded
