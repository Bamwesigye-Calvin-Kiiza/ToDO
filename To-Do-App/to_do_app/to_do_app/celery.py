import os
from celery import Celery
from django.conf import settings
from celery.schedules import crontab

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'to_do_app.settings')
app = Celery('to_do_app')

app.config_from_object('django.conf:settings', namespace='CELERY')

app.autodiscover_tasks()

@app.task(bind=True)
def debug_task(self):
    print("hello from celery")

@app.task
def print_hello():
    print('hello from function')

app.autodiscover_tasks(lambda:settings.INSTALLED_APPS)
app.conf.beat_schedule = {
    'add-every-1-minute' :{
        'task':'send_notification',
        'schedule':crontab(minute='*/1')
    }
}