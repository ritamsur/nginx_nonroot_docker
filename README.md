Deploy Nginx with non-root previledge.
<br>
Test index.html file is present for testing purpose.First the image needs to be build and then start the container.
<br>
Below are the steps:
<br>
1)docker build -t nonrooti .
<<br>
Here the . denotes the Dockerfile path, if changed provide the right directory.
The image will be build with name nonrooti, change the same if required. 
<br>
2)docker run -d --name nrnginxc -p 8080:8080 nonrooti
<br>
Expose the port that has been mentioned in the dockerfile and nginx.conf. The container will be created with name nrnginxc, change the same if required.
<br> 
Once the container is in Running state, go to browser and check the following URL: http://localhost:8080
<br>
Else curl can also used - curl http://localhost:8080 
