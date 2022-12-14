# API Deployment for ML Model

#### Install Dependencies
```
python -m venv .venv
source .venv/Scripts/activate
pip install -r requirements.txt
```

#### Executing Python Script using uvicorn

```
uvicorn mlapi:app --reload --port 5000
```


#### Deployment to Heroku
Pre-requisites:
1. Procfile
    <p>-w states the number of workers, -k is the class of worker to run</p>

    ```
    web: gunicorn -w 2 -k uvicorn.workers.UvicornWorker mlapi:app
    ```
2. runtime.txt
    <p> run "python --version" to obtain runtime version

    ```
    python-3.9.5
    ```
3. requirements.txt
    <p> Manually write the requirements.in -> install the packages -> exit venv -> pip-compile requirements.in</p>

Uploading & Deploying to Heroku:

Refer to: [Heroku Deployment Documentation](https://devcenter.heroku.com/articles/git)
```
heroku login
heroku create -a ml-api-deployment-simple
git push heroku master
```

#### Test endpoint with POST method:

Endpoint: https://ml-api-deployment-simple.herokuapp.com/
```
{
    "YearsAtCompany":1,
    "EmployeeSatisfaction":0.01,
    "Position":"Non-Manager",
    "Salary":4.0
}
```