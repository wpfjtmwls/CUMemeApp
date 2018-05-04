from . import *

class Meme(Base):
    __tablename__ = 'memes'

    # Data Model Meme Table
    userid     = db.Column(db.String(120), unique=True, nullable=False)
    category   = db.Column(db.String(120), unique=False, nullable=False)
    subcategory= db.Column(db.String(120), unique=False, nullable=False)
    name       = db.Column(db.String(120), nullable=False)
    img_url    = db.Column(db.String(120), nullable=False)
    description= db.Column(db.String(120), nullable=False)

    def __init__(self, userid, category, subcategory, name, img_url, description):
        # initialize columns
        self.userid = userid
        self.category = category
        self.subcategory = subcategory
        self.name = name
        self.img_url = img_url
        self.description = description

    def __repr__(self):
		return '<Meme %r>' % self.name