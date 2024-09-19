Micro Blog Application

Create an Ubuntu, t3.medium, EC2 instance named "Jenkins" and install Jenkins. Be sure to configure the security group to allow for SSH (22) and HTTP (443) traffic in addition to the ports required for Jenkins (8080) and any other services needed.
Added necessary authorized keys to authorized_keys file.
Configure the server by installing 'python3.9', 'python3.9-venv', 'python3-pip', and 'nginx'.
Clone my repo, cd into it, activate a python virtual environment and install the application dependencies and other packages then set the environmental variable: FLASK_APP=microblog.py.
This command sets an environment variable called FLASK_APP, and it gives it the value microblog.py just for the current terminal session. This tells Flask which Python file to run as the main application when you use Flask commands. This variable will only work in this terminal window. If you open a new terminal, you'll need to set it up again.
Edit the NginX configuration file.
This Nginx configuration file tells Nginx to act as a middleman between the user and your Flask app. When someone tries to access your website, Nginx forwards the request to your Flask app. It also makes sure that the original website address and the client’s IP address are sent with the request so that the Flask app knows where the request is coming from.
Put the server's public IP address into the browser address bar. Success! Nginx webpage successfully loaded.
When the public ip address is entered, the browser sends an HTTP request on port 80 that is received by Ngnx because it is configured to be listening to all requests incoming to that port. The Nginx configuration specifies that requests should be forwarded to port:5000 where Gunicorn is running and serving the Flask app. When Nginx forwards the request, Gunicorn picks it up. Gunicorn then passes the request to the Flask application instance which processes the request and prepares a response after the Flask application logic (in microblog.py) processes the request. Flask sends the response back to Gunicorn, then Gunicorn forwards the HTTP response back to Nginx, and lastly, Nginx forwards the response back to the client (the browser).
Now it's time to automate the pipeline. Modify the Jenkinsfile and fill in the commands for the build and deploy stages.
The build stage should include all of the commands required to prepare the environment for the application. This includes creating the virtual environment and installing all the dependencies, setting variables, and setting up the databases.
Create a Python script called test_app.py to run a unit test of the application source code.
The deploy stage will run the commands required to deploy the application so that it is available on the internet.
In Jenkins, install the "OWASP Dependency-Check" plug-in, then configure it Name: "DP-Check" > check "install automatically" > Add Installer: "Install from github.com"
Create a MultiBranch Pipeline and run the build. Did the pipeline complete? Is the application running?

