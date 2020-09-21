# Rails Programming Task

## Development
#### Up application
`docker-compose up`
Also you can seed database with demo data by: `docker-compose run app rake db:seed`

#### Run test with docker
Run tests that in ./spec folder `docker-compose run test rspec`
if you dont run `docker-compose up` before you will need to build development `rails-test:development` image using
`docker-compose build --no-cache --force-rm --pull app`  

Then at http://localhost:3001/charges you will able to get an API endpoint served serialized charges

