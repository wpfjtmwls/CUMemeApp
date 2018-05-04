from marshmallow_sqlalchemy import ModelSchema
from . import db

class Base(db.Model):
  """
  Base database model
  """
  __abstract__ = True
  id         = db.Column(db.Integer, primary_key =True)
