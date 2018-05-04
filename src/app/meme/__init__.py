from flask import Blueprint
from app import *

# Kanban Blueprint
meme = Blueprint('meme', __name__, url_prefix='/')

# Import all endpoints
from controllers.memes_controller import *
