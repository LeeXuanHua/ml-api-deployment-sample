#! /usr/bin/env bash

app_name="ml-api-deployment-simple"

echo "Logging in to Heroku..."
sleep 0.5
heroku login

echo "Creating app in Heroku..."
sleep 0.5
heroku create -a $app_name

echo "Deploying to Heroku..."
sleep 0.5
git push heroku master

echo "Testing deployment..."
sleep 0.5
echo -en "Output: "
curl -X POST -H "Content-Type: application/json" -d '{
    "YearsAtCompany":1,
    "EmployeeSatisfaction":0.01,
    "Position":"Non-Manager",
    "Salary":4.0
}' "https://$app_name.herokuapp.com/"