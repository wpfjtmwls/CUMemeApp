import os


# Ensure Python path
basedir = os.path.abspath(os.path.dirname(__file__))

class Config(object):
  """
  Parent app configuration (extended by all environment configurations)
  """
  DEBUG = False
  TESTING = False
  CSRF_ENABLED = True
  CSRF_SESSION_KEY = "secret"
  SECRET_KEY = "not_this"
  THREADS_PER_PAGE = 2
  
  # Database info
  DB_NAME = os.environ['DB_NAME']
  DB_USER = os.environ['DB_USER']
  DB_PASS = os.environ['DB_PASS']
  DB_SERVICE = os.environ['DB_SERVICE']
  DB_PORT = os.environ['DB_PORT']
  SQLALCHEMY_DATABASE_URI = os.environ['DATABASE_URL']
class ProductionConfig(Config):
  """
  Production environment app configuration
  """
  DEBUG = False

class StagingConfig(Config):
  """
  Staging environment app configuration
  """
  DEVELOPMENT = True
  DEBUG = True

class DevelopmentConfig(Config):
  """
  Development environment app configuration
  """
  DEVELOPMENT = True
  DEBUG = True

class TestingConfig(Config):
  """
  Testing environment app configuration
  """
  TESTING = True
