from locust import HttpLocust, TaskSet, task
import locust.stats
import csv

class UserBehavior(TaskSet):
    @task
    def index(self):
        self.client.get("/home")

class WebsiteUser(HttpLocust):
    task_set = UserBehavior
    min_wait = 1000
    max_wait = 3000
