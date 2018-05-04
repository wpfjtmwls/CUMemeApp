from flask import request, render_template, jsonify
from functools import wraps # for decorators
import app

# Models
from app.meme.models.all import *
# DAO
from app.meme.dao import memes_dao

# Serializers
meme_schema         = MemeSchema()

# Blueprint
from app.meme import meme