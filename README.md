# wordpress-on-docker
Dockerized Wordpress. Ready to deploy to production!

This contains:
* MySQL Database
* Wordpress and PHP
* Nginx as webserver
* Letsencrypt Certbot for SSL

Clone the repo and move to the repo folder then follow along.

## Staging Deployment
make a copy of .env file:
```shell
cp example.env .env
```

Edit .env file and fill all the values:
```
nano .env
```

To start wordpress, run:
```
docker-compose up
```

This will do:
* Create and start MySQL server
* Create PHP environment and get the copy of wordpress files
* Setup Nginx server and serve wordpress directory
* Create Letsencrypt SSL in staging environment

To run in background use:
```
docker-compose up -d
```

To stop:
```
docker-compose down
```

If you want to stop and remove volumes (volume data will be deleted):
```
docker-compose down -v
rm -rf volumes
```


## Notes for Production Deployment

* Update domain name in nginx-conf-production/nginx.conf by replacing placeholder REPLACE_WITH_YOUR_DOMAIN with you actual domain where you want to deploy it.
* Make sure your domain is pointing to the server where you want to deploy it.
* Make sure `.env` file contains the data that you want to be used in production deployment.
* DOMAIN must only contain the actual domain (e.g. example.com) without any scheme (i.e. http or https) and parameter.
* Value of DOMAIN in `.env` must be same as the one in nginx-conf-production/nginx.conf.

#### Step 1
First run in staging environment to get staging certificates from certbot.
```
docker-compose up -d
```

Check the running service list:
```
docker-compose ps
```

`certbot` must be in `Exit 0` state and every other services must be in `UP` state. If not then you can debut the issue using:
```
docker-compose logs <service_name>
```

### Step 2
Once it is successful, we can take down the services:
```
docker-compose down -v
```

Now, we can proceed with production deployment.
```
docker-compose -f docker-compose-production.yml up -d
```

Check the service status with
```
docker-compose ps
```
to make sure everything is fine.

**Done!** Now you can open your domain in browser and continue with wordpress setup.



